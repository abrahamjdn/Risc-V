module Alu_Control(
	input[3:0] iv_Alu_opcode,  // Bits 6,5,4 y 2 del Opcode
	input i_Bit_30,				//Bit 30 de la instruccion
	input [2:0] iv_funct3,  //Bits 14:12 de las instrucciones
	input ishamt_bit_25,
	output [4:0] ov_AluOp

);

reg [4:0] ov_AluOp_Q;

assign ov_AluOp = ov_AluOp_Q;

always@*
begin
	casex({iv_Alu_opcode,i_Bit_30,iv_funct3})
//------------------------------- Tipo I-l y S ------------------------------------
		8'b0000_xxxx,8'b0100_xxxx: ov_AluOp_Q = 5'b0; // I-l ,S-s
		
//------------------------------- Tipo I ------------------------------------
		8'b0010_x000: ov_AluOp_Q = 5'b0_0000; //addi
		8'b0010_x010: ov_AluOp_Q = 5'b0_1000; //slti
		8'b0010_x011: ov_AluOp_Q = 5'b0_1100; //sltiu
		8'b0010_x100: ov_AluOp_Q = 5'b1_0000; //xori
		8'b0010_x110: ov_AluOp_Q = 5'b1_1000; //ori
		8'b0010_x111: ov_AluOp_Q = 5'b1_1100; //andi
		8'b0010_0001: ov_AluOp_Q = ishamt_bit_25?5'b1_1111:5'b0_0100; //slli
		8'b0010_0101: ov_AluOp_Q = ishamt_bit_25?5'b1_1111:5'b1_0100; //srli
		8'b0010_1101: ov_AluOp_Q = ishamt_bit_25?5'b1_1111:5'b1_0110; //srai	
	
//------------------------------- Tipo R ------------------------------------
		8'b0110_0000: ov_AluOp_Q = 5'b0_0000; //add
		8'b0110_1000: ov_AluOp_Q = 5'b0_0010; //sub
		8'b0110_0001: ov_AluOp_Q = 5'b0_0100; //sll
		8'b0110_0010: ov_AluOp_Q = 5'b0_1000; //slt
		8'b0110_0011: ov_AluOp_Q = 5'b0_1100; //sltu
		8'b0110_0100: ov_AluOp_Q = 5'b1_0000; //xor
		8'b0110_0101: ov_AluOp_Q = 5'b1_0100; //srl
		8'b0110_1101: ov_AluOp_Q = 5'b1_0110; //sra
		8'b0110_0110: ov_AluOp_Q = 5'b1_1000; //or
		8'b0110_0111: ov_AluOp_Q = 5'b1_1100; //and
		
//------------------------------- Tipo B ------------------------------------
		8'b1100_x000: ov_AluOp_Q = 5'b0_0010; //Beq
		8'b1100_x001: ov_AluOp_Q = 5'b1_0000; //Bne
		8'b1100_x100: ov_AluOp_Q = 5'b0_1000; //Blt
		8'b1100_x101: ov_AluOp_Q = 5'b1_1010; //Bge
		8'b1100_x110: ov_AluOp_Q = 5'b0_1100; //Bltu
		8'b1100_x111: ov_AluOp_Q = 5'b1_1110; //Bgeu
		
//------------------------------- Otros ------------------------------------
		8'b1101_xxxx: ov_AluOp_Q = 5'b0_0000; // JAL & JALR
		8'b0111_xxxx: ov_AluOp_Q = 5'b1_1101; //LUI
		8'b0011_xxxx: ov_AluOp_Q = 5'b0_0000; //AUIPC
		
		default: ov_AluOp_Q = 5'b1_1111;
	
	endcase
end

endmodule 