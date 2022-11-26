`include "rtl/include/defines.v"

module mem(
	input wire				rst,
	
	//来自执行阶段的信息
	input wire[`RegAddrBus]			wd_addr_i,
	input wire				        wreg_i,
  	input wire[`RegBus]			    wdata_i,
	
	//访存的结果
	output reg[`RegAddrBus]			wd_addr_o,
	output reg				        wreg_o,
	output reg[`RegBus]			    wdata_o
);
	
	always @ (*) begin
		if(rst == `RstEnable) begin
			wd_addr_o	<= `NOPRegAddr;
			wreg_o		<= `WriteDisable;
			wdata_o		<= `ZeroWord;
		end else begin
			wd_addr_o		<= wd_addr_i;
			wreg_o			<= wreg_i;
			wdata_o			<= wdata_i;
		end
	end
	
	
endmodule
