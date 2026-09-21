//=========================================================================
//                         BAUD RATE GENERATOR
//=========================================================================

module baud_rate_generator #(
    parameter integer CLK_FREQ  = 50_000_000,
    parameter integer BAUD_RATE = 9600
)(
    input  logic clk,
    input  logic reset,

    output logic tx_enb,
    output logic rx_enb
);

    // TX baud tick
    localparam integer TX_DIV = CLK_FREQ / BAUD_RATE;

    // RX sampling tick = 16 times baud rate
    localparam integer RX_DIV = CLK_FREQ / (BAUD_RATE * 16);

    logic [12:0] tx_counter;
    logic [9:0]  rx_counter;

    //-------------------------------------------------------------------------
    // TX counter
    //-------------------------------------------------------------------------
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            tx_counter <= 0;
        end
        else begin
            if (tx_counter == TX_DIV-1)
                tx_counter <= 0;
            else
                tx_counter <= tx_counter + 1'b1;
        end
    end

    //-------------------------------------------------------------------------
    // RX counter
    //-------------------------------------------------------------------------
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            rx_counter <= 0;
        end
        else begin
            if (rx_counter == RX_DIV-1)
                rx_counter <= 0;
            else
                rx_counter <= rx_counter + 1'b1;
        end
    end

    //-------------------------------------------------------------------------
    // Enable pulses
    //-------------------------------------------------------------------------
    assign tx_enb = (tx_counter == TX_DIV-1);
    assign rx_enb = (rx_counter == RX_DIV-1);

endmodule


//=========================================================================
//                              TRANSMITTER
//=========================================================================

module transmitter(
    input  logic       clk,
    input  logic       reset,
    input  logic       wr_enb,
    input  logic       enb,
    input  logic [7:0] data_in,

    output logic       tx,
    output logic       busy
);

    typedef enum logic [1:0] {
        IDLE_STATE = 2'b00,
        START_STATE = 2'b01,
        DATA_STATE  = 2'b10,
        STOP_STATE  = 2'b11
    } state_t;

    state_t state;

    logic [7:0] data;
    logic [2:0] index;

    //-------------------------------------------------------------------------
    // TX FSM
    //-------------------------------------------------------------------------
    always_ff @(posedge clk or posedge reset) begin

        if (reset) begin
            state <= IDLE_STATE;
            data  <= 8'h00;
            index <= 3'd0;
            tx    <= 1'b1;
        end

        else begin

            case (state)

                //=============================================================
                // IDLE
                //=============================================================
                IDLE_STATE: begin

                    tx <= 1'b1;

                    if (wr_enb) begin
                        data  <= data_in;
                        index <= 3'd0;
                        state <= START_STATE;
                    end

                end


                //=============================================================
                // START BIT
                //=============================================================
                START_STATE: begin

                    if (enb) begin
                        tx    <= 1'b0;
                        index <= 3'd0;
                        state <= DATA_STATE;
                    end

                end


                //=============================================================
                // DATA BITS
                // LSB first
                //=============================================================
                DATA_STATE: begin

                    if (enb) begin

                        tx <= data[index];

                        if (index == 3'd7) begin
                            state <= STOP_STATE;
                        end
                        else begin
                            index <= index + 1'b1;
                        end

                    end

                end


                //=============================================================
                // STOP BIT
                //=============================================================
                STOP_STATE: begin

                    if (enb) begin
                        tx    <= 1'b1;
                        state <= IDLE_STATE;
                    end

                end


                //=============================================================
                // DEFAULT
                //=============================================================
                default: begin
                    state <= IDLE_STATE;
                    tx    <= 1'b1;
                    index <= 3'd0;
                end

            endcase

        end

    end

    //-------------------------------------------------------------------------
    // BUSY
    //-------------------------------------------------------------------------
    assign busy = (state != IDLE_STATE);

endmodule


//=========================================================================
//                               RECEIVER
//=========================================================================

module receiver(
    input  logic       clk,
    input  logic       reset,
    input  logic       rx,
    input  logic       ready_clr,
    input  logic       enb,

    output logic [7:0] data_out,
    output logic       ready
);

    typedef enum logic [1:0] {
        RX_START = 2'b00,
        RX_DATA  = 2'b01,
        RX_STOP  = 2'b10
    } rx_state_t;

    rx_state_t state;

    logic [3:0] sample;
    logic [2:0] index;
    logic [7:0] temp_reg;

    //-------------------------------------------------------------------------
    // RX FSM
    //
    // RX enable occurs at 16x baud rate.
    //
    // sample = 0 to 15 represents one bit period.
    //
    // Start bit:
    //     Detect LOW
    //     Wait 8 samples
    //     Check center of start bit
    //
    // Data bits:
    //     Sample at center of every bit
    //
    // Stop bit:
    //     Sample at center
    //-------------------------------------------------------------------------
    always_ff @(posedge clk or posedge reset) begin

        if (reset) begin
            state    <= RX_START;
            sample   <= 4'd0;
            index    <= 3'd0;
            temp_reg <= 8'h00;
            data_out <= 8'h00;
            ready    <= 1'b0;
        end

        else begin

            // Clear ready when requested
            if (ready_clr)
                ready <= 1'b0;

            if (enb) begin

                case (state)

                    //=========================================================
                    // WAIT FOR START BIT
                    //=========================================================
                    RX_START: begin

                        if (rx == 1'b0) begin

                            if (sample == 4'd7) begin

                                // Verify that start bit is still LOW
                                if (rx == 1'b0) begin
                                    state    <= RX_DATA;
                                    sample   <= 4'd0;
                                    index    <= 3'd0;
                                    temp_reg <= 8'h00;
                                end
                                else begin
                                    state  <= RX_START;
                                    sample <= 4'd0;
                                end

                            end
                            else begin
                                sample <= sample + 1'b1;
                            end

                        end

                        else begin
                            // False start
                            sample <= 4'd0;
                        end

                    end


                    //=========================================================
                    // RECEIVE DATA BITS
                    //=========================================================
                    RX_DATA: begin

                        if (sample == 4'd15) begin

                            // Sample data at center of bit
                            temp_reg[index] <= rx;

                            sample <= 4'd0;

                            if (index == 3'd7) begin
                                state <= RX_STOP;
                            end
                            else begin
                                index <= index + 1'b1;
                            end

                        end
                        else begin
                            sample <= sample + 1'b1;
                        end

                    end


                    //=========================================================
                    // STOP BIT
                    //=========================================================
                    RX_STOP: begin

                        if (sample == 4'd15) begin

                            // Stop bit should be HIGH
                            if (rx == 1'b1) begin
                                data_out <= temp_reg;
                                ready    <= 1'b1;
                            end

                            sample <= 4'd0;
                            state  <= RX_START;

                        end
                        else begin
                            sample <= sample + 1'b1;
                        end

                    end


                    //=========================================================
                    // DEFAULT
                    //=========================================================
                    default: begin
                        state  <= RX_START;
                        sample <= 4'd0;
                        index  <= 3'd0;
                    end

                endcase

            end

        end

    end

endmodule


//=========================================================================
//                              UART TOP
//=========================================================================

module uart_top(
    input  logic       clk,
    input  logic       rst,

    input  logic       wr_enb,
    input  logic       rdy_clr,

    input  logic [7:0] data_in,

    output logic       tx,
    output logic       busy,

    output logic [7:0] data_out,
    output logic       ready
);

    logic tx_clk_en;
    logic rx_clk_en;

    //-------------------------------------------------------------------------
    // Baud rate generator
    //-------------------------------------------------------------------------
    baud_rate_generator bg (
        .clk    (clk),
        .reset  (rst),
        .tx_enb (tx_clk_en),
        .rx_enb (rx_clk_en)
    );

    //-------------------------------------------------------------------------
    // Transmitter
    //-------------------------------------------------------------------------
    transmitter tx_unit (
        .clk    (clk),
        .reset  (rst),
        .wr_enb (wr_enb),
        .enb    (tx_clk_en),
        .data_in(data_in),
        .tx     (tx),
        .busy   (busy)
    );

    //-------------------------------------------------------------------------
    // Receiver
    //-------------------------------------------------------------------------
    receiver rx_unit (
        .clk      (clk),
        .reset    (rst),
        .rx       (tx),       // Internal loopback
        .ready_clr(rdy_clr),
        .enb      (rx_clk_en),
        .data_out (data_out),
        .ready    (ready)
    );

endmodule

