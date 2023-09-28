module DDS_module(input clk,rst,input pc,output reg[7:0] addr);
	
	always@(posedge clk,posedge rst)begin
		if(rst) addr<=8'b0;
		else if(pc==0)	addr<=addr+8'd1;
		else addr<=addr+8'd2;
	end
	
endmodule
