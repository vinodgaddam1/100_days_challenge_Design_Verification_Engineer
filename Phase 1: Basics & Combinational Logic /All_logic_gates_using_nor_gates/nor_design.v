//implementing_all_logic_gates_using_NOR_gate
module nor_gate_using_all_logic_gates(
  input a,b,
  output not_gate,
  and_gate,
  or_gate,
  buf_gate,
  nand_gate,
  nor_gate,
  xor_gate,
  xnor_gate
);
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14; 
  
  //NOR_using_NOR
  assign nor_gate =  ~(a | b);
  //NOT_using_NOR
  assign not_gate =  ~(a | a);
  //AND_using_NOR
  assign w1 =  ~(a | a);
  assign w2 =  ~(b | b);
  assign and_gate =  ~(w1 | w2);
  //OR_using_NOR
  assign w3 =  ~(a | b);
  assign  or_gate=  ~(w3 | w3);
  //buffer_using_NOR
  assign w4 =  ~(a | a);
  assign buf_gate =  ~(w4 | w4);
  //NAND_using_NOR
  assign w5 =  ~(a | a);
  assign w6 =  ~(b | b);
  assign w7 =  ~(w5 | w6);
  assign nand_gate = ~(w7 | w7);
 //XOR_using_NOR
  assign w8 =  ~(a | b);
  assign w9 =  ~(a | w8);
  assign w10 =  ~(b | w8);
  assign w11 = ~(w9 | w10);
  assign xor_gate = ~(w11 | w11);
  //XNOR_using_NOR
  assign w12 =  ~(a | b);
  assign w13 =  ~(a | w12);
  assign w14 =  ~(b | w12);
  assign xnor_gate = ~(w13 | w14);
endmodule
