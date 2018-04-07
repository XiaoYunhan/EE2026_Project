`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/03 20:28:06
// Design Name: 
// Module Name: CLOCK_four
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


module CLOCK_four(
    input CLOCK,
    output reg clock_out
    );
    reg [24:0] count=0;
    initial begin
    clock_out<=0;
    end
    always @ (posedge CLOCK) begin
    count<=(count==23'b11111010111100001000000)?0:count+1;
    clock_out<=(count==0)?~clock_out:clock_out;
    end
endmodule
