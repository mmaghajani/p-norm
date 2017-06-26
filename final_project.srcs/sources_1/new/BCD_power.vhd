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

signal tmp_24_2 : std_logic_vector (23 downto 0);
signal tmp_28_3 : std_logic_vector (27 downto 0);
signal tmp_32_4 : std_logic_vector (31 downto 0);
signal tmp_36_5 : std_logic_vector (35 downto 0);
signal tmp_40_6 : std_logic_vector (39 downto 0);
signal tmp_43_7 : std_logic_vector (42 downto 0);

signal power_BCD_32 : std_logic_vector(31 downto 0);
signal result_BIN : std_logic_vector (110 downto 0);

type RESULTS is array (1 to 8) of std_logic_vector (15 downto 0);
signal result_BINI : RESULTS;

begin

power_BCD_32 <= "0000000000000000000000000000" & power_BCD;

bcdTObin1: BCDtoBin port map (base_BCD, base_BIN);
bcdTObin2: BCDtoBin port map (power_BCD_32, tmp_28);
power_BIN <= tmp_28(3 downto 0);

result_BINI(1) <= result_BIN(15 downto 0);
result_BINI(2) <= tmp_24_2(15 downto 0);
result_BINI(3) <= tmp_28_3(15 downto 0);
result_BINI(4) <= tmp_32_4(15 downto 0);
result_BINI(5) <= tmp_36_5(15 downto 0);
result_BINI(6) <= tmp_40_6(15 downto 0);
result_BINI(7) <= tmp_43_7(15 downto 0);
result_BINI(8) <= "0000000000" & tmp_43_7 (21 downto 16);

tmp_24_2 <= result_BIN(31 downto 16) * x"10";
tmp_28_3 <= result_BIN(47 downto 32) * x"100" + ("00000000000000000" & tmp_24_2(17 downto 16));
tmp_32_4 <= result_BIN(63 downto 48) * x"1000" + ("00000000000000000" & tmp_28_3(18 downto 16));
tmp_36_5 <= result_BIN(79 downto 64) * x"10000" + ("00000000000000000" & tmp_32_4(19 downto 16));
tmp_40_6 <= result_BIN(95 downto 80) * x"100000" + ("00000000000000000" & tmp_36_5(20 downto 16));
tmp_43_7 <= result_BIN(110 downto 96) * x"1000000" + ("0000000000000000" & tmp_40_6(21 downto 16));

F: for I in 1 to 8 generate
    binTObcdI: BinToBCD port map (result_BINI(I), result_BCD(15*I downto 15*I-3), result_BCD(15*I-4 downto 15*I-7), result_BCD(15*I-8 downto 15*I-11), result_BCD(15*I-12 downto 15*I-15));
end generate F;

result_BCD(127 downto 121) <= (others => '0');

process (base_BIN, power_BIN)
variable len : integer;
variable r : std_logic_vector (110 downto 0);
variable tmp : std_logic_vector (221 downto 0);
variable tmp139 : std_logic_vector (138 downto 0);
variable overflow : boolean;
begin
        len := power_BIN'high;
        overflow := false;
        r := ( 0 => '1', others => '0');
        
        for i in len downto 0 loop
            tmp := r * r;
            r := tmp (110 downto 0);
            if power_BIN(i) = '1' then
                tmp139 := r * base_BIN;
                r := tmp139(110 downto 0);
            end if;
        end loop;
        
        for i in 221 downto 111 loop
            if tmp(i) = '1' then
                overflow := true;
            end if;
        end loop;
        
        if overflow then
            AVF <= '1';
        else
            AVF <= '0';
        end if;
        result_BIN <= r;
end process;

end Behavioral;
