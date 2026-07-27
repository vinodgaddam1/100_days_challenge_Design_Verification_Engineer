`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2026 19:00:52
// Design Name: 
// Module Name: ROM
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

//ROM Using case
module ROM1(
input [3:0]addr,
output reg [7:0]data_out
    );
    always @(*)begin
    case (addr)
    4'b0000:data_out=8'b00000001;
    4'b0001:data_out=8'b00000011;
    4'b0010:data_out=8'b00000111;
    4'b0011:data_out=8'b01000001;
    4'b0100:data_out=8'b00100011;
    4'b0101:data_out=8'b01000111;
    4'b0110:data_out=8'b00110001;
    4'b0111:data_out=8'b00110011;
    4'b1000:data_out=8'b00110111;
    default: data_out=8'bxxxxxxxx;
    endcase
    end
endmodule



/*/ROM Using array
module ROM1(
input [3:0]addr,
output  [7:0]data_out
);
reg [7:0]mem[0:15];
initial begin

mem[0]=8'd32;
mem[1]=8'd42;
mem[2]=8'd52;
mem[3]=8'd22;
mem[4]=8'd12;
mem[5]=8'd42;
mem[6]=8'd82;
mem[7]=8'd92;
mem[8]=8'd00;
mem[9]=8'd11;
mem[10]=8'd22;
mem[11]=8'd33;
mem[12]=8'd44;
mem[13]=8'd55;
mem[14]=8'd66;
mem[15]=8'd77;
end
assign data_out=mem[addr];
endmodule
*/