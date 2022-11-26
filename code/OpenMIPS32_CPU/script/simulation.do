#================================================================
# 定义变量
#================================================================
set  top_file_name				openmips_min_sopc
set  tb_name   					${top_file_name}_tb
set  instandtiate_top_name		${top_file_name}0

#================================================================
# compile
#================================================================
do ./script/compile.do
 
#================================================================
# Start the emulator（启动仿真器）
#================================================================
 
#方式一：
vsim -L xilinxcorelib -L simprim -L unimacro -L unisim -voptargs=+acc work.$tb_name

 
#================================================================
# Set the window types
#================================================================
 
view wave
view structure
view signals
 
 
#================================================================
# Add watch wave 
# color : green   cyan      yellow       pink   violet   orchid  gray40 
# radix : binary  unsigned  hexadecimal  
# 建议：常量/寄存器的值波形使用gray40；数据总线cyan；FSM pink；控制信号yellow/pink；其他信号green
#================================================================
 
#add wave  -noupdate -divider {TB_TOP}
#add wave -noupdate -color green     -format Logic -radix hexadecimal -group {TOP} ${instandtiate_top_name}/*         
do ./script/wave1.do


#================================================================
# 设置wave属性
#================================================================
configure wave -signalnamewidth 1
 
#================================================================
# run
#================================================================
.main clear
 
run 10us