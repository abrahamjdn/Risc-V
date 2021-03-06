module ADD_imm_Bench();

	reg i_Clk;
	reg i_Rst;
	reg i_Enb;
	reg [31:0] iv_Dir;
	reg [31:0] iv_imm;
	wire [31:0] ov_Dir_shift;
	
	

ADD_imm ADD_imm(
	.i_Clk(i_Clk),
	.i_Rst(i_Rst),
	.i_Enb(i_Enb),
	.iv_Dir(iv_Dir),
	.iv_imm(iv_imm),
	.ov_Dir_shift(ov_Dir_shift)
);


initial
begin
	i_Clk = 0;
	i_Rst = 1;
	i_Enb = 1;
	iv_Dir = 0;
	iv_imm = 32'hFFFF_FFFF;
	#100;
	i_Rst = 0;
	repeat(10)
	begin
		iv_imm <= ov_Dir_shift;
		#500;
	end
end


always
begin
	i_Clk = ~i_Clk;
	#20;
end


endmodule 