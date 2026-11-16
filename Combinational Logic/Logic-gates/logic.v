//Basic_All_logic_gates
//************DATA-FLOW-MODELING***********

module logic_gates(
  input x,y,              //inputs x,y
  output and_f,           //output and_f
   or_f,                  //output or_f
   not_f,                 //output not_f
   nand_f,                //output nand_f
   nor_f,                 //output nor_f                            
   xor_f,                 //output xor_f
   xnor_f,                //output xnor_f
   buffer_f               //output buffer_f
);
              

  assign and_f = x & y ;    //AND-operation (&)
  assign or_f = x | y ;     //OR-operation (|)
  assign not_f = ~x ;       //NOT-operation (~)
  assign nand_f = ~(x&y);   //NAND-operation (~&)
  assign nor_f = ~(x|y);    //NOR-operation (~+) 
  assign xor_f = (x^y);     //XOR-operation (^)
  assign xnor_f = ~(x^y);   //XNOR-operation (~^)
  assign buffer_f = x;      //Buffer-operation
  
endmodule

//************Gate-level***********

module logic_gates(
  input x,y,              //inputs x,y
  output and_f,           //output and_f
   or_f,                  //output or_f
   not_f,                 //output not_f
   nand_f,                //output nand_f
   nor_f,                 //output nor_f                      
   xor_f,                 //output xor_f
   xnor_f                //output xnor_f
                                                  // NOTE:Upper case don't work like AND,etc
  );
  and g1(and_f,x,y);       //AND-operation 
  or g2(or_f,x,y) ;       //OR-operation 
  not g3(not_f,y) ;       //NOT-operation 
  nand g4(nand_f,x,y);    //NAND-operation 
  nor g5(nor_f,x,y);      //NOR-operation 
  xor g6(xor_f,x,y);      //XOR-operation 
  xnor g7(xnor_f,x,y);    //XNOR-operation 
  
endmodule
                                                     
//************Behavioral-level***********Very Importent
module logic_gates(
  input x,y,              //inputs x,y
  output reg and_f,           //output and_f
   or_f,                  //output or_f
   not_f,                 //output not_f
   nand_f,                //output nand_f
   nor_f,                 //output nor_f                      
   xor_f,                 //output xor_f
   xnor_f,                //output xnor_f
   buffer_f               //output buffer_f
);
              
  always @(*)
     begin
   and_f = x & y ;    //AND-operation 
   or_f = x | y ;     //OR-operation 
   not_f = ~x ;       //NOT-operation
   nand_f = ~(x&y);   //NAND-operation
   nor_f = ~(x|y);    //NOR-operation  
   xor_f = (x^y);     //XOR-operation 
   xnor_f = ~(x^y);   //XNOR-operation
   buffer_f = x;      //Buffer-operation
  end
  
endmodule 

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
 





