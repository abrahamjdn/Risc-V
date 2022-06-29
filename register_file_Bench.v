module register_file_Bench();

	reg i_Clk;
	reg i_Rst;
	reg i_Enb;
	reg iW_Enb;
	reg [4:0] iv_Read_R1; //R = Register
	reg [4:0] iv_Read_R2;
	reg [4:0] iv_Write_R;
	reg [31:0] iv_Write_Data;
	wire [31:0] ov_Data_R1;
	wire [31:0] ov_Data_R2;

register_file register_file (
	.i_Clk(i_Clk),
	.i_Rst(i_Rst),
	.i_Enb(i_Enb),
	.iW_Enb(iW_Enb),
	.iv_Read_R1(iv_Read_R1), //R = Register
	.iv_Read_R2(iv_Read_R2),
	.iv_Write_R(iv_Write_R),
	.iv_Write_Data(iv_Write_Data),
	.ov_Data_R1(ov_Data_R1),
	.ov_Data_R2(ov_Data_R2)

);

initial
begin
	i_Rst = 1;
	i_Clk = 0;
	i_Enb = 1;
	iW_Enb = 0;
	iv_Read_R1 = 0;
	iv_Read_R2 = 1;
	iv_Write_R = 10;
	iv_Write_Data = 123456789;
	#100;
	i_Rst = 0;
	repeat(10)
	begin
		iv_Read_R1 = iv_Read_R1 + 1;
		iv_Read_R2 = iv_Read_R2 + 1;
		#60;
	end
	iW_Enb = 1;
	#40;
	iW_Enb = 0;
	#40;
	
	
end



always
begin
 i_Clk = ~i_Clk;
 #20;
end


endmodule 