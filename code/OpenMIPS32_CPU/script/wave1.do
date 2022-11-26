onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {PC Module
} -label clk /openmips_min_sopc_tb/openmips_min_sopc0/clk
add wave -noupdate -group {PC Module
} -label rst /openmips_min_sopc_tb/openmips_min_sopc0/rst
add wave -noupdate -group {PC Module
} -label rom_ce_o /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/rom_ce_o
add wave -noupdate -height 18 -expand -group {IF/ID Module
} -color Blue -label if_id0/id_pc -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/id_pc
add wave -noupdate -height 18 -expand -group {IF/ID Module
} -color Blue -label if_id0/if_inst -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/if_id0/if_inst
add wave -noupdate -expand -group {ID Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/inst_i
add wave -noupdate -expand -group {ID Module
} -format Literal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/reg1_read_o
add wave -noupdate -expand -group {ID Module
} -format Literal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/ex_wreg_i
add wave -noupdate -expand -group {ID Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/ex_wd_addr_i
add wave -noupdate -expand -group {ID Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/ex_wdata_i
add wave -noupdate -expand -group {ID Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/reg1_data_i
add wave -noupdate -expand -group {ID Module
} -format Literal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/mem_wreg_i
add wave -noupdate -expand -group {ID Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/mem_wd_addr_i
add wave -noupdate -expand -group {ID Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/mem_wdata_i
add wave -noupdate -expand -group {ID Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id0/wd_addr_o
add wave -noupdate -group {ID/EX Module} -color {Spring Green} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg1
add wave -noupdate -group {ID/EX Module} -color {Spring Green} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/id_reg2
add wave -noupdate -group {ID/EX Module} -color {Spring Green} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_reg1
add wave -noupdate -group {ID/EX Module} -color {Spring Green} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/id_ex0/ex_reg2
add wave -noupdate -expand -group {EX Module
} -color Cyan -format Literal -label ex0/wreg_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wreg_o
add wave -noupdate -expand -group {EX Module
} -color Cyan -label ex0/wd_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wd_addr_o
add wave -noupdate -expand -group {EX Module
} -color Cyan -label ex0/wdata_o -radix hexadecimal -childformat {{{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[31]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[30]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[29]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[28]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[27]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[26]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[25]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[24]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[23]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[22]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[21]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[20]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[19]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[18]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[17]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[16]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[15]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[14]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[13]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[12]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[11]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[10]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[9]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[8]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[7]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[6]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[5]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[4]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[3]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[2]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[1]} -radix hexadecimal} {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[0]} -radix hexadecimal}} -subitemconfig {{/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[31]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[30]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[29]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[28]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[27]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[26]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[25]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[24]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[23]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[22]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[21]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[20]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[19]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[18]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[17]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[16]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[15]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[14]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[13]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[12]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[11]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[10]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[9]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[8]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[7]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[6]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[5]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[4]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[3]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[2]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[1]} {-color Cyan -height 15 -radix hexadecimal} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o[0]} {-color Cyan -height 15 -radix hexadecimal}} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/wdata_o
add wave -noupdate -expand -group {EX Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/reg1_i
add wave -noupdate -expand -group {EX Module
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/ex0/reg2_i
add wave -noupdate -group {MEM Module
} -color Yellow -format Literal -label mem0/wreg_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wreg_o
add wave -noupdate -group {MEM Module
} -color Yellow -label mem0/wd_addr_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wd_addr_o
add wave -noupdate -group {MEM Module
} -color Yellow -label mem0/wdata_o -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem0/wdata_o
add wave -noupdate -group {MEM/WB Module
} -color Red -format Literal -label mem_wb0/wb_wreg -radix hexadecimal /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wreg
add wave -noupdate -group {MEM/WB Module
} -color Red -label {mem_wb0/wb_wd_addr
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wd_addr
add wave -noupdate -group {MEM/WB Module
} -color Red -label {mem_wb0/wdata
} /openmips_min_sopc_tb/openmips_min_sopc0/openmips0/mem_wb0/wb_wdata
add wave -noupdate -expand -group {Regfile Mosule} -color {Dark Slate Gray} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile0/regs[1]}
add wave -noupdate -expand -group {Regfile Mosule} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile0/regs[3]}
add wave -noupdate -expand -group {Regfile Mosule} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile0/regs[2]}
add wave -noupdate -expand -group {Regfile Mosule} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile0/regs[4]}
add wave -noupdate -expand -group {Regfile Mosule} {/openmips_min_sopc_tb/openmips_min_sopc0/openmips0/regfile0/regs[5]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {175329 ps} 0}
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
WaveRestoreZoom {25590 ps} {940306 ps}
