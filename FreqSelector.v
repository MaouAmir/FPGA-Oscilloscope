module Freqselector (input clk, rst,input [2:0] d,output reg co);
	reg[8:0] cnt;
   wire carry;
    always@(posedge clk,posedge rst)begin
		
        if(rst) cnt<={d,6'b000000};
        else if (carry) cnt<={d,6'b000000};
		  else cnt<=cnt+1;
		
    end 
	 always @(cnt) begin
			if(&cnt)co<=~co;
		end
	 assign carry=&cnt;
	/*always@(d)begin
		cnt<={d,6'b111111};
	end*/

endmodule


