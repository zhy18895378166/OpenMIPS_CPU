module rom(
	input 	wire 			ce,
	input 	wire[5:0]	addr,
	output	reg[31:0]	inst

);

	reg[31:0] rom[63:0];    //使用二维向量定义存储器
	initial begin
		$readmemh("./rtl/rom.data",rom);
	end
	
	always @ (*) begin
		if (ce == 1'b0) begin
			inst <= 32'h0;
		end else begin
			inst <= rom[addr];    //给出地址addr对应的指令
		end 
	end

endmodule
