`include "rtl/include/defines.v"

module ex(
	input wire				rst,
	
	//译码阶段送到执行阶段的信息
	input wire[`AluOpBus]			aluop_i,
	input wire[`AluSelBus]			alusel_i,
	input wire[`RegBus]			reg1_i,
	input wire[`RegBus]			reg2_i,
	input wire[`RegAddrBus]			wd_addr_i,
	input wire				wreg_i,
	
	//执行的结果
	output reg[`RegAddrBus]			wd_addr_o,
	output reg				wreg_o,
	output reg[`RegBus]			wdata_o
);
	//保存逻辑运算的结果
	reg[`RegBus] logicout;
	
/************************************************************************************************/
/*				 第一段：依据aluop_i指示的运算类型进行运算，此处只有逻辑“或”运算		             */
/************************************************************************************************/
    always @ (*) begin
        if(rst == `RstEnable) begin
            logicout    <= `ZeroWord;
        end else begin
            case (aluop_i)
		        `EXE_OR_OP: begin
			        logicout <= reg1_i | reg2_i;
		        end
	    	    default: begin
		    	    logicout <= `ZeroWord;
	    	    end
            endcase
        end /* if */
    end /* always */
    
/************************************************************************************************/
/*				 第二段：依据alusel_i指示的运算类型，选择一个运算结果作为最终结果             		 */
/*                      此处只有逻辑“或”运算		                                                 */
/************************************************************************************************/
    always @ (*) begin
        wd_addr_o   <= wd_addr_i;
        wreg_o      <= wreg_i;
		case (alusel_i)
			`EXE_RES_LOGIC: begin
				wdata_o	<= logicout;   //wdata_o中存放运算结果
			end
	    	default: begin
		   		wdata_o <= `ZeroWord;
	    	end
		endcase
    end
	
	
endmodule
