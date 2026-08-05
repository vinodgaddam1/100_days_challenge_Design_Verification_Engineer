`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2026 19:48:12
// Design Name: 
// Module Name: tb
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


//Vending Machine
module tb;
parameter S0=4'b0001;
parameter S1=4'b0010;
parameter S2=4'b0100;
parameter S3=4'b1000;
reg clk,rst,coin5,coin10;
wire dispence,change;
vending dut(clk,rst,coin5,coin10,dispence,change);
//CLOCK GENRATION
initial begin
	clk=0;
	forever #5 clk=~clk;
end

//RESET GENRATION
initial begin
$monitor("Time=%0t,rst=%b,state=%b,next_state=%b,coin5=%b,coin10=%b,dispence=%b,change=%0b",$time,rst,dut.state,dut.next_state,coin5,coin10,dispence,change);
rst=1;
coin5=0;
coin10=0;
repeat (2) begin
 @(posedge clk);
rst=0;
case_a();
case_b();
case_c();
case_d();
case_e();
case_f();
end
#100;
$finish;
end


task case_a();
begin
//------------------------------------------------------
//           case-1   5-->10  
//------------------------------------------------------
@(posedge clk);
coin5=1;
coin10=0;

@(posedge clk);
coin5=0;
coin10=1;


@(posedge clk);
coin5=0;
coin10=0;
end
endtask

task case_b();
begin
//-----------------------------------------------------
//              Case-2 10-->5
//----------------------------------------------------

@(posedge clk);
coin10=1;
coin5=0;


@(posedge clk);
coin10=0;
coin5=1;


@(posedge clk);
coin5=1;
end
endtask


task case_c();
begin
//---------------------------------------------------
//             Case-3 5-->5-->5
//---------------------------------------------------

@(posedge clk);
coin5=1;


@(posedge clk);
coin5=1;



@(posedge clk);
coin5=1;


@(posedge clk);
coin5=0;
end
endtask


task case_d();
begin
//----------------------------------------------------
//            Case-4 10-->10
//----------------------------------------------------


@(posedge clk);
coin10=1;



@(posedge clk);
coin5=1;


@(posedge clk);
coin5=0;
end
endtask


task case_e();
begin
//----------------------------------------------------
//            Case-5 No-coin
//----------------------------------------------------

repeat(3)
@(posedge clk);
end
endtask

task case_f();
begin
//----------------------------------------------------
//            Case-6 Random coins
//----------------------------------------------------


//@(posedge clk);----Here vending machine assume coin5=1,coin10 only one coin
//we use at a time this case vending machine can take only one coin
//coin5=$random;
//coin10=$random;
repeat(10)begin
@(posedge clk);
case($random % 3)
	0:begin
	coin5=0;
	coin10=0;
end
1:begin
	coin5=1;
	coin10=0;
end
2:begin
coin5=0;
coin10=1;
end
endcase
end
end
endtask
endmodule

