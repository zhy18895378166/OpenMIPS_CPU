`include "rtl/include/defines.v"

module id(
	input wire						rst,
	input wire[`InstAddrBus]		pc_i,
	input wire[`InstBus]			inst_i,
	
	input wire[`RegBus]				reg1_data_i,
	input wire[`RegBus]				reg2_data_i,
	
	//输出给执行阶段的信息
	output reg[`AluOpBus]			aluop_o,
	output reg[`AluSelBus]			alusel_o,
	output reg[`RegBus]				reg1_o,
	output reg[`RegBus]				reg2_o,
	output reg[`RegAddrBus]			wd_addr_o,
	output reg						wreg_o,    //执行结果需要写入目标寄存器使能信号
	
	//输出给regfile的信息
	output reg 						reg1_read_o,
	output reg 						reg2_read_o,
	output reg[`RegAddrBus]			reg1_addr_o,
	output reg[`RegAddrBus]			reg2_addr_o
);
	
	/* 取指令的功能码 */
	wire[5:0] opcode = inst_i[`OPCODE];
	//wire[4:0] op2 = inst_i[10:6];
	//wire[5:0] op3 = inst_i[5:0];
	//wire[4:0] op4 = inst_i[20:16];
	
	/* 保存指令执行需要的立即数 */
	reg[`RegBus]	imm;
	
	/* 指令有效的标志 */
	reg inst_valid;
	
/************************************************************************************************/
/*										第一段：对指令进行译码									*/
/************************************************************************************************/
	always @ (*) begin
		aluop_o 	<= `EXE_NOP_OP;
		alusel_o 	<= `EXE_RES_NOP;
		wreg_o		<= `WriteDisable;
		reg1_read_o	<= `ReadDisable;
		reg2_read_o	<= `ReadDisable;
		imm			<= `ZeroWord;
		
		if(rst == `RstEnable) begin
			wd_addr_o	<= `NOPRegAddr;
			inst_valid	<= `InstValid;
			reg1_addr_o <= `NOPRegAddr;
			reg2_addr_o <= `NOPRegAddr;
		end else begin
			wd_addr_o	<= inst_i[`R_RD_REG];
			inst_valid	<= `InstInvalid;
			reg1_addr_o <= inst_i[`R_RS_REG];
			reg2_addr_o <= inst_i[`R_RT_REG];
			
			case(opcode)
				`EXE_ORI:	begin		//依据opcode的值判断是否是ori指令
						wreg_o		<= `WriteEnable;	/* ori指令需要将结果写入目的寄存器 */
						aluop_o		<= `EXE_OR_OP;		/* 运算的子类型是逻辑 "或" */
						alusel_o	<= `EXE_RES_LOGIC;	/* 运算类型是逻辑运算 */
						reg1_read_o	<= `ReadEnable;		/* 需要通过Regfile的读端口1来读取寄存器 */
						reg2_read_o	<= `ReadDisable;	/* 不需要通过Regfile的读端口2读取寄存器 */
						imm			<=	{`I_IMM_EXT,inst_i[`I_IMM]}; /* 扩展立即数 */
						wd_addr_o	<= inst_i[`I_RT_REG];	/* 指令执行要写入的目的寄存器地址 */
						inst_valid	<= `InstValid;		/* ori是有效指令 */
					end
				default:	begin
					end
			endcase	/* case opcode*/
		end /* if */
		
	end /* always */

/************************************************************************************************/
/*										第二段：确定进行运算的源操作数	1								*/
/************************************************************************************************/
	always @ (*) begin
		if(rst == `RstEnable) begin
			reg1_o <= `ZeroWord;
		end else if(reg1_read_o == `ReadEnable) begin
			reg1_o <= reg1_data_i;    //Regfile读端口1的输出值
		end else if(reg1_read_o == `ReadDisable) begin
			reg1_o <= imm;   //立即数
		end else begin
			reg1_o <= `ZeroWord;
		end
	end


/************************************************************************************************/
/*										第三段：确定进行运算的源操作数	2								*/
/************************************************************************************************/
	always @ (*) begin
		if(rst == `RstEnable) begin
			reg2_o <= `ZeroWord;
		end else if(reg2_read_o == `ReadEnable) begin
			reg2_o <= reg2_data_i;    //Regfile读端口2的输出值
		end else if(reg2_read_o == `ReadDisable) begin
			reg2_o <= imm;   //立即数
		end else begin
			reg2_o <= `ZeroWord;
		end
	end
	

endmodule