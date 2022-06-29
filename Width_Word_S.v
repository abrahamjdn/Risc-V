module Width_Word_S (
	input [31:0] iv_Data_Word,
	input[3:0] iv_Alu_opcode,  // Bits 6,5,4 y 2 del Opcode
	input [2:0] iv_funct3,  //Bits 14:12 de las instrucciones
	output [31:0] ov_Data_Word_S


);

reg [31:0] ov_Data_Word_Q;

assign ov_Data_Word_S = ov_Data_Word_Q;
always@*
begin
	case({iv_Alu_opcode,iv_funct3})
		7'b0100_000: ov_Data_Word_Q = {24'b0,iv_Data_Word[7:0]}; //sb
		7'b0100_001: ov_Data_Word_Q = {16'b0,iv_Data_Word[15:0]};//sh
		7'b0100_010: ov_Data_Word_Q = iv_Data_Word;		 //sw
		default ov_Data_Word_Q = iv_Data_Word;
	endcase

end



endmodule 