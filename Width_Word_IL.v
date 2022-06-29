module Width_Word_IL (
	input [31:0] iv_Data_Word,
	input[3:0] iv_Alu_opcode,  // Bits 6,5,4 y 2 del Opcode
	input [2:0] iv_funct3,  //Bits 14:12 de las instrucciones
	output [31:0] ov_Data_Word
);

reg [31:0] ov_Data_Word_Q;

assign ov_Data_Word = ov_Data_Word_Q;
always@*
begin
	case({iv_Alu_opcode,iv_funct3})
		7'b0000_000: ov_Data_Word_Q = {{24{iv_Data_Word[7]}},iv_Data_Word[7:0]}; //lb
		7'b0000_001: ov_Data_Word_Q = {{16{iv_Data_Word[15]}},iv_Data_Word[15:0]};//lh
		7'b0000_010: ov_Data_Word_Q = iv_Data_Word;		 //lw
		7'b0000_100: ov_Data_Word_Q = {24'b0,iv_Data_Word[7:0]}; //lbu
		7'b0000_101: ov_Data_Word_Q = {16'b0,iv_Data_Word[15:0]};//lh
		default ov_Data_Word_Q = iv_Data_Word;
	endcase

end



endmodule 