@echo off
set xv_path=D:\\software\\Vivado\\Vivado\\2015.2\\bin
call %xv_path%/xsim Single_Cycle_RISCV_tb_behav -key {Behavioral:sim_1:Functional:Single_Cycle_RISCV_tb} -tclbatch Single_Cycle_RISCV_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
