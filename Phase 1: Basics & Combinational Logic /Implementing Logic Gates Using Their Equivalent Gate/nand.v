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
