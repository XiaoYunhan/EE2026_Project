`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/21 17:25:51
// Design Name: 
// Module Name: delay
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


module delay(
    input CLOCK,
    input [11:0] MIC_in,
    output reg [11:0] speaker_out
    );
    reg [14:0]i=0;
    reg [14:0]j=1;
    reg [11:0]memory[0:32767];
    always @ (posedge CLOCK) begin
    i<=i+1;
    j<=j+1;
    memory[i]<=MIC_in;
    speaker_out<=memory[j];
    end
endmodule
