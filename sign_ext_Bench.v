module sign_ext_Bench
#(parameter Type_U = 7'b011_0111,
  parameter Type_J = 7'b110_1111,
  parameter Type_B = 7'b110_0011,
  parameter Type_Ijalr = 7'b110_0111,
  parameter Type_I_l = 7'b000_0011,
  parameter Type_S = 7'b010_0011,
  parameter Type_I = 7'b001_0011
) 
();

	reg i_Clk;
	reg i_Rst;
	reg i_Enb;
	reg [31:0] iv_Data;
	wire [31:0] ov_Data;

sign_ext sign_ext
(
	.i_Clk(i_Clk),
	.i_Rst(i_Rst),
	.i_Enb(i_Enb),
	.iv_Data(iv_Data),
	.ov_Data(ov_Data)
);

initial
begin
	i_Clk = 0;
	i_Rst = 1;
	i_Enb = 1;
	iv_Data = 0;
	#100;
	i_Rst = 0;
// ------------------------------ Tipo I -------------------------------------------------------------

	iv_Data = {12'b1111_1111_1100, 13'bx_xxxx_xxxx_xxxx,Type_Ijalr};
	#500;
	iv_Data = {12'b0111_1111_1100, 13'bx_xxxx_xxxx_xxxx,Type_Ijalr};
	#500;
	iv_Data = {12'b1111_1111_1100, 13'bx_xxxx_xxxx_xxxx,Type_I_l};
	#500;
	iv_Data = {12'b0111_1111_1100, 13'bx_xxxx_xxxx_xxxx,Type_I_l};
	#500;
	iv_Data = {12'b1111_1111_1100, 13'bx_xxxx_xxxx_xxxx,Type_I};
	#500;
	iv_Data = {12'b0111_1111_1100, 13'bx_xxxx_xxxx_xxxx,Type_I};
	#500;
	
// ------------------------------ Tipo I -------------------------------------------------------------
	iv_Data = {7'b111_1111,13'bx_xxxx_xxxx_xxxx,5'b1_0000,Type_S};
	#500;
	iv_Data = {7'b011_1111,13'bx_xxxx_xxxx_xxxx,5'b1_0000,Type_S};
	#500;
	
	iv_Data = {1'b1,6'b11_1111,13'bx_xxxx_xxxx_xxxx,4'b1110,1'b1,Type_B};
	#500;
	iv_Data = {1'b0,6'b11_1111,13'bx_xxxx_xxxx_xxxx,4'b1110,1'b1,Type_B};
	#500;
	
	iv_Data = {20'b1111_1111_1111_1111_1100,5'bx_xxxx,Type_U};
	#500;
	iv_Data = {20'b0111_1111_1111_1111_1100,5'bx_xxxx,Type_U};
	#500;	
	
	iv_Data = {1'b1,10'b11_1111_1110,1'b0,8'b1111_1111,5'bx_xxxx,Type_J};
	#500;
	iv_Data = {1'b0,10'b11_1111_1110,1'b0,8'b1111_1111,5'bx_xxxx,Type_J};
	#500;
	
end

always
begin
 i_Clk = ~i_Clk;
 #20;
end



endmodule 