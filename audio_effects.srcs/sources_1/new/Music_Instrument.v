`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/21 14:09:54
// Design Name: 
// Module Name: Music_Instrument
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


module Music_Instrument(
    input CLOCK,
    input repeat_music,
//    input mix,
    input [8:0] Keyboard,
//    input volup,voldown,volreset,
    output  reg [11:0]  music_out

    );
   reg slowC=0,slowD=0, slowE=0,slowF=0,slowG=0,slowA=0,slowB=0 ;
   reg [11:0]C=12'b0;
   reg [11:0]D=12'b0;
   reg [11:0]E=12'b0;
   reg [11:0]F=12'b0;
   reg [11:0]G=12'b0;
   reg [11:0]A=12'b0;
   reg [11:0]B=12'b0;
   reg [17:0] countC=17'b0;
   reg [17:0] countD=17'b0;
   reg [17:0] countE=17'b0;
   reg [17:0] countF=17'b0;
   reg [17:0] countG=17'b0;
   reg [17:0] countA=17'b0;
   reg [17:0] countB=17'b0;
   reg [40:0] melody=41'b0;
//   reg [8:0] volume=3'b111;
   always @(posedge CLOCK)
   begin
  
  melody=(Keyboard==9'b010000000||Keyboard==9'b100000000)?melody+1:0;
   if ((repeat_music==1&& Keyboard==9'b010000000&&melody==1250000000)||(repeat_music==1&& Keyboard==9'b100000000&&melody==810000000))melody=0;
   
   
   countC<=(countC==191112 )? 0:countC+1;
   slowC<=(countC==0)?~slowC:slowC;
   C<=(slowC==0)?12'b111111111111:12'b0;
   
      countD<=(countD==170261 )? 0:countD+1;
      slowD<=(countD==0)?~slowD:slowD;
         D<=(slowD==0)?12'b111111111111:12'b0;
   
            countE<=(countE==151685 )? 0:countE+1;
          slowE<=(countE==0)?~slowE:slowE;
               E<=(slowE==0)?12'b111111111111:12'b0;
      
                  countF<=(countF==143172 )? 0:countF+1;
                  slowF<=(countF==0)?~slowF:slowF;
                     F<=(slowF==0)?12'b111111111111:12'b0;
  
                     countG<=(countG==127552 )? 0:countG+1;
                     slowG<=(countG==0)?~slowG:slowG;
                        G<=(slowG==0)?12'b111111111111:12'b0;
   
                        countA<=(countA==113636 )? 0:countA+1;
                        slowA<=(countA==0)?~slowA:slowA;
                           A<=(slowA==0)?12'b111111111111:12'b0;
      
                           countB<=(countB==101238 )? 0:countB+1;
                           slowB<=(countB==0)?~slowB:slowB;
                              B<=(slowB==0)?12'b111111111111:12'b0;
                           end
 
      always @ (posedge CLOCK)
         begin 
          
        case (Keyboard)
        9'b000000001: music_out<=C;
        9'b000000010: music_out<=D;
        9'b000000100: music_out<=E;
        9'b000001000: music_out<=F;
        9'b000010000: music_out<=G;
        9'b000100000: music_out<=A;
        9'b001000000: music_out<=B;
        9'b010000000: music_out<=(melody<50000000)?E: (melody<60000000)?12'b0: (melody<100000000)?E: (melody<110000000)?12'b0: (melody<200000000)?E: (melody<210000000)?12'b0: (melody<300000000)?F: (melody<310000000)?12'b0: (melody<400000000)?G: (melody<410000000)?12'b0: (melody<550000000)?E: (melody<560000000)?12'b0: (melody<600000000)?D: (melody<610000000)?12'b0: (melody<700000000)?D: (melody<710000000)?12'b0: (melody<750000000)?C: (melody<760000000)?12'b0: (melody<800000000)?C: (melody<810000000)?12'b0: (melody<900000000)?C: (melody<910000000)?12'b0: (melody<1100000000)?D: (melody<1110000000)?12'b0: (melody<1250000000)?E:0;
        9'b100000000: music_out<=(melody<100000000)?E: (melody<110000000)?12'b0: (melody<200000000)?E: (melody<210000000)?12'b0: (melody<300000000)?F: (melody<310000000)?12'b0: (melody<400000000)?G: (melody<410000000)?12'b0: (melody<500000000)?G: (melody<510000000)?12'b0: (melody<600000000)?F: (melody<610000000)?12'b0: (melody<700000000)?E: (melody<710000000)?12'b0: (melody<800000000)?D: (melody<810000000)?12'b0:0;
       
      
      
       endcase 
       
     
        end
//        always @ (posedge volup )
//          begin
//          if (volume!=1 ) volume=volume-1;
//          end   
//          always @ (posedge voldown)
//              begin
//              if (volume!=10) volume=volume+1; 
//              end   
//          always @ (posedge volreset)
//                  begin
//                  volume=1;
//                  end   
//              always@ (posedge CLOCK)
//              begin
//                 music_out=music_out/volume;
//              end 
endmodule
