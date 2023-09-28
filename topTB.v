module topTB();
  reg clk=1;
  reg rst=0;
  reg[2:0]SW=0;
  reg[7:0]romout=0;
  wire[7:0]OutAmp,out;
  
  WaveFormGen_Module W1( SW,clk,rst, OutAmp);
  Mux M1(OutAmp,romout,SW,out);
  always #10 clk=~clk;
  initial begin
    #15 rst=1;
    #15 rst=0;
    #20 //SW=0;
    #2560 //SW=2;
    #2560 //SW=3;
    #2560 //SW=4;
    #2560 //SW=5;
    #2560 SW=3;
    
    #2560 //SW=2;
    #2560 //SW=3;
    #2560 //SW=4;
    #2560 //SW=5;
    #2560 SW=4; 
    
    #2560 //SW=2;
    #2560 //SW=3;
    #2560 //SW=4;
    #2560 //SW=5;
    #2560 SW=5; 
    
    #2560 //SW=2;
    #2560 //SW=3;
    #2560 //SW=4;
    #2560 //SW=5;
    #2560 
    #2560 $stop;
    
  end
endmodule
