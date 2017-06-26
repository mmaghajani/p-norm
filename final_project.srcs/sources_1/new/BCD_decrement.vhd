----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/15/2017 03:07:09 PM
-- Design Name: 
-- Module Name: BCD_decrement - Behavioral
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

entity BCD_decrement is Port (
a : in std_logic_vector( 7 downto 0 );
b : out std_logic_vector( 7 downto 0 )
);
end BCD_decrement;

architecture Behavioral of BCD_decrement is

begin

with a select
    b <= X"00" when X"01",
         X"01" when X"02",
         X"02" when X"03",
         X"03" when X"04",
         X"04" when X"05",
         X"05" when X"06",
         X"06" when X"07",
         X"07" when X"08",
         X"08" when X"09",
         X"09" when X"10",
         X"10" when X"11",
         X"11" when X"12",
         X"12" when X"13",
         X"13" when X"14",
         X"14" when X"15",
         X"15" when X"16",
         X"16" when X"17",
         X"17" when X"18",
         X"18" when X"19",
         X"19" when X"20",
         X"20" when X"21",
         X"21" when X"22",
         X"22" when X"23",
         X"23" when X"24",
         X"24" when X"25",
         X"25" when X"26",
         X"26" when X"27",
         X"27" when X"28",
         X"28" when X"29",
         X"29" when X"30",
         X"30" when X"31",
         X"31" when X"32",
         X"32" when X"33",
         X"33" when X"34",
         X"34" when X"35",
         X"35" when X"36",
         X"36" when X"37",
         X"37" when X"38",
         X"38" when X"39",
         X"39" when X"40",
         X"40" when X"41",
         X"41" when X"42",
         X"42" when X"43",
         X"43" when X"44",
         X"44" when X"45",
         X"45" when X"46",
         X"46" when X"47",
         X"47" when X"48",
         X"48" when X"49",
         X"49" when X"50",
         X"50" when X"51",
         X"51" when X"52",
         X"52" when X"53",
         X"53" when X"54",
         X"54" when X"55",
         X"55" when X"56",
         X"56" when X"57",
         X"57" when X"58",
         X"58" when X"59",
         X"59" when X"60",
         X"60" when X"61",
         X"61" when X"62",
         X"62" when X"63",
         X"63" when X"64",
         X"64" when X"65",
         X"65" when X"66",
         X"66" when X"67",
         X"67" when X"68",
         X"68" when X"69",
         X"69" when X"70",
         X"70" when X"71",
         X"71" when X"72",
         X"72" when X"73",
         X"73" when X"74",
         X"74" when X"75",
         X"75" when X"76",
         X"76" when X"77",
         X"77" when X"78",
         X"78" when X"79",
         X"79" when X"80",
         X"80" when X"81",
         X"81" when X"82",
         X"82" when X"83",
         X"83" when X"84",
         X"84" when X"85",
         X"85" when X"86",
         X"86" when X"87",
         X"87" when X"88",
         X"88" when X"89",
         X"89" when X"90",
         X"90" when X"91",
         X"91" when X"92",
         X"92" when X"93",
         X"93" when X"94",
         X"94" when X"95",
         X"95" when X"96",
         X"96" when X"97",
         X"97" when X"98",
         X"98" when X"99",
         X"00" when others;
end Behavioral;
