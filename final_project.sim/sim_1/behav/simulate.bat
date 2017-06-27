@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xsim BCD32ToBinary110_behav -key {Behavioral:sim_1:Functional:BCD32ToBinary110} -tclbatch BCD32ToBinary110.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
