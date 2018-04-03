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
    output reg clock
    );
    reg [11:0] count=0;
    initial begin
    clock<=0;
    end
    always @ (posedge CLK) begin
    count<=(count==12'b101111101100)?0:count+1;
    clock<=(count==0)?~clock:clock;
    end
endmodule
