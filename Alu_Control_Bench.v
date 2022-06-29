module Alu_Control_Bench();

	reg i_Clk;
	reg i_Rst;
	reg i_Enb;
	reg[3:0] iv_Alu_opcode;  // Bits 6;5;4 y 2 del Opcode
	reg i_Bit_30;				//Bit 30 de la instruccion
	reg [2:0] iv_funct3;  //Bits 14:12 de las instrucciones
	wire [4:0] ov_AluOp;


Alu_Control Alu_Control(
	.i_Clk(i_Clk),
	.i_Rst(i_Rst),
	.i_Enb(i_Enb),
	.iv_Alu_opcode(iv_Alu_opcode),  // Bits 6(),5(),4 y 2 del Opcode
	.i_Bit_30(i_Bit_30),				//Bit 30 de la instruccion
	.iv_funct3(iv_funct3),  //Bits 14:12 de las instrucciones
	.ov_AluOp (ov_AluOp)

);

initial
begin
	i_Clk = 0;
	i_Rst = 1;
	i_Enb = 1;
	iv_Alu_opcode = 0;
	i_Bit_30 = 0;
	iv_funct3 = 0;
	#100;
	i_Rst = 0;
// --------------------- Tipo I ---------------------------------------
	iv_Alu_opcode = 4'b0000; i_Bit_30 = 1'bx; iv_funct3 = 3'b000;
	#50;
	iv_Alu_opcode = 4'b0000; i_Bit_30 = 1'bx; iv_funct3 = 3'b001;
	#50;
	iv_Alu_opcode = 4'b0000; i_Bit_30 = 1'bx; iv_funct3 = 3'b010;
	#50;
	iv_Alu_opcode = 4'b0000; i_Bit_30 = 1'bx; iv_funct3 = 3'b100;
	#50;
	iv_Alu_opcode = 4'b0000; i_Bit_30 = 1'bx; iv_funct3 = 3'b101;
	#50;
// --------------------- Tipo I ---------------------------------------

// --------------------- Tipo S ---------------------------------------
	iv_Alu_opcode = 4'b0100; i_Bit_30 = 1'bx; iv_funct3 = 3'b000;
	#50;
	iv_Alu_opcode = 4'b0100; i_Bit_30 = 1'bx; iv_funct3 = 3'b001;
	#50;
	iv_Alu_opcode = 4'b0100; i_Bit_30 = 1'bx; iv_funct3 = 3'b010;
	#50;
// --------------------- Tipo S ---------------------------------------

// --------------------- Tipo I ---------------------------------------
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'bx; iv_funct3 = 3'b000;
	#50;
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'bx; iv_funct3 = 3'b010;
	#50;
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'bx; iv_funct3 = 3'b011;
	#50;
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'bx; iv_funct3 = 3'b100;
	#50;
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'bx; iv_funct3 = 3'b110;
	#50;
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'bx; iv_funct3 = 3'b111;
	#50;
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'b0; iv_funct3 = 3'b001;
	#50;
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'b0; iv_funct3 = 3'b101;
	#50;
	iv_Alu_opcode = 4'b0010; i_Bit_30 = 1'b1; iv_funct3 = 3'b101;
	#50;
// --------------------- Tipo I ---------------------------------------

// --------------------- Tipo R ---------------------------------------
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b0; iv_funct3 = 3'b000;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b1; iv_funct3 = 3'b000;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b0; iv_funct3 = 3'b001;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b0; iv_funct3 = 3'b010;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b0; iv_funct3 = 3'b011;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b0; iv_funct3 = 3'b100;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b0; iv_funct3 = 3'b101;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b1; iv_funct3 = 3'b101;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b0; iv_funct3 = 3'b110;
	#50;
	iv_Alu_opcode = 4'b0110; i_Bit_30 = 1'b0; iv_funct3 = 3'b111;
	#50;
// --------------------- Tipo R ---------------------------------------
end

always
begin
	i_Clk = ~i_Clk;
	#20;
end

endmodule 