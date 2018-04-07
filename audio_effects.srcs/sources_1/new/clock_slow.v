`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/21 17:32:26
// Design Name: 
// Module Name: clock_slow
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


module clock_slow(
    input CLK,
    output reg clock,
    output reg clock_half,
    output reg clock_quarter
    );
    reg [11:0] count=0;
    reg [12:0] count_half=0;
    reg [13:0] count_quarter=0;
    initial begin
    clock<=0;
    clock_half<=0;
    clock_quarter<=0;
    end
    always @ (posedge CLK) begin
    count<=(count==12'b101111101100)?0:count+1;
    count_half<=(count_half==13'b1011111011000)?0:count_half+1;
    count_quarter<=(count_quarter==14'b10111110110000)?0:count_quarter+1;
    clock<=(count==0)?~clock:clock;
    clock_half<=(count_half==0)?~clock_half:clock_half;
    clock_quarter<=(count_quarter==0)?~clock_quarter:clock_quarter;
    end
endmodule
