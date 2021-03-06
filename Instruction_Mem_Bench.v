module Instruction_Mem_Bench();


reg i_Clk;
reg [10:0]  iv_Address;
wire [31:0] ov_Data;

Instruction_Mem Instruction_Mem(
    .i_Clk           (i_Clk),
    .iv_Address  (iv_Address),
    .ov_Data		  (ov_Data)
);


initial
begin
	i_Clk = 0;
	iv_Address = 0;
	#40;
	repeat(2)
	begin
		repeat(8)
		begin
		 iv_Address = iv_Address+1;
		 #100;
		end
		
		iv_Address = 2040;
		#100;
	end
end 

always
begin
 i_Clk = ~i_Clk;
 #20;
end


endmodule 