module tb();
 reg a,b;
  wire g1,g2,g3,g4,g5,g6,g7,g8;
  
  nor_gate_using_all_logic_gates dut(
    .a(a),
    .b(b),
    .not_gate(g1),
    .and_gate(g2),
    .or_gate(g3),
    .buf_gate(g4),
    .nor_gate(g5),
    .nand_gate(g6),
    .xor_gate(g7),
    .xnor_gate(g8)
  );
  initial begin
  $monitor("time=%0t, a=%b,b=%b | not=%b,and=%b,or=%b,buffer=%b,nor=%b,nand=%b,xor=%b,xnor=%b",$time,a,b,g1,g2,g3,g4,g5,g6,g7,g8);
  a=4'b0; b=4'b0; #10;
  a=4'b0; b=4'b1; #10;
  a=4'b1; b=4'b0; #10;
  a=4'b1; b=4'b1; #10;
  a=4'bx; b=4'bx; #10;
  a=4'bx; b=4'bz; #10;
  a=4'bz; b=4'bx; #10;
  a=4'bz; b=4'bz; #10;
  $finish;
  
  end
endmodule

  
  
    
    
