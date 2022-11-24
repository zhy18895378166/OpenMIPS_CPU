::标题
title FPGA  Simulation
echo.

::first: close modelsim software
tasklist | findstr /i vish.exe && taskkill /im vish.exe /f


::start modelsim and simulate
vsim -do ./script/run_wave.do

rmdir /S /Q work
del vsim.wlf
del transcript.
