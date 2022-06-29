module Mux_ALU(
	input [31:0] iv_reg,
	input [31:0] iv_imm,
	input i_selector,
	output reg[31:0] ov_reg_imm
);

always@*
begin
	if(i_selector)
	begin
		ov_reg_imm <= iv_imm;
	end
	else
	begin
		ov_reg_imm <= iv_reg;
	end
end 

endmodule 