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

component BinToBCD is
   Port ( 
      number   : in  std_logic_vector (15 downto 0);
      thousend : out std_logic_vector (3 downto 0);
      hundreds : out std_logic_vector (3 downto 0);
      tens     : out std_logic_vector (3 downto 0);
      ones     : out std_logic_vector (3 downto 0)
   );
end component;

signal base_BIN : std_logic_vector(27 downto 0);
signal power_BIN : std_logic_vector(3 downto 0);
signal tmp_28 : std_logic_vector(27 downto 0);

signal tmp_18_2 : std_logic_vector (17 downto 0);
signal tmp_19_3 : std_logic_vector (18 downto 0);
signal tmp_20_4 : std_logic_vector (19 downto 0);
signal tmp_21_5 : std_logic_vector (20 downto 0);
signal tmp_22_6 : std_logic_vector (21 downto 0);
signal tmp_22_7 : std_logic_vector (21 downto 0);

signal power_BCD_32 : std_logic_vector(31 downto 0);
signal working : std_logic := '0';
signal result_BIN : std_logic_vector (110 downto 0);

type RESULTS is array (1 to 8) of std_logic_vector (15 downto 0);
signal result_BINI : RESULTS;

begin

power_BCD_32 <= "0000000000000000000000000000" & power_BCD;

bcdTObin1: BCDtoBin port map (base_BCD, base_BIN);
bcdTObin2: BCDtoBin port map (power_BCD_32, tmp_28);
power_BIN <= tmp_28(3 downto 0);

result_BINI(1) <= result_BIN(15 downto 0);

tmp_18_2 <= result_BIN(31 downto 16) * "10";
tmp_19_3 <= result_BIN(47 downto 32) * "100";
tmp_20_4 <= result_BIN(63 downto 48) * "1000";
tmp_21_5 <= result_BIN(79 downto 64) * "10000";
tmp_22_6 <= result_BIN(95 downto 80) * "100000";
tmp_22_7 <= result_BIN(110 downto 96) * "1000000";

result_BINI(7) <= tmp_22_7(15 downto 0);
result_BINI(6) <= tmp_22_6(15 downto 0);
result_BINI(5) <= tmp_21_5(15 downto 0);
result_BINI(4) <= tmp_20_4(15 downto 0);
result_BINI(3) <= tmp_19_3(15 downto 0);
result_BINI(2) <= tmp_18_2(15 downto 0);

--result_BINI(8) <= result_BIN(127 downto 112) * "10000000";

F: for I in 1 to 8 generate
    binTObcdI: BinToBCD port map (result_BINI(I), result_BCD(15*I downto 15*I-3), result_BCD(15*I-4 downto 15*I-7), result_BCD(15*I-8 downto 15*I-11), result_BCD(15*I-12 downto 15*I-15));
end generate F;

--binTObcd1: BinToBCD port map (result_BIN1, result_BCD(15 downto 12), result_BCD(11 downto 8), result_BCD(7 downto 4), result_BCD(3 downto 0));
--binTObcd2: BinToBCD port map (result_BIN2, result_BCD(31 downto 28), result_BCD(27 downto 24), result_BCD(23 downto 20), result_BCD(19 downto 16));
--binTObcd3: BinToBCD port map (result_BIN3, result_BCD(47 downto 44), result_BCD(43 downto 40), result_BCD(39 downto 36), result_BCD(35 downto 32));
--binTObcd4: BinToBCD port map (result_BIN4, result_BCD(63 downto 60), result_BCD(59 downto 56), result_BCD(55 downto 52), result_BCD(51 downto 48));
--binTObcd5: BinToBCD port map (result_BIN5, result_BCD(79 downto 76), result_BCD(75 downto 72), result_BCD(7 downto 4), result_BCD(3 downto 0));
--binTObcd6: BinToBCD port map (result_BIN6, result_BCD(15 downto 12), result_BCD(11 downto 8), result_BCD(7 downto 4), result_BCD(3 downto 0));
--binTObcd7: BinToBCD port map (result_BIN7, result_BCD(15 downto 12), result_BCD(11 downto 8), result_BCD(7 downto 4), result_BCD(3 downto 0));
--binTObcd8: BinToBCD port map (result_BIN8, result_BCD(15 downto 12), result_BCD(11 downto 8), result_BCD(7 downto 4), result_BCD(3 downto 0));

process (base_BCD, power_BCD)
variable len : integer;--std_logic_vector (3 downto 0);
variable tmp : std_logic_vector (221 downto 0);
begin
        len := to_integer(unsigned(power_BIN));
        tmp := (0 => '1', others => '0');
        for i in 0 to len loop
            tmp := (tmp(110 downto 0) * result_BIN);
        end loop;
        result_BIN <= tmp(110 downto 0);
--       if working = '0' then
--        if base_BIN = "0000000000000000000000000000" then
--            result_BIN <= (others=>'0');
--        elsif base_BIN = "0000000000000000000000000001" then
--            result_BIN <= (0 => '1', others=>'0');
--        else
--            -- TODO
--        end if;
--       end if;
end process;

end Behavioral;
