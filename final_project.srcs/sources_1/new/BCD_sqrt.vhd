----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/12/2017 11:46:20 AM
-- Design Name: 
-- Module Name: BCD_sqrt - Behavioral
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

entity BCD_sqrt is Port (
number_bcd : in std_logic_vector(127 downto 0 );
sqrt_number_bcd : in std_logic_vector(7 downto 0);
sqrt : out std_logic_vector(127 downto 0) 
);
end BCD_sqrt;

architecture Behavioral of BCD_sqrt is

begin

process(number_bcd,sqrt_number_bcd)
begin

end process;

end Behavioral;
