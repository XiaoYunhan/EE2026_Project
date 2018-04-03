`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/16 15:39:24
// Design Name: 
// Module Name: Clock_G
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


module Clock_G(
    input CLOCK,
    output reg clk_20k,
    output reg clk_50m
    );
    reg [11:0] count=0;
    initial begin
    //count=0; 
    clk_20k=0;
    clk_50m=0;
    end
    always @ (posedge CLOCK)
    begin
    clk_50m<=~clk_50m;
    count<=(count==12'b100111000100)? 0:count+1;
    clk_20k<=(count==0)?~clk_20k:clk_20k;
    end
endmodule
