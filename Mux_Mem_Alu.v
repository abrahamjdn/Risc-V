module Mux_Mem_Alu(
	input [31:0] iv_Mem,
	input [31:0] iv_Reg,
	input i_selector,
	output reg[31:0] ov_reg_Mem
);

always@*
begin
	if(i_selector)
	begin
		ov_reg_Mem <= iv_Mem;
	end
	else
	begin
		ov_reg_Mem <= iv_Reg;
	end
end 

endmodule 