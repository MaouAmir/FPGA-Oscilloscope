module AmpSelector (input clk, input [1:0] sel, input [7:0] d,output reg[7:0] wave);
	always @(sel) begin
		case(sel)
			2'd0: wave <= d;
			2'd1: wave <= {1'b0,d[7:1]};
			2'd2: wave <= {2'b0,d[7:2]};
			2'd3: wave <= {3'b0,d[7:3]};
			default: wave <= d;
		endcase
	end
endmodule
