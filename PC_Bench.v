module PC_Bench();

	reg i_Clk;
	reg i_Rst;
	reg i_Enb;
	reg [31:0] iv_Data;
	wire [31:0] ov_Data;

PC PC (
	.i_Clk (i_Clk),
	.i_Rst (i_Rst),
	.i_Enb (i_Enb),
	.iv_Data (iv_Data),
	.ov_Data (ov_Data)
);


initial
begin
	i_Clk = 0;
	i_Rst = 1;
	i_Enb = 1;
	iv_Data = 0;
	#100;
	i_Rst = 0;
	#100
	repeat(2)
	begin
		repeat(10)
		begin
			iv_Data = iv_Data +1;
			#100;
		end
		
		i_Enb = ~i_Enb;//Prueba Enable
		
		repeat(10)
		begin
			iv_Data = iv_Data +1;
			#100;
		end
		
	end

	
	
end


always
begin
	i_Clk = ~i_Clk;
	#20;
end 

endmodule 