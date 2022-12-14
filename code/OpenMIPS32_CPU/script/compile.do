#================================================================
# Create work library
#================================================================
# It will create a "work" folder in current folder

#退出当前仿真
quit -sim

#清除输出窗口
.main clear 

# 创建本地库
vlib work
 
# 将逻辑库名映射库路径
vmap work work

#================================================================
# Compile RTL
#================================================================
 
# 编译当前目录下的所有v文件
vlog    ./rtl/*.v
vlog    ./rtl/include/*.v
