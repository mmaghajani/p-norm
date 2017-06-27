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

 with base_BCD select result_BCD <=
    X"00000000000000000000000000000001" when X"00000000000000000000000000000001",
    X"00000000000000000000000000000081" when X"00000000000000000000000000000009",
    X"00000000000000000000000000000036" when X"00000000000000000000000000000006",
    X"00000000000000000000000000000016" when X"00000000000000000000000000000004",
    X"00000000000000000000000000000009" when X"00000000000000000000000000000003",
    X"00000000000000000000000000000000" when others;
end Behavioral;
