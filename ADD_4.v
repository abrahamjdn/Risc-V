module ADD_4(
	input [31:0] iv_Dir,
	output reg[31:0] ov_Dir
);


always@*
begin
	ov_Dir <= iv_Dir + 3'd4;
end

endmodule 