module ALU(
	input [31:0] iv_A,
	input [31:0] iv_B,
	input [4:0] iv_ALUop,
	output o_zero_flag,
	output reg [31:0] ov_result
	
);

assign o_zero_flag = (ov_result==0);


always @*
begin
	case(iv_ALUop)
		5'b0_0000: ov_result <= iv_A + iv_B;  														//add
		5'b0_0010: ov_result <= iv_A - iv_B;  														//sub
		5'b0_0100: ov_result <= iv_A << iv_B[4:0]; 												//sll
		5'b0_1000: ov_result <= ($signed(iv_A) < $signed(iv_B)) ? 1 : 0; 					//slt
		5'b0_1100: ov_result <= ($unsigned(iv_A) < $unsigned(iv_B)) ? 1 : 0; 			//sltu
		5'b1_0000: ov_result <= iv_A ^ iv_B; 														//xor
		5'b1_0100: ov_result <= $unsigned(iv_A) >> $unsigned(iv_B[4:0]); 					//srl
		5'b1_0110: ov_result <= $signed(iv_A) >>> $signed(iv_B[4:0]) ;						//sra
		5'b1_1000: ov_result <= iv_A | iv_B; 														//or
		5'b1_1100: ov_result <= iv_A & iv_B; 														//and
		5'b1_1010: ov_result <= ($signed(iv_A) >= $signed(iv_B)) ? 1 : 0;					//bge
		5'b1_1110: ov_result <= ($unsigned(iv_A) >= $unsigned(iv_B)) ? 1 : 0;			//bgeu
		5'b1_1101: ov_result <= iv_B;																	//LUI
		
		default: ov_result <= 0;
	endcase
end

endmodule 