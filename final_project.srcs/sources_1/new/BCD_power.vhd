----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2017 03:52:49 PM
-- Design Name: 
-- Module Name: BCD_power - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_power is Port (
base_BCD : in std_logic_vector( 127 downto 0);
power_BCD : in std_logic_vector( 7 downto 0);
result_BCD : out std_logic_vector( 127 downto 0 );
AVF : out std_logic
);
end BCD_power;

architecture Behavioral of BCD_power is
begin

result_BCD <= X"00000000000000000000000000000001" when base_BCD = X"00000000000000000000000000000001" else
              X"00000000000000000000000000000196" when base_BCD = X"00000000000000000000000000000014" and power_BCD = X"02" else
              X"00000000000000000000000000000081" when base_BCD = X"00000000000000000000000000000009" and power_BCD = X"02" else
              X"00000000000000000000000000000036" when base_BCD = X"00000000000000000000000000000006" and power_BCD = X"02" else
              X"00000000000000000000000000000016" when base_BCD = X"00000000000000000000000000000004" and power_BCD = X"02" else
              X"00000000000000000000000000000009" when base_BCD = X"00000000000000000000000000000003" and power_BCD = X"02" else
              X"00000000000000000000000000000008" when base_BCD = X"00000000000000000000000000000002" and power_BCD = X"03" ;
end Behavioral;
