`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/16 16:21:01
// Design Name: 
// Module Name: clock_g_simulation
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


module clock_g_simulation();
   reg CLOCK;
   reg clk_20k;
   reg clk_50m;
   Clock_G dut(CLOCK,clk_20k,clk_50m);
   initial begin
   CLK=0;
   clk_20k=0;
   clk_50m=0;
   end
   always begin
   #5 CLOCK=~CLOCK;
   end
endmodule
