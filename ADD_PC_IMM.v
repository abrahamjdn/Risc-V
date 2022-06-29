module ADD_PC_IMM(
	input [31:0] iv_Dir,
	input [31:0] iv_IMM,
	output [31:0] ov_PC_IMM

);

assign	ov_PC_IMM = iv_Dir + iv_IMM;

endmodule 