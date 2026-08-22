/***************************************************************************
*                   BACK_DOOR & FRONT_DOOR ACCESS
****************************************************************************

//$readmemh--Hexadecimal file-Memory 
module tb;
reg [7:0]mem[0:3];
integer i;
initial begin
	$readmemh("data.hex",mem);
	#1;
	for(i=0;i<4;i=i+1)begin
      $display("mem[%0d]=%h",i,mem[i]);
   end
   $finish;
   end
endmodule

//$readmemb--binary file-Memory 
module tb;
reg [7:0]mem[0:3];
integer i;
initial begin
	$readmemb("binary.bin",mem);
	#1;
	for(i=0;i<4;i=i+1)begin
      $display("mem[%0d]=%b",i,mem[i]);
   end
   $finish;
   end
endmodule



//$writememb--binary file-Memory 
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	for(i=0;i<6;i=i+1)begin
		mem[i]=$urandom_range(10,20);
	end
	$writememb("out.bin",mem);
end
endmodule

//$writememh--Hexdecimal file-Memory 
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	for(i=0;i<6;i=i+1)begin
		mem[i]=$urandom_range(10,20);
	end
	$writememh("out.hex",mem);
end
endmodule


//read(HEX)---write(BIN)
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	$readmemh("data.hex",mem);

         for(i=0;i<6;i=i+1)begin
         $display("mem[%0d]=%h",i,mem[i]);
         end

	$writememb("dataout.bin",mem);
        $finish;

end
endmodule

//write(HEX)---read(BIN)
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	for(i=0;i<6;i=i+1)begin
		mem[i]=$urandom_range(10,20);
	end
	$writememh("dataout1.hex",mem);
	$readmemb("dataout1.bin",mem);
	#1;
         for(i=0;i<6;i=i+1)begin
         $display("mem[%0d]=%b",i,mem[i]);
         end
$finish;
end
endmodule


//read(HEX)---write(HEX)
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	$readmemh("data.hex",mem);

         for(i=0;i<6;i=i+1)begin
         $display("mem[%0d]=%h",i,mem[i]);
         end

	$writememh("dataout.hex",mem);
        $finish;

end
endmodule

//read(bin)---write(bin)
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	$readmemb("dataout.bin",mem);

         for(i=0;i<6;i=i+1)begin
         $display("mem[%0d]=%b",i,mem[i]);
         end

	$writememb("data1.bin",mem);
        $finish;

end
endmodule

*/
//====================================================
// Synchronous RAM
//====================================================
module syn_RAM #(
    parameter WIDTH = 16,
    parameter DEPTH = 64,
    parameter ADDR  = $clog2(DEPTH)
)(
    input clk,
    input rst,
    input w_r,
    input [WIDTH-1:0] wdata_in,
    input [ADDR-1:0] addr,
    output reg ready,
    output reg [WIDTH-1:0] rdata_out,
    input valid
);

reg [WIDTH-1:0] mem [0:DEPTH-1];

integer i;

always @(posedge clk) begin

    if (rst) begin

        ready     <= 0;
        rdata_out <= 0;

        for (i = 0; i < DEPTH; i = i + 1)
            mem[i] <= 0;

    end

    else begin

        ready <= 0;

        if (valid) begin

            ready <= 1;

            if (w_r) begin
                // WRITE
                mem[addr] <= wdata_in;
            end

            else begin
                // READ
                rdata_out <= mem[addr];
            end

        end

    end

end

endmodule

//TB
//====================================================
// Testbench
//====================================================
module tb;

parameter WIDTH = 16;
parameter DEPTH = 64;
parameter ADDR  = $clog2(DEPTH);

reg clk;
reg rst;
reg w_r;
reg [WIDTH-1:0] wdata_in;
reg [ADDR-1:0] addr;
reg[8*30:0]testname;
wire ready;
wire [WIDTH-1:0] rdata_out;

reg valid;

integer i;

syn_RAM dut (
    .clk       (clk),
    .rst       (rst),
    .w_r       (w_r),
    .wdata_in  (wdata_in),
    .addr      (addr),
    .ready     (ready),
    .rdata_out (rdata_out),
    .valid     (valid)
);


//====================================================
// Clock generation
//====================================================
initial begin
    clk = 0;

    forever #5 clk = ~clk;
end


//====================================================
// Main stimulus
//====================================================
initial begin
	$value$plusargs("testname=%s",testname);
      reset_mem();
      rst      = 0;
      valid    = 0;
      w_r      = 0;
      addr     = 0;
      wdata_in = 0;
      case(testname)
	      "read_fd_write_fd":begin
	      write_mem();
	      read_mem();
      end
	      "read_bd_write_bd":begin
	      back_door_wr();
	      back_door_rd();
      end
             "read_fd_write_bd":begin
	      back_door_wr();
	      read_mem();
      end
            "read_bd_write_fd":begin
	      back_door_rd();
	      write_mem();
      end
      endcase 
   
    #20;

    $finish;

end


//====================================================
// Reset task
//====================================================
task reset_mem;
begin

    rst = 1;

    repeat(2)
        @(posedge clk);

    rst = 0;

end
endtask


//====================================================
// WRITE TASK
//====================================================
task write_mem;
begin

    $display("========== WRITE ==========");

    for(i = 0; i < DEPTH; i = i + 1) begin

        @(posedge clk);

        valid    = 1;
        w_r      = 1;
        addr     = i;
        wdata_in = $urandom_range(10,100);

        @(posedge clk);

        if(ready)
            $display("WRITE: addr=%0d data=%0d",
                     addr, wdata_in);

    end

    @(posedge clk);

    valid    = 0;
    w_r      = 0;
    addr     = 0;
    wdata_in = 0;

end
endtask


//====================================================
// READ TASK
//====================================================
task read_mem;
begin

    $display("========== READ ==========");

    for(i = 0; i < DEPTH; i = i + 1) begin

        @(posedge clk);

        valid = 1;
        w_r   = 0;
        addr  = i;

        @(posedge clk);

        if(ready)
            $display("READ: addr=%0d data=%0d",
                     addr, rdata_out);

    end

    @(posedge clk);

    valid = 0;
    w_r   = 0;
    addr  = 0;

end
endtask

task back_door_rd();
begin
    $writememb("vinod.bin",dut.mem);
end
endtask

task back_door_wr();
begin
    $readmemh("vinod.hex",dut.mem);
end
endtask

endmodule

