module WaveFormGen_Module(input [2:0] SW,input Clk,Rst,output reg [7:0] OutAmp);
    wire [7:0] Cnt,FRes;
    Counter C1(Clk,Rst,Cnt);
    reg[15:0] temp,Res;
    reg[15:0] cos_res,cos_temp;
    always@(posedge Clk,posedge Rst)begin
        if(Rst) begin Res=0;cos_res=30000;end
		  else if(Clk) begin Res<=temp;
			cos_res<=cos_temp;end
    end
	 always@(Res,cos_res)begin
		temp=Res+{cos_res[15],cos_res[15],cos_res[15],cos_res[15],cos_res[15],cos_res[15],cos_res[15],cos_res[15:6]}; 
        cos_temp=cos_res-{temp[15],temp[15],temp[15],temp[15],temp[15],temp[15],temp[15],temp[15:6]};
	 end
    always@(Cnt,SW)begin
        
        case(SW)
          0:OutAmp<=8'd255/(256-Cnt);
          1:begin if(Cnt<8'd128)OutAmp<=8'd255;
                else OutAmp<=8'd0;end
          2:begin	if(Cnt==8'd0) OutAmp<=8'd0; 
				else if(Cnt<8'd128)OutAmp<=8'd2*(Cnt)-1;
                else OutAmp<=8'd255-2*(Cnt-128);end
          3:OutAmp<=temp[15:8]+8'd127;
          4:begin if((temp[15:8]+8'd127)<8'd128)OutAmp<=-temp[15:8]+127; else OutAmp<=temp[15:8]+127;end
          5:begin if((temp[15:8]+8'd127)<8'd128)OutAmp<=8'd128; else OutAmp<=temp[15:8]+127;end
          
          default:OutAmp<=8'd0;
        endcase
			
    end
endmodule
module Counter(input Clk,input Rst,output reg[7:0] Cnt);
    
    always@(posedge Clk,posedge Rst)begin
        if(Rst) Cnt<=8'b0;
        else Cnt<=Cnt+1;
    end  
    
endmodule 
module SinGen(input [2:0] Sw,input Clk,Rst,output reg [7:0]FRes);
  
  reg[15:0] temp,Res=0;
  reg[15:0] cos_res=30000,cos_temp;
  always@(posedge Clk)begin
      if(Rst) begin Res=0;cos_res=30000;end
      Res<=temp;
      cos_res<=cos_temp;
  end
  always@(Res)begin
    temp=Res+(1/64)*cos_res; 
    cos_temp=cos_res-(1/64)*temp;
    case(Sw)
        3:FRes<=temp[15:8]+127;
        5:begin if(temp<=0)FRes<=0;end
        4:begin if(temp<0)FRes<=-temp[15:8]+127;end
    endcase
  end

endmodule