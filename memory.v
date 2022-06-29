module memory (
    input           i_Clk,
    input   [9:0]  iv_Address,
	 input			  i_R,
    input           iWE,
    input   [31:0]   iv_Data,
    output 	[31:0]	 ov_Data
);

reg [31:0]   rv_Mem [2047:0];
reg [31:0]   rv_Data;
assign ov_Data = rv_Data;

initial
begin
    $readmemh("ROMMemInit.txt",rv_Mem,0,2047);
end

always @(i_Clk)
begin
    if ( iWE )
    begin
        rv_Mem[iv_Address]    <=  iv_Data;
    end
	 else if(i_R)
	 begin
		rv_Data  <=  rv_Mem[iv_Address];    
	end
	else
	begin
		rv_Data <= rv_Data;
	end
end

endmodule
