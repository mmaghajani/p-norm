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

component Binary110ToBCD32 is
   Port ( 
      number   : in  std_logic_vector (109 downto 0);
      bcd : out std_logic_vector( 127 downto 0 )
   );
end component;

component BCD32ToBinary110 is 
Port (
bcd : in std_logic_vector( 127 downto 0);
binary : out std_logic_vector( 109 downto 0 )
);
end component;

signal base_BIN : std_logic_vector(109 downto 0);
signal power_BIN : std_logic_vector(6 downto 0);
signal tmp_28 : std_logic_vector(27 downto 0);

--signal tmp_18_2 : std_logic_vector (17 downto 0);
--signal tmp_19_3 : std_logic_vector (18 downto 0);
--signal tmp_20_4 : std_logic_vector (19 downto 0);
--signal tmp_21_5 : std_logic_vector (20 downto 0);
--signal tmp_22_6 : std_logic_vector (21 downto 0);
--signal tmp_22_7 : std_logic_vector (21 downto 0);

signal power_BCD_32 : std_logic_vector(31 downto 0);
signal result_BIN : std_logic_vector (109 downto 0);

--type RESULTS is array (1 to 8) of std_logic_vector (15 downto 0);
--signal result_BINI : RESULTS;

begin

power_BCD_32 <= "000000000000000000000000" & power_BCD;

bcdTObin1: BCD32ToBinary110 port map (base_BCD, base_BIN);
bcdTObin2: BCDtoBin port map (power_BCD_32, tmp_28);
power_BIN <= tmp_28(6 downto 0);

comp1: Binary110ToBCD32 port map (result_BIN, result_BCD);

result_BCD(127 downto 121) <= (others => '0');

process (base_BIN, power_BIN)
variable len : integer;
variable r : std_logic_vector (109 downto 0);
variable tmp : std_logic_vector (219 downto 0);
variable tmp139 : std_logic_vector (137 downto 0);
variable overflow : boolean;
begin
        len := power_BIN'high;
        overflow := false;
        r := ( 0 => '1', others => '0');
        
        for i in len downto 0 loop
            tmp := r * r;
            r := tmp (109 downto 0);
            if power_BIN(i) = '1' then
                tmp := r * base_BIN;
                r := tmp(109 downto 0);
            end if;
        end loop;
        
        for i in 219 downto 110 loop
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