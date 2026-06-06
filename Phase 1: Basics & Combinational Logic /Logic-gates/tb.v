//Test_banch_for_all_logic_gates;
module tb();
  reg x,y;
  wire and_f,  or_f, not_f, nand_f, nor_f, xor_f, xnor_f, buffer_f;
  logic_gates dut(
    .x(x),
    .y(y),
    .and_f(and_f),
    .or_f(or_f),
    .not_f(not_f),
    .nand_f(nand_f),
    .nor_f(nor_f),
    .xor_f(xor_f),
    .xnor_f(xnor_f),
    .buffer_f(buffer_f)
  );
  initial begin
     // $monitor("%t\t x = %b , y = %b ---->output and_f=%b,  or_f=%b, not_f=%b, nand_f=%b, nor_f=%b, xor_f=%b, xnor_f=%b, buffer_f=%b",$time,x,y,and_f,  or_f, not_f, nand_f, nor_f, xor_f, xnor_f, buffer_f);
    x=1'd0; y=1'd0; #2; 
    
    $display("0%t\t x = %b , y = %b ---->output and_f=%b,  or_f=%b, not_f=%b, nand_f=%b, nor_f=%b, xor_f=%b, xnor_f=%b, buffer_f=%b",$time,x,y,and_f,  or_f, not_f, nand_f, nor_f, xor_f, xnor_f, buffer_f);
     x=1'd0; y=1'd1;#2;
    $display("0%t\t x = %b , y = %b ---->output and_f=%b,  or_f=%b, not_f=%b, nand_f=%b, nor_f=%b, xor_f=%b, xnor_f=%b, buffer_f=%b",$time,x,y,and_f,  or_f, not_f, nand_f, nor_f, xor_f, xnor_f, buffer_f);
    x= 1'd1; y=1'd0;#2;
    $display("0%t\t x = %b , y = %b ---->output and_f=%b,  or_f=%b, not_f=%b, nand_f=%b, nor_f=%b, xor_f=%b, xnor_f=%b, buffer_f=%b",$time,x,y,and_f,  or_f, not_f, nand_f, nor_f, xor_f, xnor_f, buffer_f);
    x= 1'd1; y=1'd0;
       $display("0%t\t x = %b , y = %b ---->output and_f=%b,  or_f=%b, not_f=%b, nand_f=%b, nor_f=%b, xor_f=%b, xnor_f=%b, buffer_f=%b",$time,x,y,and_f,  or_f, not_f, nand_f, nor_f, xor_f, xnor_f, buffer_f);
 
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
 
