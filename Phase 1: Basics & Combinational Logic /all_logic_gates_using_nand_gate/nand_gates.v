//all logic_gates_using_NAND
//NOT gate using  NAND
module nand_not(input a,output y);
  nand n1(y,a,a);
endmodule
//AND gate using  NAND
module nand_and(input a,b,output y);
  wire w1;
  nand g1(w1,a,b);
  nand g2(y,w1);
endmodule
//OR gate using  NAND
module nand_or(input a,b,output y);
  wire w1,w2;
  nand g3(w2,a,a);
  nand g4(w3,b,b);
  nand g5(y,w2,w3);
endmodule
//BUFFER gate using NAND
module nand_buf(input a,b,output y);
  wire w4;
  nand g5(w4,a,a);
  nand g6(y,w4);
endmodule
//NAND gate using NAND
module nand_nand(input a,b,output y);
  nand g7(y,a,b);
endmodule
//NOR gate using NAND
module nand_nor(input a,b,output y);
  wire w5,w6,w7;
  nand g9(w5,a,a);
  nand g10(w6,b,b);
  nand g11(w7,w6,w5);
  nand n2(y,w7);
endmodule
//XNOR gate using NAND
module nand_xnor(input a,b,output y);
  wire w8,w9,w10,w11;
  nand g12(w8,a,b);
  nand g13(w9,a,w8);
  nand g14(w10,b,w8);
  nand g15(w11,w9,w10);
  nand g16(y,w11);
endmodule
//XOR gate using NAND
module nand_xor(input a,b,output y);
  wire w12,w13,w14;
  nand g12(w12,a,b);
  nand g13(w13,a,w12);
  nand g14(w14,b,w12);
  nand g15(y,w13,w14);
endmodule


 
