module register_file (
	input i_Clk,
	input i_Rst,
	input i_Enb,
	input iW_Enb,
	input [4:0] iv_Read_R1, //R = Register
	input [4:0] iv_Read_R2,
	input [4:0] iv_Write_R,
	input [31:0] iv_Write_Data,
	output reg [31:0] ov_Data_R1,
	output reg [31:0] ov_Data_R2

);

reg [31:0]  rv_Mem [31:0];

initial
begin
    $readmemh("Reg_Init.txt",rv_Mem,0,31);
end

always@(iv_Read_R1 or iv_Read_R2)
begin
	if(i_Enb)
	begin
		ov_Data_R1 <= rv_Mem[iv_Read_R1];
		ov_Data_R2 <= rv_Mem[iv_Read_R2];
	end
	else
	begin
		ov_Data_R1 <= ov_Data_R1;
		ov_Data_R2 <= ov_Data_R2;
	end
end

always@(posedge i_Clk)
begin
	if(iW_Enb)
	begin
		rv_Mem[iv_Write_R] <= iv_Write_Data;
	end
end
endmodule 