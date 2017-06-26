@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xsim BCD_32x8_multiplier_behav -key {Behavioral:sim_1:Functional:BCD_32x8_multiplier} -tclbatch BCD_32x8_multiplier.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
