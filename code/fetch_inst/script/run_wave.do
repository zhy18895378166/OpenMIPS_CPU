#================================================================
# Create work library
#================================================================
# It will create a "work" folder in current folder
 
# 创建本地库
vlib work
 
# 将逻辑库名映射库路径
vmap work work
 

#================================================================
# Compile RTL
#================================================================
 
# 编译当前目录下的所有v文件
vlog    ./rtl/*.v

 
#================================================================
# Start the emulator（启动仿真器）
#================================================================
 
#方式一：
vsim -L xilinxcorelib -L simprim -L unimacro -L unisim -voptargs=+acc work.inst_fetch_tb

 
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
 
add wave  -noupdate -divider {TB_TOP}
add wave -noupdate -color green     -format Logic -radix hexadecimal -group {TOP} inst_fetch0/*         

#================================================================
# 设置wave属性
#================================================================
configure wave -signalnamewidth 1
 
#================================================================
# run
#================================================================
.main clear
 
run 10us