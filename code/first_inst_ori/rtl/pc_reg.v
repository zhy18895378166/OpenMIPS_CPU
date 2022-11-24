`include "rtl/include/defines.v"

module pc_reg(
	
	input wire 								clk,
	input wire 								rst,
	
	output reg[`InstAddrBus] 	pc,
	output reg 								ce
);

	
	//1.reset
	always@(posedge clk) begin   	//在时钟信号上升沿触发
		if(rst == `RstEnable) begin
			ce <= `ChipDisable;					//复位信号有效时，指令存储器使能信号无效
		end else begin
			ce <= `ChipEnable;				//复位信号无效时，指令存储器使能信号有效
		end
	end
	
	//2.pc
	always@(posedge clk) begin
		if(ce == `ChipDisable)begin
			pc <= 32'h00000000;        //指令存储器使能信号无效时，pc保持为0
		end else begin
			pc <= pc + 4'h4;		//指令存储器使能信号有效时，pc在时钟上升沿+4
		end
	end
	

endmodule
