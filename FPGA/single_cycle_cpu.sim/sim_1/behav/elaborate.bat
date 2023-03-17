@echo off
set xv_path=D:\\software\\Vivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto bddee17606014c1a88cde4c17e6a0352 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Single_Cycle_RISCV_tb_behav xil_defaultlib.Single_Cycle_RISCV_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
