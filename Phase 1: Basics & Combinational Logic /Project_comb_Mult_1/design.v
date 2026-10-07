`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2026 21:44:32
// Design Name: 
// Module Name: design
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*****************************************************************
                4X4 Multiplier Using 4-bit Full Adders
******************************************************************/
//------------------1-bit full adder------------------
module full_adder(
  input a,b,ci,
output carry,sum
);
  assign {carry,sum}=a+b+ci;
endmodule

//-------------------Ripple Carry Adder---------------
module ripple(
  input [3:0]a,b,
  input ci,
  output carry,
  output [3:0]sum
);
  wire c1,c2,c3;
  full_adder g1 (.a(a[0]),.b(b[0]),.ci(ci),.sum(sum[0]),.carry(c1));
  full_adder g2 (.a(a[1]),.b(b[1]),.ci(c1),.sum(sum[1]),.carry(c2));
  full_adder g3 (.a(a[2]),.b(b[2]),.ci(c2),.sum(sum[2]),.carry(c3));
  full_adder g4 (.a(a[3]),.b(b[3]),.ci(c3),.sum(sum[3]),.carry(carry)); 
endmodule

//---------------------4x4 Multiplier----------------- 
module mult_4to4 (
  input [3:0]a,b,
  output [7:0]p
);
  
  //partial products
   wire [15:0]w;
  
  and g1(w[0],a[0],b[0]); 
  and g2(w[1],a[1],b[0]);
  and g3(w[2],a[2],b[0]);
  and g4(w[3],a[3],b[0]);
  
  and g5(w[4],a[0],b[1]);
  and g6(w[5],a[1],b[1]);
  and g7(w[6],a[2],b[1]);
  and g8(w[7],a[3],b[1]);
  
  and g9(w[8],a[0],b[2]);
  and g10(w[9],a[1],b[2]);
  and g11(w[10],a[2],b[2]);
  and g12(w[11],a[3],b[2]);
  
  and g13(w[12],a[0],b[3]);
  and g14(w[13],a[1],b[3]);
  and g15(w[14],a[2],b[3]);
  and g16(w[15],a[3],b[3]);
  
  //Intermediate buses
  wire[3:0] add1_a,add1_b,sum1;
  wire[3:0] add2_a,add2_b,sum2;
  wire[3:0] add3_a,add3_b,sum3;    
         
  wire c1,c2,c3;
   assign p[0]=w[0];
   //-------------------First Adder ------------------
   assign add1_a = {w[7],w[6],w[5],w[4]};
   assign add1_b = {1'b0,w[3],w[2],w[1]};
   ripple r1(.a(add1_a),.b(add1_b),.ci(1'b0),.sum(sum1),.carry(c1));
  
  assign p[1]=sum1[0];
  //--------------- Second Adder ---------------
  assign add2_a = {w[11],w[10],w[9],w[8]};
  assign add2_b = {c1,sum1[3],sum1[2],sum1[1]};
  ripple r2(.a(add2_a),.b(add2_b),.ci(1'b0),.sum(sum2),.carry(c2));
  
   assign p[2]=sum2[0];
  //--------------- Third Adder ---------------
   assign add3_a = {w[15],w[14],w[13],w[12]};
   assign add3_b = {c2,sum2[3],sum2[2],sum2[1]};
  ripple r3(.a(add3_a),.b(add3_b),.ci(1'b0),.sum(sum3),.carry(c3));    
         
   assign p[3]= sum3[0];
   assign p[4]= sum3[1];
   assign p[5]= sum3[2];
   assign p[6]= sum3[3];
   assign p[7]= c3;
  endmodule

  
  
  
