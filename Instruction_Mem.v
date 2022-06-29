module Instruction_Mem(
    input           i_Clk,
    input   [10:0]  iv_Address,
    output 	[31:0]		  ov_Data
);



reg [31:0]   rv_Mem [2047:0];
reg [31:0]   rv_Data;
assign ov_Data = rv_Data;

initial
begin
    $readmemb("Inst_Mem.txt",rv_Mem,0);
end

always @(iv_Address)
	begin
		rv_Data  <=  rv_Mem[iv_Address];    
	end
endmodule 



