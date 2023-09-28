module PWM_TB();
	reg clk=1;
	reg rst=0;
	reg [7:0] D=8'd128;
	wire pwm;
	PWM_module X1(clk,rst,D,pwm);
	always #10 clk=~clk;
  initial begin
    #15 rst=1;
    #15 rst=0;
    #20 //SW=0;
    #2560 //SW=2;
    #2560 //SW=3;
    #2560 //SW=2;
    #2560 //SW=3;
			D=200;
    #2560 //SW=5;
    #2560 //SW=6; 
	#2560 //SW=5;
	#2560 //SW=2;
    #2560 //SW=3;
			D=50;
    #2560 //SW=6;
	#2560 //SW=5;
    #2560 //SW=6;
    #2560 $stop;
    
  end
endmodule
