module PWM_module(input clk,rst, input [7:0] D, output  pwm);
	wire[7:0] cnt;
	Counter8b C1(clk,rst,cnt);
	/*always@(posedge clk)begin
		if(rst) pwm<=0;
	end*/
	assign pwm=(cnt>=D)? 0:1;
	
endmodule

module Counter8b(input Clk,input Rst,output reg[7:0] Cnt);
    
    always@(posedge Clk,posedge Rst)begin
        if(Rst) Cnt<=8'b0;
        else Cnt<=Cnt+1;
    end 
endmodule

