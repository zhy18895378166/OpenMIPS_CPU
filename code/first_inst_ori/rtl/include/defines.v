`include "rtl/include/inst_encoding.v"

/****************************************************************************/
/*								common define								*/
/****************************************************************************/
`define ZeroWord 					32'h00000000
`define True_v 						1'b1
`define False_v 					1'b0

`define RstEnable					1'b1
`define RstDisable 					1'b0
`define WriteEnable 				1'b1
`define WriteDisable 				1'b0
`define ReadEnable 					1'b1
`define ReadDisable 				1'b0
`define InstValid 					1'b0
`define InstInvalid 				1'b1
`define Stop 						1'b1
`define NoStop 						1'b0
`define ChipEnable 					1'b1
`define ChipDisable 				1'b0
`define InterruptAssert 			1'b1
`define InterruptNotAssert 			1'b0
`define TrapAssert 					1'b1
`define TrapNotAssert 				1'b0
`define InDelaySlot 				1'b1
`define NotInDelaySlot 				1'b0
`define Branch 						1'b1
`define NotBranch 					1'b0





//指令存储器inst_rom
`define InstAddrBus 31:0
`define InstBus 31:0
`define InstMemNum 131071        //2^17 - 1 = 131071
`define InstMemNumLog2 17


//通用寄存器regfile
`define RegAddrBus 		4:0
`define RegBus 			31:0
`define RegWidth 32
`define DoubleRegWidth 64
`define DoubleRegBus 63:0
`define RegNum 32
`define RegNumLog2 	5
`define NOPRegAddr 	5'b00000

//通用寄存器别名
`define ZERO_REG	5'h0
