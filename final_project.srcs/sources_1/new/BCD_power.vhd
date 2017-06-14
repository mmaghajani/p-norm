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
clk : in std_logic;
base_BCD : in std_logic_vector( 31 downto 0);
power_BCD : in std_logic_vector( 3 downto 0);
result_BCD : out std_logic_vector( 127 downto 0 );
AVF : out std_logic
);
end BCD_power;

architecture Behavioral of BCD_power is

component BCDtoBin is 
Port (
bcd : in std_logic_vector( 31 downto 0);
binary : out std_logic_vector( 27 downto 0 )
);
end component;

signal base_BIN : std_logic_vector(27 downto 0);
signal power_BIN : std_logic_vector(3 downto 0);
signal tmp_28 : std_logic_vector(27 downto 0);
signal working : std_logic := '0';
signal result_BIN : std_logic_vector (110 downto 0);

begin

bcdTObin1: BCDtoBin port map (base_BCD, base_BIN);
bcdTObin2: BCDtoBin port map (power_BCD, tmp_28);
power_BIN <= tmp_28(3 downto 0);

process (clk)
begin
    if rising_edge(clk) then 
       if working = '0' then
        if base_BIN = "0000000000000000000000000000" then
            result_BIN <= (others=>'0');
        elsif base_BIN = "0000000000000000000000000001" then
            result_BIN <= (0 => '1', others=>'0');
        else
            -- TODO
        end if;
       end if;
    end if;
end process;

end Behavioral;
