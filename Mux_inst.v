module Mux_inst(
	input [4:0] iv_reg_24_to_20,
	input [4:0] iv_reg_11_to_7,
	input i_selector,
	output reg[4:0] ov_reg_inst
);

always@*
begin
	if(i_selector)
	begin
		ov_reg_inst <= iv_reg_24_to_20;
	end
	else
	begin
		ov_reg_inst <= iv_reg_11_to_7;
	end
end 

endmodule 