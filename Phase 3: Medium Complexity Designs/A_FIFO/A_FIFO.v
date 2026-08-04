`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2026 18:44:50
// Design Name: 
// Module Name: A_FIFO
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
//======================================================================================================================
// Project      : Asynchronous FIFO
// File Name    : asy_fifo.v
// Module Name  : asy_fifo
// Author       : Vinod Kumar
// Date         : 04-Aug-2026
// Version      : 1.0
//
// Description  :
//   This module implements an Asynchronous FIFO for safe data transfer
//   between two independent clock domains. It uses Gray-code pointers
//   and two-stage synchronizers to minimize metastability issues during
//   clock domain crossing (CDC).
//
// Features:
//   - Parameterized FIFO depth and data width
//   - Independent write and read clocks
//   - Gray-code write/read pointers
//   - 2-Flop CDC synchronizers
//   - Full and Empty flag generation
//   - Parameterized design
//
// Parameters:
//   FIFO_DEPTH      : Number of FIFO entries (Power of 2)
//   FIFO_WIDTH      : Data width
//   FIFO_DEPTH_LOG  : Address width ($clog2(FIFO_DEPTH))
//
// Ports:
//   wr_clk   : Write clock
//   rd_clk   : Read clock
//   rst      : Asynchronous reset
//   cs       : Chip select
//   wr_en    : Write enable
//   rd_en    : Read enable
//   data_in  : Write data
//   data_out : Read data
//   full     : FIFO full indicator
//   empty    : FIFO empty indicator
//
// Design Flow:
//   Write Domain
//       |
//       |--> Binary Pointer
//       |--> Gray Pointer
//       |--> Memory Write
//       |
//       +--> 2-Flop Synchronizer ----> Read Domain
//
//   Read Domain
//       |
//       |--> Binary Pointer
//       |--> Gray Pointer
//       |--> Memory Read
//       |
//       +--> 2-Flop Synchronizer ----> Write Domain
//
// Dependencies : None
//
// Revision History:
// -------------------------------------------------------------------------------------------------
// Version |    Date     | Author       | Description
// -------------------------------------------------------------------------------------------------
//   1.0   | 04-Aug-2026 | Vinod Kumar  | Initial version
// -------------------------------------------------------------------------------------------------
//======================================================================================================================
module asy_fifo(cs,wr_clk,rd_clk,rst,
        wr_en,data_in,full,
        rd_en,data_out,empty
);
  //Port Declaration I/O 
  parameter FIFO_DEPTH=8;
  parameter FIFO_WIDTH=32;
  parameter FIFO_DEPTH_LOG=$clog2(FIFO_DEPTH);
  input wr_clk;
  input rd_clk;
  input wr_en;
  input rd_en;
  input rst;
  input [FIFO_WIDTH-1:0]data_in;
  output reg[FIFO_WIDTH-1:0]data_out;
  output  full;
  output  empty;
  input cs;
  
  reg [FIFO_WIDTH-1:0]mem[FIFO_DEPTH-1:0];

  //Binary pointer and gray poinetr
  reg [FIFO_DEPTH_LOG:0]wr_ptr_bin, wr_ptr_gray;
  reg [FIFO_DEPTH_LOG:0]rd_ptr_bin, rd_ptr_gray;

  //2-stage synchronizers
  reg [FIFO_DEPTH_LOG:0]rd_gray_sync1,rd_gray_sync2; //rd_ptr_gray  wr_clk
  reg [FIFO_DEPTH_LOG:0]wr_gray_sync1,wr_gray_sync2; //wr_ptr_gray  rd_clk
 
 
  wire [FIFO_DEPTH_LOG:0]wr_ptr_bin_next=wr_ptr_bin+1; 
  wire [FIFO_DEPTH_LOG:0]wr_ptr_gray_next=(wr_ptr_bin_next>>1)^(wr_ptr_bin_next); 


  wire [FIFO_DEPTH_LOG:0]rd_ptr_bin_next=rd_ptr_bin+1; 
  wire [FIFO_DEPTH_LOG:0]rd_ptr_gray_next=(rd_ptr_bin_next>>1)^(rd_ptr_bin_next); 

// empty read domine gray pointer equal synchronizer 
  assign empty=(rd_ptr_gray==wr_gray_sync2);
  assign full=(wr_ptr_gray_next=={~rd_gray_sync2[FIFO_DEPTH_LOG:FIFO_DEPTH_LOG-1],rd_gray_sync2[FIFO_DEPTH_LOG-2:0]});
  
  //--------------Write Logic------------------
  always @(posedge wr_clk )begin
  if(rst)begin
    wr_ptr_bin<=0;
    wr_ptr_gray<=0;
  end
  else if (cs && wr_en && !full)begin
      mem[wr_ptr_bin[FIFO_DEPTH_LOG-1:0]]<=data_in;
      wr_ptr_bin<=wr_ptr_bin_next;
      wr_ptr_gray<=wr_ptr_gray_next;
  end
  end
  
  //-------------------Read Logic------------------
  always @(posedge rd_clk ) begin
  if(rst)begin
    rd_ptr_bin<=0;
    rd_ptr_gray<=0;
    data_out<=0;
  end
  else if (cs && rd_en && !empty)begin
   data_out<=mem[rd_ptr_bin[FIFO_DEPTH_LOG-1:0]];
      rd_ptr_bin<=rd_ptr_bin_next;
      rd_ptr_gray<=rd_ptr_gray_next;
  end
  end
  //CDC (Clock domine crossing domine)
  always @(posedge wr_clk )begin
    if(rst)begin
      rd_gray_sync1<=0;
      rd_gray_sync2<=0;
    end
    else begin
   rd_gray_sync1<=rd_ptr_gray;
   rd_gray_sync2<=rd_gray_sync1;   
    end
  end
  //Read clk
  always @(posedge rd_clk )begin
    if(rst)begin
      wr_gray_sync1<=0;
      wr_gray_sync2<=0;
    end
    else begin
   wr_gray_sync1<=wr_ptr_gray;
   wr_gray_sync2<=wr_gray_sync1;   
    end
  end
endmodule