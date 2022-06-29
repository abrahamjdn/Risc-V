module conmutador (
	input [31:0] iv_pc,
	input [31:0] iv_pc_imm,
	input i_Branch_Muxm,
	output reg[31:0] ov_write_data,
	output reg[31:0] ov_Next_pc

);

always@*
begin
	if(i_Branch_Muxm)
	begin
		ov_Next_pc <= iv_pc_imm;
		ov_write_data <= iv_pc;
	end
	else
	begin
		ov_Next_pc <= iv_pc;
		ov_write_data <= iv_pc_imm;
	end

end



endmodule 