module PC (
	input i_Clk,
	input i_Rst,
	input i_Enb,
	input [31:0] iv_Data,
	output [31:0] ov_Data
);


reg [31:0] ov_Data_Q;

assign ov_Data = ov_Data_Q;

always@(posedge i_Clk or posedge i_Rst)
begin
	if(i_Rst)
	begin
		ov_Data_Q <= 0;
	end
	else if(iv_Data > 13'd8_188)
	begin
		ov_Data_Q <= 0;
	end
	else if(i_Enb)
	begin
		ov_Data_Q <= iv_Data;
	end
	else
	begin
		ov_Data_Q <= ov_Data_Q;
	end

end 



endmodule 