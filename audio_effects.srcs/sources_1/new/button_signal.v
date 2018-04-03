`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2018 08:12:35 PM
// Design Name: 
// Module Name: button_signal
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


module button_signal(
    input slow_CLK,
    input butIn,
    output SignalOut
    );
    wire QD,Q2;
    
    my_dff unit1 (slow_CLK,butIn,QD );
    my_dff unit2 (slow_CLK,QD,Q2 );
    assign SignalOut=QD&Q2;
endmodule
