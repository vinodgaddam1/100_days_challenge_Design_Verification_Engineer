// ============================================================
// Asynchronous (dual-clock) FIFO
// Gray-coded pointers + 2-flop synchronizers for safe CDC
// ============================================================

module fifo #(
    parameter DEPTH = 16,
    parameter WIDTH = 8
)(
    input                  wr_clk,
    input                  rd_clk,
    input                  rst,        // active-high, used in both clock domains

    // Write side
    input      [WIDTH-1:0] wdata,
    input                  wr_en,
    output reg             full,
    output reg             overflow,

    // Read side
    output reg [WIDTH-1:0] rdata,
    input                  rd_en,
    output reg             empty,
    output reg             underflow
);

    localparam ADDR_WIDTH = $clog2(DEPTH);

    // Memory
    reg [WIDTH-1:0] mem [0:DEPTH-1];

    // Binary + Gray pointers. Width = ADDR_WIDTH+1
    // (extra MSB is the "wrap bit" used to distinguish full vs empty)
    reg  [ADDR_WIDTH:0] wr_ptr_bin,  wr_ptr_gray;
    reg  [ADDR_WIDTH:0] rd_ptr_bin,  rd_ptr_gray;

    wire [ADDR_WIDTH:0] wr_ptr_bin_next, wr_ptr_gray_next;
    wire [ADDR_WIDTH:0] rd_ptr_bin_next, rd_ptr_gray_next;

    // 2-flop synchronizers (each pointer crosses into the OTHER clock domain)
    reg  [ADDR_WIDTH:0] wr_ptr_gray_rd1, wr_ptr_gray_rd2; // wr_ptr_gray synced into rd_clk
    reg  [ADDR_WIDTH:0] rd_ptr_gray_wr1, rd_ptr_gray_wr2; // rd_ptr_gray synced into wr_clk

    wire full_next, empty_next;

    integer i;

    // ---------------------------------------------------------
    // Next-pointer computation (combinational)
    // ---------------------------------------------------------
    assign wr_ptr_bin_next  = wr_ptr_bin + (wr_en && !full);
    assign wr_ptr_gray_next = (wr_ptr_bin_next >> 1) ^ wr_ptr_bin_next;

    assign rd_ptr_bin_next  = rd_ptr_bin + (rd_en && !empty);
    assign rd_ptr_gray_next = (rd_ptr_bin_next >> 1) ^ rd_ptr_bin_next;

    // full: next write-gray-pointer equals synced read pointer with
    // top two bits inverted (standard Gray-code full check)
    assign full_next  = (wr_ptr_gray_next == {~rd_ptr_gray_wr2[ADDR_WIDTH:ADDR_WIDTH-1],
                                                rd_ptr_gray_wr2[ADDR_WIDTH-2:0]});

    // empty: next read-gray-pointer equals synced write pointer exactly
    assign empty_next = (rd_ptr_gray_next == wr_ptr_gray_rd2);

    // ---------------------------------------------------------
    // Write-side synchronizer: bring rd_ptr_gray into wr_clk domain
    // ---------------------------------------------------------
    always @(posedge wr_clk) begin
        if (rst) begin
            rd_ptr_gray_wr1 <= 0;
            rd_ptr_gray_wr2 <= 0;
        end else begin
            rd_ptr_gray_wr1 <= rd_ptr_gray;
            rd_ptr_gray_wr2 <= rd_ptr_gray_wr1;
        end
    end

    // ---------------------------------------------------------
    // Read-side synchronizer: bring wr_ptr_gray into rd_clk domain
    // ---------------------------------------------------------
    always @(posedge rd_clk) begin
        if (rst) begin
            wr_ptr_gray_rd1 <= 0;
            wr_ptr_gray_rd2 <= 0;
        end else begin
            wr_ptr_gray_rd1 <= wr_ptr_gray;
            wr_ptr_gray_rd2 <= wr_ptr_gray_rd1;
        end
    end

    // ---------------------------------------------------------
    // Write logic (wr_clk domain)
    // ---------------------------------------------------------
    always @(posedge wr_clk) begin
        if (rst) begin
            wr_ptr_bin  <= 0;
            wr_ptr_gray <= 0;
            full        <= 0;
            overflow    <= 0;
        end else begin
            overflow <= wr_en && full;   // attempted write while full

            if (wr_en && !full)
                mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= wdata;

            wr_ptr_bin  <= wr_ptr_bin_next;
            wr_ptr_gray <= wr_ptr_gray_next;
            full        <= full_next;
        end
    end

    // ---------------------------------------------------------
    // Read logic (rd_clk domain)
    // ---------------------------------------------------------
    always @(posedge rd_clk) begin
        if (rst) begin
            rd_ptr_bin  <= 0;
            rd_ptr_gray <= 0;
            empty       <= 1;
            underflow   <= 0;
            rdata       <= 0;
        end else begin
            underflow <= rd_en && empty; // attempted read while empty

            if (rd_en && !empty)
                rdata <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];

            rd_ptr_bin  <= rd_ptr_bin_next;
            rd_ptr_gray <= rd_ptr_gray_next;
            empty       <= empty_next;
        end
    end

    // Memory reset (optional — simulation-only convenience, not usually
    // needed in real designs since only full/empty logic gates access)
    always @(posedge wr_clk) begin
        if (rst) begin
            for (i = 0; i < DEPTH; i = i + 1)
                mem[i] <= 0;
        end
    end

endmodule
