module Mux_Next_pc(
	input [31:0] iv_conmutador,
	input [31:0] iv_ALU,
	input i_Jump_Pc,
	output [31:0] ov_Next_pc
);

assign ov_Next_pc = i_Jump_Pc? iv_ALU:iv_conmutador;

endmodule 