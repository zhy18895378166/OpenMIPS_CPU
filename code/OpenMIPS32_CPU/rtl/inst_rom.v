`include "rtl/include/defines.v"

module inst_rom(
	input wire                    	ce,
	input wire[`InstAddrBus]		addr,
	
	output reg[`InstBus]			inst
);

/************************************************************************************************/
/*										��һ�Σ����岢��ʼ��һ��ROM�洢��						*/
/************************************************************************************************/

	reg[`InstBus]  inst_mem[0:`InstMemNum-1];
	
	initial $readmemh ( "./rom_data/inst_rom.data", inst_mem );
	
/************************************************************************************************/
/*										�ڶ��Σ�ȡָ��											*/
/************************************************************************************************/
	always @ (*) begin
		if (ce == `ChipDisable) begin
			inst <= `ZeroWord;
	  end else begin
			inst <= inst_mem[addr[`InstMemNumLog2+1:2]];  //addr[`InstMemNumLog2+1:2] = addr/4
		end
	end

endmodule