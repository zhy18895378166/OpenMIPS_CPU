//timescale timeunit / timeprecision
`timescale 1ns/1ns

module inst_fetch_tb;

	//1.
	reg 			CLOCK;
	reg 			rst;
	wire[31:0]	inst;
	
	//4.待测试模块例化
	inst_fetch inst_fetch0(
		.clk(CLOCK),
		.rst(rst),
		.inst_o(inst)
	);
	
	
	//2.
	initial begin
		CLOCK = 1'b1;
		forever #10 CLOCK = ~CLOCK;
	end
	
	//3.
	initial begin
		rst = 1'b1;
		#195 rst = 1'b0;
		#1000 $stop;
	end
	
	
	
endmodule
