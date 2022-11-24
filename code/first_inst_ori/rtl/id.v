`include "rtl/include/defines.v"

module id(
	input wire						rst,
	input wire[`InstAddrBus]		pc_i,
	input wire[`InstBus]			inst_i,
	
	input wire[`RegBus]				reg1_data_i,
	input wire[`RegBus]				reg2_data_i,
	
	//�����ִ�н׶ε���Ϣ
	output reg[`AluOpBus]			aluop_o,
	output reg[`AluSelBus]			alusel_o,
	output reg[`RegBus]				reg1_o,
	output reg[`RegBus]				reg2_o,
	output reg[`RegAddrBus]			wd_addr_o,
	output reg						wreg_o,    //ִ�н����Ҫд��Ŀ��Ĵ���ʹ���ź�
	
	//�����regfile����Ϣ
	output reg 						reg1_read_o,
	output reg 						reg2_read_o,
	output reg[`RegAddrBus]			reg1_addr_o,
	output reg[`RegAddrBus]			reg2_addr_o
);
	
	/* ȡָ��Ĺ����� */
	wire[5:0] opcode = inst_i[`OPCODE];
	//wire[4:0] op2 = inst_i[10:6];
	//wire[5:0] op3 = inst_i[5:0];
	//wire[4:0] op4 = inst_i[20:16];
	
	/* ����ָ��ִ����Ҫ�������� */
	reg[`RegBus]	imm;
	
	/* ָ����Ч�ı�־ */
	reg inst_valid;
	
/************************************************************************************************/
/*										��һ�Σ���ָ���������									*/
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
				`EXE_ORI:	begin		//����opcode��ֵ�ж��Ƿ���oriָ��
						wreg_o		<= `WriteEnable;	/* oriָ����Ҫ�����д��Ŀ�ļĴ��� */
						aluop_o		<= `EXE_OR_OP;		/* ��������������߼� "��" */
						alusel_o	<= `EXE_RES_LOGIC;	/* �����������߼����� */
						reg1_read_o	<= `ReadEnable;		/* ��Ҫͨ��Regfile�Ķ��˿�1����ȡ�Ĵ��� */
						reg2_read_o	<= `ReadDisable;	/* ����Ҫͨ��Regfile�Ķ��˿�2��ȡ�Ĵ��� */
						imm			<=	{`I_IMM_EXT,inst_i[`I_IMM]}; /* ��չ������ */
						wd_addr_o	<= inst_i[`I_RT_REG];	/* ָ��ִ��Ҫд���Ŀ�ļĴ�����ַ */
						inst_valid	<= `InstValid;		/* ori����Чָ�� */
					end
				default:	begin
					end
			endcase	/* case opcode*/
		end /* if */
		
	end /* always */

/************************************************************************************************/
/*										�ڶ��Σ�ȷ�����������Դ������	1								*/
/************************************************************************************************/
	always @ (*) begin
		if(rst == `RstEnable) begin
			reg1_o <= `ZeroWord;
		end else if(reg1_read_o == `ReadEnable) begin
			reg1_o <= reg1_data_i;    //Regfile���˿�1�����ֵ
		end else if(reg1_read_o == `ReadDisable) begin
			reg1_o <= imm;   //������
		end else begin
			reg1_o <= `ZeroWord;
		end
	end


/************************************************************************************************/
/*										�����Σ�ȷ�����������Դ������	2								*/
/************************************************************************************************/
	always @ (*) begin
		if(rst == `RstEnable) begin
			reg2_o <= `ZeroWord;
		end else if(reg2_read_o == `ReadEnable) begin
			reg2_o <= reg2_data_i;    //Regfile���˿�2�����ֵ
		end else if(reg2_read_o == `ReadDisable) begin
			reg2_o <= imm;   //������
		end else begin
			reg2_o <= `ZeroWord;
		end
	end
	

endmodule