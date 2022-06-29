module Top_Module_Bench();

	reg i_Clk;
	reg i_Rst;
	reg i_Enb;
	//wire [31:0] ov_Data_R1;
	//wire [31:0] ov_Data_R2;
Top_Module Top_Module(
	.i_Clk(i_Clk),
	.i_Rst(i_Rst),
	.i_Enb(i_Enb)
	//.ov_Data_R1(ov_Data_R1),
	//.ov_Data_R2(ov_Data_R2)
);

initial
begin
	i_Clk = 0;
	i_Rst = 1;
	i_Enb = 1;
	#120;
	i_Rst = 0;
	
end 

always 
begin
	i_Clk = ~i_Clk;
	#20;
end


endmodule 