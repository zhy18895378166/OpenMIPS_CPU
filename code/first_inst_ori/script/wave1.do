onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {PC Module
} -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -expand -group {PC Module
} -label rst /openmips_min_sopc_tb/openmips_min_sopc0/rst
add wave -noupdate -expand -group {PC Module
} -label rom_ce_o /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/rom_ce_o
add wave -noupdate -height 18 -group {IF/ID Module
} -color Blue -label if_id0/id_pc -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_pc
add wave -noupdate -height 18 -group {IF/ID Module
} -color Blue -label if_id0/if_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_inst
add wave -noupdate -expand -group {ID Module
} -color {Medium Violet Red} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/inst_i
add wave -noupdate -expand -group {ID Module
} -color {Medium Violet Red} -format Literal -label id0/wreg_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/wreg_o
add wave -noupdate -expand -group {ID Module
} -color {Medium Violet Red} -label id0/wd_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/wd_addr_o
add wave -noupdate -expand -group {ID Module
} -color {Medium Violet Red} -label id0/reg1_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/reg1_o
add wave -noupdate -expand -group {ID Module
} -color {Medium Violet Red} -label id0/reg2_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/reg2_o
add wave -noupdate -expand -group {ID Module
} -color {Medium Violet Red} -label id0/alusel_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/alusel_o
add wave -noupdate -expand -group {ID Module
} -color {Medium Violet Red} -label id0/aluop_o -radix binary /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/aluop_o
add wave -noupdate -expand -group {EX Module
} -color Cyan -format Literal -label ex0/wreg_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wreg_o
add wave -noupdate -expand -group {EX Module
} -color Cyan -label ex0/wd_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wd_addr_o
add wave -noupdate -expand -group {EX Module
} -color Cyan -label ex0/wdata_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o
add wave -noupdate -expand -group {MEM Module
} -color Yellow -format Literal -label mem0/wreg_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wreg_o
add wave -noupdate -expand -group {MEM Module
} -color Yellow -label mem0/wd_addr_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wd_addr_o
add wave -noupdate -expand -group {MEM Module
} -color Yellow -label mem0/wdata_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wdata_o
add wave -noupdate -expand -group {MEM/WB Module
} -color Red -format Literal -label mem_wb0/wb_wreg -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wreg
add wave -noupdate -expand -group {MEM/WB Module
} -color Red -label {mem_wb0/wb_wd_addr} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wd_addr
add wave -noupdate -expand -group {MEM/WB Module
} -color Red -label {mem_wb0/wdata} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wdata
add wave -noupdate -expand -group {Regfile Mosule} -color {Dark Slate Gray} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile0/regs[1]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {251694 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 183
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {221689 ps} {368135 ps}
