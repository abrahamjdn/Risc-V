module ADD_imm(
	input i_Clk,
	input i_Rst,
	input i_Enb,
	input [31:0] iv_Dir,
	input [31:0] iv_imm,
	output [31:0] ov_Dir_shift
);

reg [31:0] ov_Dir_shift_Q;
reg [31:0] ov_Dir_shift_D;

assign ov_Dir_shift = ov_Dir_shift_Q;

always@(posedge i_Clk or posedge i_Rst)
begin
	if(i_Rst)
	begin
		ov_Dir_shift_Q <= 0;
	end
	else if(i_Enb)
	begin
		ov_Dir_shift_Q <= ov_Dir_shift_D;
	end
	else
	begin
		ov_Dir_shift_Q <= ov_Dir_shift_Q;
	end
end

always@*
begin
	ov_Dir_shift_D = iv_Dir + {iv_imm[29:0],2'b00};
end

endmodule 