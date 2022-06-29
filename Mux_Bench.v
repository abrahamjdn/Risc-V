module Mux_Bench();

//-------------------------- Mux Instruction -----------------------------------------------
/*
	reg [4:0] iv_1;
	reg [4:0] iv_2;
	reg i_selector;
	wire [4:0] ov_1;

Mux_inst Mux_inst(
	.iv_reg_20_to_16 (iv_1),
	.iv_reg_15_to_11 (iv_2),
	.i_selector (i_selector),
	.ov_reg_inst (ov_1)
);
*/
//-------------------------- Mux Instruction -----------------------------------------------

//-------------------------- Mux ALU -------------------------------------------------------
/*
	reg [31:0] iv_1;
	reg [31:0] iv_2;
	reg i_selector;
	wire [31:0] ov_1;

Mux_ALU Mux_ALU(
	.iv_reg(iv_1),
	.iv_imm(iv_2),
	.i_selector(i_selector),
	.ov_reg_imm(ov_1)
);
*/
//-------------------------- Mux ALU ------------------------------------------------------


//-------------------------- Mux Mem or ALU -----------------------------------------------
	reg [31:0] iv_1;
	reg [31:0] iv_2;
	reg i_selector;
	wire [31:0] ov_1;
	
Mux_Mem_Alu Mux_Mem_Alu(
	.iv_Mem(iv_1),
	.iv_Reg(iv_2),
	.i_selector(i_selector),
	.ov_reg_Mem(ov_1)
);

//-------------------------- Mux Mem or ALU -----------------------------------------------
initial
begin
	iv_1 = 1;
	iv_2 = 2;
	i_selector = 1;
	#20;
	forever
	begin
		i_selector = ~i_selector;
		#100;
	end
end



endmodule 