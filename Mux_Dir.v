module Mux_Dir(
	input [31:0] iv_dir,
	input [31:0] iv_dir_shift,
	input i_selector,
	output reg[31:0] ov_dir
);

always@*
begin
	if(i_selector)
	begin
		ov_dir <= iv_dir;
	end
	else
	begin
		ov_dir <= iv_dir_shift;
	end
end 

endmodule 