module Control_Unit
#(parameter Type_U = 7'b011_0111,
  parameter Type_J = 7'b110_1111,
  parameter Type_B = 7'b110_0011,
  parameter Type_Ijalr = 7'b110_0111,
  parameter Type_I_l = 7'b000_0011,
  parameter Type_S = 7'b010_0011,
  parameter Type_I = 7'b001_0011,
  parameter Type_R = 7'b011_0011
)(
	input [6:0] iv_OpCode,
	output reg Funct3,
	output reg ForceJump,
	output reg Branch,
	output reg Jump_PC,
	output reg JumpRD,
	output reg Mem_To_Reg,
	output reg Mem_Write,
	output reg Mem_Read,
	output reg ALUsrc,
	output reg LUIsrc,
	output reg [3:0] AluOp,
	output reg Reg_Write,
	
	output reg Reg_Dst
);


always@*
begin
		AluOp = {iv_OpCode[6:4],iv_OpCode[2]};
		case(iv_OpCode)
		
			Type_I_l:
			begin
				ALUsrc = 1;
				Reg_Dst = 0;
				Reg_Write = 1;
				Mem_To_Reg = 1;	
				Mem_Read = 1;
				
				//------Default-------
				Funct3 = 0;
				ForceJump = 0;
				Branch = 0;
				Jump_PC = 0;
				JumpRD = 0;
				Mem_Write = 0;
				LUIsrc = 0;
			end
			
			Type_S:
			begin
				Mem_Write = 1;
				ALUsrc = 1;
				//------Default-------
				Funct3 = 0;
				ForceJump = 0;
				Branch = 0;
				Jump_PC = 0;
				JumpRD = 0;
				Mem_To_Reg = 0;
				Mem_Read = 0;
				LUIsrc = 0;
				Reg_Write= 0;
				Reg_Dst = 0;
			end
			
			Type_I:
			begin
				ALUsrc = 1;
				Reg_Dst = 0;
				Reg_Write = 1;
				Mem_To_Reg = 0;
				//------Default-------
				Funct3 = 0;
				ForceJump = 0;
				Branch = 0;
				Jump_PC = 0;
				JumpRD = 0;
				Mem_Write = 0;
				Mem_Read = 0;
				LUIsrc = 0;
			end
			
			Type_R:
			begin
				Reg_Dst = 0;
				Reg_Write = 1;
				ALUsrc = 0;
				Mem_To_Reg = 0;
				//------Default-------
				Funct3 = 0;
				ForceJump = 0;
				Branch = 0;
				Jump_PC = 0;
				JumpRD = 0;
				Mem_Write = 0;
				Mem_Read = 0;
				LUIsrc = 0;
			end
			
			Type_B:
			begin
				Branch = 1;
				ALUsrc = 0;
				ForceJump = 0;
				//------Default-------
				Funct3 = 0;
				Jump_PC = 0;
				JumpRD = 0;
				Mem_To_Reg = 0;
				Mem_Write = 0;
				Mem_Read = 0;
				LUIsrc = 0;
				Reg_Write= 0;
				Reg_Dst = 0;
			end
			
			Type_J:
			begin
				Branch = 1;
				ForceJump = 1;
				JumpRD = 1;
				Reg_Write= 1;
				ALUsrc = 1;
				Jump_PC = 0;
				//------Default-------
				Funct3 = 0;
				Mem_To_Reg = 0;
				Mem_Write = 0;
				Mem_Read = 0;
				LUIsrc = 0;
				Reg_Dst = 0;
			end
			
			Type_Ijalr:
			begin
				Branch = 1;
				ForceJump = 1;
				JumpRD = 1;
				Reg_Write= 1;
				ALUsrc = 1;
				Jump_PC = 1;
				//------Default-------
				Funct3 = 0;
				Mem_To_Reg = 0;
				Mem_Write = 0;
				Mem_Read = 0;
				LUIsrc = 0;
				Reg_Dst = 0;
			end
			
			Type_U:
			begin
				ALUsrc = 1;
				Mem_To_Reg = 0;
				JumpRD = 0;
				Reg_Write= 1;
				//------Default-------
				Funct3 = 0;
				ForceJump = 0;
				Branch = 0;
				Jump_PC = 0;
				Mem_Write = 0;
				Mem_Read = 0;
				LUIsrc = 0;
				Reg_Dst = 0;
			end
			
			7'b001_0111: //AUIPC
			begin
				JumpRD = 1;
				Reg_Write= 1;
				//------Default-------
				Mem_To_Reg = 0;
				ALUsrc = 0;
				Funct3 = 0;
				ForceJump = 0;
				Branch = 0;
				Jump_PC = 0;
				Mem_Write = 0;
				Mem_Read = 0;
				LUIsrc = 0;
				Reg_Dst = 0;
			end
			
			
			default
			begin
				Funct3 = 0;
				ForceJump = 0;
				Branch = 0;
				Jump_PC = 0;
				JumpRD = 0;
				Mem_To_Reg = 0;
				Mem_Write = 0;
				Mem_Read = 0;
				ALUsrc = 0;
				LUIsrc = 0;
				Reg_Write= 0;
				Reg_Dst = 0;
			end
		endcase
end



endmodule 