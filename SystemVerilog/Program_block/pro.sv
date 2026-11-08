/********************************************************************************* 
                        SystemVerilog Program Block
* *******************************************************************************
*1.A Program Block in SystemVerilog is used to develop testbench code and avoid race conditions between the testbench and DUT (Design Under Test).It provides a separate execution region called the Reactive Region.
*
* 

//1.why do we need a program block
//Ans. conside a simple example without using a program block.

*/
//1.Without program Block 
module dut_example (output bit [3:0] out);
  initial begin
    out <= 2;
  end
  endmodule


//module top;
//  wire [3:0] out;
//  
//  dut_example DUT(out);
//  initial begin
//    if(out == 2)
//      $display("Design assigned out is 2");
//    else
//      $display("Design assigned out = %0d", out);
//  end


program tb_pro(input [3:0] out);
  initial begin
    if(out == 2)
      $display("Design assigned out is 2");
    else
      $display("Design assigned out = %0d", out);
  end
endprogram

module top;
  wire [3:0] out;
  
  dut_example DUT(out);
  tb_pro tb(out);
endmodule




