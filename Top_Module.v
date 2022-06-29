module Top_Module(
	input i_Clk,
	input i_Rst,
	input i_Enb
);


//---------------------Mux_Dir---------------------
wire [31:0] ov_dir_mux;
wire [31:0] ov_Dir_shift;
wire [31:0] ov_Dir;
wire [31:0] ov_Data_PC;
wire [31:0] ov_Data;
wire [4:0] ov_reg_inst;
wire [31:0] ov_Data_R1;
wire [31:0] ov_Data_R2;
wire [31:0] ov_Data_sign;
wire [31:0] ov_reg_imm;
wire [4:0] ov_AluOp;
wire o_zero_flag;
wire[31:0] ov_result;
wire[31:0]	 ov_Data_mem;
wire [31:0] ov_reg_Mem;
wire Funct3;
wire ForceJump;
wire Branch;
wire Jump_PC;
wire JumpRD;
wire Mem_To_Reg;
wire Mem_Write;
wire Mem_Read;
wire ALUsrc;
wire LUIsrc;
wire [3:0]AluOp;
wire Reg_Write;

wire Reg_Dst;
wire [31:0] ov_Data_mem_2;
wire [31:0] ov_Data_R2_2;
wire [31:0] ov_PC_IMM;
wire Branch_Mux;
wire [31:0] ov_Next_pc;
wire [31:0] ov_write_data;
wire [31:0] ov_Next_pc_2;
wire [31:0] ov_Next_write_reg;

//---------------------ADD_4---------------------

	
ADD_4 ADD_4(
	.iv_Dir(ov_Data_PC),
	.ov_Dir(ov_Dir)
);
//---------------------ADD_4---------------------

//---------------------PC---------------------


PC PC (
	.i_Clk (i_Clk),
	.i_Rst (i_Rst),
	.i_Enb (i_Enb),
	.iv_Data (ov_Next_pc_2),
	.ov_Data (ov_Data_PC)
);
//---------------------PC---------------------

//---------------------Instruction_Mem---------------------
Instruction_Mem Instruction_Mem(
    .i_Clk           (i_Clk),
    .iv_Address  (ov_Data_PC[31:2]),
    .ov_Data		  (ov_Data)
);
//---------------------Instruction_Mem---------------------

//---------------------Mux_inst--------------------- *********SE ELIMINA

Mux_inst Mux_inst(
	.iv_reg_24_to_20 (ov_Data[24:20]),
	.iv_reg_11_to_7 (ov_Data[11:7]),
	.i_selector (Reg_Dst),
	.ov_reg_inst (ov_reg_inst)
	);
//---------------------Mux_inst---------------------
	
//---------------------register_file---------------------	


register_file register_file (
	.i_Clk(i_Clk),
	.i_Rst(i_Rst),
	.i_Enb(i_Enb),
	.iW_Enb(Reg_Write),
	.iv_Read_R1(ov_Data[19:15]), //R = Register
	.iv_Read_R2(ov_Data[24:20]),
	.iv_Write_R(ov_reg_inst),
	.iv_Write_Data(ov_Next_write_reg),
	.ov_Data_R1(ov_Data_R1),
	.ov_Data_R2(ov_Data_R2)

);
//---------------------register_file---------------------

//---------------------sign_ext---------------------

sign_ext sign_ext
(
	.iv_Data(ov_Data),
	.ov_Data(ov_Data_sign)
);
//---------------------sign_ext---------------------

//---------------------Mux_ALU---------------------

Mux_ALU Mux_ALU(
	.iv_reg(ov_Data_R2),
	.iv_imm(ov_Data_sign),
	.i_selector(ALUsrc),
	.ov_reg_imm(ov_reg_imm)
);
//---------------------Mux_ALU---------------------

//---------------------Alu_Control---------------------
	
Alu_Control Alu_Control(

	.iv_Alu_opcode(AluOp),  // Bits 6(),5(),4 y 2 del Opcode
	.i_Bit_30(ov_Data[30]),				//Bit 30 de la instruccion
	.iv_funct3(ov_Data[14:12]),  //Bits 14:12 de las instrucciones
	.ishamt_bit_25(ov_Data[25]),
	.ov_AluOp (ov_AluOp)

);
//---------------------Alu_Control---------------------

//---------------------ALU---------------------

ALU ALU(
	.iv_A(ov_Data_R1),
	.iv_B(ov_reg_imm),
	.iv_ALUop(ov_AluOp),
	.o_zero_flag(o_zero_flag),
	.ov_result(ov_result)
	
);
//---------------------ALU---------------------

//---------------------memory---------------------

memory memory (
    .i_Clk(i_Clk),
    .iv_Address(ov_result),
	 .i_R(Mem_Read),
    .iWE(Mem_Write),
    .iv_Data(ov_Data_R2_2),
    .ov_Data(ov_Data_mem)
);
//---------------------memory---------------------

//---------------------Mux_Mem_Alu--------------------

	
Mux_Mem_Alu Mux_Mem_Alu(
	.iv_Mem(ov_Data_mem_2),
	.iv_Reg(ov_result),
	.i_selector(Mem_To_Reg),
	.ov_reg_Mem(ov_reg_Mem)
);
//---------------------Mux_Mem_Alu--------------------

//---------------------Control_Unit-------------------*************PENDIENTE
Control_Unit Control_Unit
(
	.iv_OpCode(ov_Data[6:0]),
	.Funct3(Funct3),
	.ForceJump(ForceJump),
	.Branch(Branch),
	.Jump_PC(Jump_PC),
	.JumpRD(JumpRD),
	.Mem_To_Reg(Mem_To_Reg),
	.Mem_Write(Mem_Write),
	.Mem_Read(Mem_Read),
	.ALUsrc(ALUsrc),
	.LUIsrc(LUIsrc),
	.AluOp(AluOp),
	.Reg_Write(Reg_Write),
	
	.Reg_Dst(Reg_Dst)
);
//---------------------Control_Unit-------------------

//---------------------Width_Word_IL-------------------


Width_Word_IL Width_Word_IL (
	.iv_Data_Word(ov_Data_mem),
	.iv_Alu_opcode(AluOp),  // Bits 6,5,4 y 2 del Opcode
	.iv_funct3(ov_Data[14:12]),  //Bits 14:12 de las instrucciones
	.ov_Data_Word(ov_Data_mem_2)
);

//---------------------Width_Word_IL-------------------

//---------------------Width_Word_S-------------------
Width_Word_S Width_Word_S (
	.iv_Data_Word(ov_Data_R2),
	.iv_Alu_opcode(AluOp),  // Bits 6,5,4 y 2 del Opcode
	.iv_funct3(ov_Data[14:12]),  //Bits 14:12 de las instrucciones
	.ov_Data_Word_S(ov_Data_R2_2)
);

//---------------------Width_Word_IL-------------------

//---------------------ADD_PC_IMM-------------------

ADD_PC_IMM ADD_PC_IMM(
	.iv_Dir(ov_Data_PC),
	.iv_IMM(ov_Data_sign>>1),
	.ov_PC_IMM(ov_PC_IMM)
);
//---------------------ADD_PC_IMM-------------------

//---------------------Jump_Ctr-------------------**********

Jump_Ctr Jump_Ctr(
	.i_Clk(i_Clk),
	.i_Branch(Branch),
	.i_ForceJump(ForceJump),
	.iv_Func3(ov_Data[14:12]),
	.i_ALU_result(ov_result[0]),
	.i_Zero(o_zero_flag),
	.Branch_Mux(Branch_Mux)
);
//---------------------Jump_Ctr-------------------

//---------------------conmutador-------------------

conmutador conmutador (
	.iv_pc(ov_Dir),
	.iv_pc_imm(ov_PC_IMM),
	.i_Branch_Muxm(Branch_Mux),
	.ov_write_data(ov_write_data),
	.ov_Next_pc(ov_Next_pc)

);
//---------------------conmutador-------------------

//---------------------Mux_Next_pc-------------------

Mux_Next_pc Mux_Next_pc(
	.iv_conmutador(ov_Next_pc),
	.iv_ALU(ov_result),
	.i_Jump_Pc(Jump_PC),
	.ov_Next_pc(ov_Next_pc_2)
);
//---------------------Mux_Next_pc-------------------

//---------------------Mux_conmutador_muxMem-------------------

Mux_conmutador_muxMem Mux_conmutador_muxMem(
	.iv_Conmutador(ov_write_data),
	.iv_Mem(ov_reg_Mem),
	.i_Jump_RD(JumpRD),
	.ov_Next_write_reg(ov_Next_write_reg)
);
//---------------------Mux_conmutador_muxMem-------------------


endmodule 