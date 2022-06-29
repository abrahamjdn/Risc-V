module Mux_conmutador_muxMem(
	input [31:0] iv_Conmutador,
	input [31:0] iv_Mem,
	input i_Jump_RD,
	output [31:0] ov_Next_write_reg
);

assign ov_Next_write_reg = i_Jump_RD? iv_Conmutador:iv_Mem;

endmodule 