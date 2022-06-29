module Jump_Ctr(
	input i_Clk,
	input i_Branch,
	input i_ForceJump,
	input [2:0] iv_Func3,
	input i_ALU_result,
	input i_Zero,
	output reg Branch_Mux
);


always@*
begin
	casex({i_Branch,i_ForceJump,iv_Func3,i_ALU_result,i_Zero})
	7'b1_1_xxx_x_x: Branch_Mux = 1'b1;
	7'b1_0_000_x_1: Branch_Mux = 1'b1;
	7'b1_0_001_x_0: Branch_Mux = 1'b1;
	7'b1_0_010_x_x: Branch_Mux = 1'b0;
	7'b1_0_011_x_x: Branch_Mux = 1'b0;
	7'b1_0_100_1_x: Branch_Mux = 1'b1;
	7'b1_0_101_1_x: Branch_Mux = 1'b1;
	7'b1_0_110_1_x: Branch_Mux = 1'b1;
	7'b1_0_111_1_x: Branch_Mux = 1'b1;
	7'b0_1_xxx_x_x: Branch_Mux = 1'b0;
	7'b0_0_xxx_x_x: Branch_Mux = 1'b0;
	default: Branch_Mux = 1'b0;
	
	endcase
end





endmodule 