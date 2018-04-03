module music_simulate ();
    reg CLOCK;
    reg [6:0] Keyboard;
    reg [11:0] music_out;
     reg [18:0] freq;
        reg [18:0] count;
          initial begin
          CLOCK=1'b0;
          Keyboard=7'b0000001;
          music_out=12'b111111111111;
          count=19'b0000000000000000000;
          end     
        always begin
        #5 CLOCK=~CLOCK;
        end
        
        always @ (posedge CLOCK)
        begin 
        case (Keyboard)
        7'b0000001: freq<=19'b1011101010100010000; 
        7'b0000010: freq<=19'b1010011001000101100;
        7'b0000100: freq<=19'b1001010000100001100;
       7'b0001000: freq<=19'b1000101111010001000;
       7'b0010000: freq<=19'b0111110010001111110;
       7'b0100000: freq<=19'b0110111011111001000;
       7'b1000000: freq<=19'b0110001011011101101;
       endcase
       end
          always @ (posedge CLOCK)
          begin
          
          count=(count==freq)? 12'b0:count+1;
          music_out=(count==0)?(12'b111111111111-music_out):music_out;
          end   
   
   endmodule