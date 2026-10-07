//NOT_gate_based_problems_feedback_not
module g1(
 output reg b
);
  initial 
    b=0;
  always 
  #5 b=~b;
endmodule
/even_number_of_not_gates
module g2(
input a,
output reg b
);
  reg w1;
  always @(a,b)
    begin
     w1=~a;   //two not  gates in cascade
     b=~w1;
    end
endmodule
//odd_number_of_not_gates
module g3(
input a,
output b
);
  wire w2,w3;
  not (w2,a);
  not (w3,w2);
  not (b,w3);
endmodule 
