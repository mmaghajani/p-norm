----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/26/2017 03:10:25 PM
-- Design Name: 
-- Module Name: BCD_32x32_multiplier - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_32x32_multiplier is Port (
a : in std_logic_vector( 127 downto 0 );
b : in std_logic_vector( 127 downto 0 );
product : out std_logic_vector ( 127 downto 0)
);
end BCD_32x32_multiplier;

architecture Behavioral of BCD_32x32_multiplier is

begin


end Behavioral;
