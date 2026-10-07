module tb;
  reg a,b;
  wire nand_g1,nor_g2,and_g3,or_g4;
  logic_gates dut(.*); 
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $monitor("Time=%0t,a=%b,b=%b,nand=%b,nor=%b,and=%b,or=%b",$time,a,b,nand_g1,nor_g2,and_g3,or_g4);
    a= 4'b0 ; b=4'b0; #10;
    a= 4'b0 ; b=4'b1; #10;
    a=4'b1 ; b=4'b0; #10;
    a=4'b1 ; b=4'b1; #10;
    a=4'bx ; b=4'bx; #10;
    a=4'bz ; b=4'bx; #10;
    a=4'bx ; b=4'bz; #10;
    a=4'bz ; b=4'bz; #10;
    $finish; 
  end
endmodule
