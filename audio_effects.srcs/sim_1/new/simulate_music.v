`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2018 06:40:22 PM
// Design Name: 
// Module Name: simulate_music
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


module simulate_music(

    );
    reg CLOCK, slowCLK;
    reg [6:0]in;
    reg [11:0]out;
    initial begin
    CLOCK=0;
    slowCLK=0;
    in=7'b0000001;
    end
    always begin 
    #5 CLOCK=~CLOCK;
    end
    always begin 
        #20 slowCLK=~slowCLK;
        end
    Music_Instrument dut (CLOCK,slowCLK,in,out);
    
endmodule
