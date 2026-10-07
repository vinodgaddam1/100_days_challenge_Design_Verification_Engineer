
module tb;
reg clk,rst,in;
wire out;
melay_overlapping(clk,rst,in,out);
//Enocde the States
parameter S0=2'b00;
parameter S1=2'b01;
parameter S2=2'b10;
parameter S3=2'b11;

initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;
#20;
rst=0;
repeat (10)begin
@(posedge clk);
in=$random;
#10;
end
#100;
$finish;
end
endmodule


















