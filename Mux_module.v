module Mux(input [7:0]wavegen,input [7:0] romout,input [2:0]SW,output [7:0]out);
		assign out= (SW==3'd6)? romout: wavegen;
		
endmodule