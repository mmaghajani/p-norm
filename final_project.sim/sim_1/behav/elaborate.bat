@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto f0b117320bb0443abd022e3057ed25a3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot BCD_sqrt_behav xil_defaultlib.BCD_sqrt -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
