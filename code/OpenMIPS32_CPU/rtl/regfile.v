`include "rtl/include/defines.v"

module regfile(
	
	input wire					clk,
	input wire					rst,
	
	//写端口
	input wire					we,
	input wire[`RegAddrBus]		waddr,
	input wire[`RegBus]			wdata,
	
	//读端口1
	input wire					re1,
	input wire[`RegAddrBus]		raddr1,
	output reg[`RegBus]		rdata1,
	
	//读端口2
	input wire					re2,
	input wire[`RegAddrBus]		raddr2,
	output reg[`RegBus]		rdata2,
	
	/*---------------------------------------------------------------------------------------*/
	/*							  fix bug 1:解决数据相关问题								 */
	/*---------------------------------------------------------------------------------------*/
	//处于执行阶段EX的指令的运算结果
	input wire				        ex_wreg_i,
	input wire[`RegAddrBus]			ex_wd_addr_i,
	input wire[`RegBus]			    ex_wdata_i,
	
	//处于访存阶段MEM的指令的运算结果
	input wire				        mem_wreg_i,
	input wire[`RegAddrBus]			mem_wd_addr_i,
	input wire[`RegBus]			    mem_wdata_i
);

/************************************************************************************************/
/*										第一段：定义32个32位寄存器								*/
/************************************************************************************************/
	reg[`RegBus] regs[0:`RegNum - 1];
	
/************************************************************************************************/
/*										第二段：写操作											*/
/************************************************************************************************/
	always @ (posedge clk) begin
		if(rst == `RstDisable) begin
			if((we == `WriteEnable) && (waddr != `ZERO_REG)) begin //判断目标寄存器不为0，是因为MIPS32架构规定$0的值只能为0
				regs[waddr] <= wdata;
			end
		end
	end


/************************************************************************************************/
/*										第三段：读端口1的读操作									*/
/************************************************************************************************/
	always @ (*) begin
		if(rst == `RstEnable) begin
			rdata1 <= `ZeroWord;
		end else if(raddr1 == `ZERO_REG) begin //$0寄存器恒为零
			rdata1 <= `ZeroWord;    
		
		
		/*---------------------------------------------------------------------------------------*/
		/*							  fix bug 1:解决数据相关问题								 */
		/*---------------------------------------------------------------------------------------*/
		/*EX阶段传回*/
		end else if((raddr1 == ex_wd_addr_i) && (ex_wreg_i == `WriteEnable)
					&& (ex_wreg_i == `ReadEnable)) begin
			rdata1	<= ex_wdata_i;
		/*MEM阶段传回*/
		end else if((raddr1 == mem_wd_addr_i) && (mem_wreg_i == `WriteEnable)
					&& (mem_wreg_i == `ReadEnable)) begin
			rdata1	<= mem_wdata_i;
		/* 回写阶段传回 */
		end else if((raddr1 == waddr) && (we == `WriteEnable) 
						&& (re1 == `ReadEnable)) begin //要读的寄存器与要写的寄存器一致
			rdata1 <= wdata;
		/*---------------------------------end---------------------------------------------------*/	
		
		end else if(re1 == `ReadEnable) begin
			rdata1 <= regs[raddr1];
		end else begin
			rdata1 <= `ZeroWord;
		end
	end

/************************************************************************************************/
/*										第四段：读端口2的读操作									*/
/************************************************************************************************/
	always @ (*) begin
		if(rst == `RstEnable) begin
			rdata2 <= `ZeroWord;
		end else if(raddr2 == `ZERO_REG) begin //$0寄存器恒为零
			rdata2 <= `ZeroWord; 
		
		/*---------------------------------------------------------------------------------------*/
		/*							  fix bug 1:解决数据相关问题								 */
		/*---------------------------------------------------------------------------------------*/
		/* EX阶段传回 */
		end else if((raddr2 == ex_wd_addr_i) && (ex_wreg_i == `WriteEnable)
					&& (ex_wreg_i == `ReadEnable)) begin
			rdata2	<= ex_wdata_i;
		/* MEM阶段传回 */
		end else if((raddr2 == mem_wd_addr_i) && (mem_wreg_i == `WriteEnable)
					&& (mem_wreg_i == `ReadEnable)) begin
			rdata2	<= mem_wdata_i;
		/* 回写阶段传回 */
		end else if((raddr2 == waddr) && (we == `WriteEnable) 
						&& (re2 == `ReadEnable)) begin //要读的寄存器与要写的寄存器一致
			rdata2 <= wdata;
		/*---------------------------------end---------------------------------------------------*/
		
		end else if(re2 == `ReadEnable) begin
			rdata2 <= regs[raddr2];
		end else begin
			rdata2 <= `ZeroWord;
		end
	end
	
	
endmodule
