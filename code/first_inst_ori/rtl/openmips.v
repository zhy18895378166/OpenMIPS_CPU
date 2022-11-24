`include "rtl/include/defines.v"

module openmips(
	input wire				clk,
	input wire				rst,
	
	input wire[`RegBus]		rom_data_i,
	
	output wire[`RegBus]	rom_addr_o,
	output wire				rom_ce_o
);
	
/************************************************************************************************/
/*										第一段：模块间连接变量的定义							    */
/************************************************************************************************/
	//1.连接PC模块与IF/ID模块的变量
	wire[`InstAddrBus]				pc;
	
	//2.连接IF/ID模块与译码阶段ID模块的变量（ID input）
	wire[`InstAddrBus]				id_pc_i;
	wire[`InstBus]					id_inst_i;
	
	//3.连接译码阶段ID模块输出与ID/EX模块输入的变量（ID output）
	wire[`AluOpBus]				id_aluop_o;
	wire[`AluSelBus]			id_alusel_o;
	wire[`RegBus]				id_reg1_o;
	wire[`RegBus]				id_reg2_o;
	wire[`RegAddrBus]			id_wd_addr_o;
	wire						id_wreg_o;
	
	//4.连接ID/EX模块输出与执行阶段EX模块的输入的变量（EX input）
	wire[`AluOpBus]				ex_aluop_i;
	wire[`AluSelBus]			ex_alusel_i;
	wire[`RegBus]				ex_reg1_i;
	wire[`RegBus]				ex_reg2_i;
	wire[`RegAddrBus]			ex_wd_addr_i;
	wire						ex_wreg_i;
	
	
	//5. 连接执行阶段EX模块的输出与EX/MEM模块的输入的变量（EX output）
	wire[`RegAddrBus]		ex_wd_addr_o;
	wire					ex_wreg_o;
	wire[`RegBus]			ex_wdata_o;
	
	//6.连接EX/MEM模块的输出与访存阶段MEM模块的输入的变量（MEM input）
	wire[`RegAddrBus]		mem_wd_addr_i;
	wire					mem_wreg_i;
	wire[`RegBus]			mem_wdata_i;
	
	//7.连接访存阶段MEM模块的输出与MEM/WB模块的输入的变量(MEM output)
	wire[`RegAddrBus]		mem_wd_addr_o;
	wire					mem_wreg_o;
	wire[`RegBus]			mem_wdata_o;
	
	//8.连接MEM/WB模块的输出与回写阶段的输入的变量
	wire[`RegAddrBus]		wb_wd_addr_i;
	wire					wb_wreg_i;
	wire[`RegBus]			wb_wdata_i;
	
	//9.连接译码阶段ID模块与通用寄存器Regfile模块的变量
	wire					reg1_read;
	wire					reg2_read;
	wire[`RegAddrBus]		reg1_addr;
	wire[`RegBus]			reg1_data;
	wire[`RegAddrBus]		reg2_addr;
	wire[`RegBus]			reg2_data;
	
/************************************************************************************************/
/*										第二段：各模块例化									    */
/************************************************************************************************/
	//1.pc_reg例化
	pc_reg	pc_reg0(
		.clk(clk),		.rst(rst),	
		
		.pc(pc),
		.ce(rom_ce_o)
	);
	assign rom_addr_o  = pc;   //指令存储器的输入地址就是pc的值
	
	//2.IF/ID模块例化
	if_id  if_id0(
		.clk(clk),		.rst(rst),	  	.if_inst(rom_data_i),
		
		.if_pc(pc),		
		.id_pc(id_pc_i),
		.id_inst(id_inst_i)
	);
	
	//3.译码阶段ID模块例化
	id id0(
		.rst(rst),		.pc_i(id_pc_i),		.inst_i(id_inst_i),
		
		//来自Regfile模块的信息
		.reg1_data_i(reg1_data),		.reg2_data_i(reg2_data),
		
		//送到Regfile模块的信息
		.reg1_read_o(reg1_read),		.reg2_read_o(reg2_read),
		.reg1_addr_o(reg1_addr),		.reg2_addr_o(reg2_addr),
		
		//送到ID/EX模块的信息
		.aluop_o(id_aluop_o),			.alusel_o(id_alusel_o),
		.reg1_o(id_reg1_o),				.reg2_o(id_reg2_o),
		.wd_addr_o(id_wd_addr_o),		.wreg_o(id_wreg_o)
	);
	
	
	//4.通用寄存器Regfile模块例化
	regfile regfile0(
		.clk(clk),			.rst(rst),
		.we(wb_wreg_i),		.waddr(wb_wd_addr_i),	.wdata(wb_wdata_i),
		
		.re1(reg1_read),	.raddr1(reg1_addr),		.rdata1(reg1_data),
		.re2(reg2_read),	.raddr2(reg2_addr),		.rdata2(reg2_data)
	);
	
	//5.ID/EX模块例化
	id_ex id_ex0(
		.clk(clk),					.rst(rst),
		
		//从译码阶段ID模块传递过来的信息
		.id_aluop(id_aluop_o),		.id_alusel(id_alusel_o),
		.id_reg1(id_reg1_o),		.id_reg2(id_reg2_o),
		.id_wd_addr(id_wd_addr_o),	.id_wreg(id_wreg_o),
		
		//传递到执行阶段EX模块的信息
		.ex_aluop(ex_aluop_i),		.ex_alusel(ex_alusel_i),
		.ex_reg1(ex_reg1_i),		.ex_reg2(ex_reg2_i),
		.ex_wd_addr(ex_wd_addr_i),	.ex_wreg(ex_wreg_i)
	);
	
	//6.EX模块例化
	ex ex0(
		.rst(rst),
		
		//从ID/EX模块传递过来的信息
		.aluop_i(ex_aluop_i),		.alusel_i(ex_alusel_i),
		.reg1_i(ex_reg1_i),			.reg2_i(ex_reg2_i),
		.wd_addr_i(ex_wd_addr_i),	.wreg_i(ex_wreg_i),
		
		//输出到EX/MEM模块的信息
		.wreg_o(ex_wreg_o),			.wd_addr_o(ex_wd_addr_o),	.wdata_o(ex_wdata_o)
	);
	
	//7.EX/MEM模块例化
	ex_mem ex_mem0(
		.clk(clk),					.rst(rst),
		
		//来自执行阶段EX模块的信息
		.ex_wreg(ex_wreg_o),			.ex_wd_addr(ex_wd_addr_o),	.ex_wdata(ex_wdata_o),
		
		//送到访存阶段MEM模块的信息
		.mem_wreg(mem_wreg_i),			.mem_wd_addr(mem_wd_addr_i),	.mem_wdata(mem_wdata_i)
	);
	
	//8.MEM模块例化
	mem mem0(
		.rst(rst),
		
		//来自EX/MEM模块的信息
		.wreg_i(mem_wreg_i),			.wd_addr_i(mem_wd_addr_i),	.wdata_i(mem_wdata_i),
		
		//s送到MEM/WB模块的信息
		.wreg_o(mem_wreg_o),			.wd_addr_o(mem_wd_addr_o),	.wdata_o(mem_wdata_o)
	);
	
	//9.MEM/WB模块例化
	mem_wb mem_wb0(
		.clk(clk),					.rst(rst),
		
		//来自访存阶段MEM模块的信息
		.mem_wreg(mem_wreg_o),			.mem_wd_addr(mem_wd_addr_o),	.mem_wdata(mem_wdata_o),
		
		//送到回写阶段的信息
		.wb_wreg(wb_wreg_i),			.wb_wd_addr(wb_wd_addr_i),	.wb_wdata(wb_wdata_i)
	);
	
endmodule