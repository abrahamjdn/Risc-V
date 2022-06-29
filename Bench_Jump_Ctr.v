module Bench_Jump_Ctr();


	reg i_Clk;
	reg i_Branch;
	reg i_ForceJump;
	reg [2:0] iv_Func3;
	reg i_ALU_result;
	reg i_Zero;
	wire Branch_Mux;

Jump_Ctr Jump_Ctr(
	.i_Clk(i_Clk),
	.i_Branch(i_Branch),
	.i_ForceJump(i_ForceJump),
	.iv_Func3(iv_Func3),
	.i_ALU_result(i_ALU_result),
	.i_Zero(i_Zero),
	.Branch_Mux(Branch_Mux)
);

initial
begin
	i_Clk = 0;
	i_Branch = 1;
	i_ForceJump = 0;
	iv_Func3 = 0;
	i_ALU_result =0;
	i_Zero = 1;
	#100;
	i_ALU_result =1;
	i_Zero = 0;
	#100;
	

end



always
begin
	i_Clk = ~i_Clk;
	#20;
end

endmodule 
