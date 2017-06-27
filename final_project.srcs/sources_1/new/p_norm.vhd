----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/27/2017 07:41:07 PM
-- Design Name: 
-- Module Name: p_norm - Behavioral
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

entity p_norm is Port (
clk , rst : in std_logic;
a1,a2,a3,a4,a5 : in std_logic_vector( 31 downto 0);
p : in std_logic_vector( 7 downto 0 );
norm : out std_logic_vector( 127 downto 0)
);
end p_norm;

architecture Behavioral of p_norm is

begin


end Behavioral;
