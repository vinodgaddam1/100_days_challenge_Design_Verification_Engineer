// logic gates and there equivalent gates type-1
module nand_gate(
input a,b,
output y
);
  wire w1,w2,w3;
  //nand == bubble OR gate
  not (w1,a);
  not (w2,b);
  or (y,w1,w2);
endmodule

module nor_gate(
input a,b,
output y
);
  wire w1,w2,w3;
  //nor == bubble AND gate
  not (w1,a);
  not (w2,b);
  and (y,w1,w2);
endmodule

module and_gate(
input a,b,
output y
);
  wire w1,w2,w3;
  //and == bubble nor gate
  not (w1,a);
  not (w2,b);
  nor (y,w1,w2);
endmodule

module or_gate(
input a,b,
output y
);
  wire w1,w2,w3;
  //or == bubble nand gate
  not (w1,a);
  not (w2,b);
  nand (y,w1,w2);
  endmodule


// logic gates and there equivalent gates type-2
module logic_gates(
input a,b,
output nand_g1,nor_g2,and_g3,or_g4
);
  wire w1,w2,w3;
  //nand == bubble OR gate
  not (w1,a);
  not (w2,b);
  or (nand_g1,w1,w2);
   //nor == bubble AND gate
  not (w1,a);
  not (w2,b);
  and (nor_g2,w1,w2);
  //and == bubble nor gate
  not (w1,a);
  not (w2,b);
  nor (and_g3,w1,w2);
  //or == bubble nand gate
  not (w1,a);
  not (w2,b);
  nand (or_g4,w1,w2);
endmodule




TB

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
