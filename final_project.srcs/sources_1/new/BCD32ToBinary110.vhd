----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2017 03:48:55 AM
-- Design Name: 
-- Module Name: BCDtoBin - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD32ToBinary110 is 
Port (
bcd : in std_logic_vector( 127 downto 0);
binary : out std_logic_vector( 109 downto 0 )
);
end BCD32ToBinary110;

ARCHITECTURE Behavioral of BCD32ToBinary110 is
function bcd_2_bin (bcd_in_0: STD_LOGIC_VECTOR (3 downto 0);bcd_in_10:STD_LOGIC_VECTOR (3 downto 0);
    bcd_in_100: STD_LOGIC_VECTOR (3 downto 0);bcd_in_1000 : STD_LOGIC_VECTOR (3 downto 0);
    bcd_in_10000 : STD_LOGIC_VECTOR (3 downto 0);bcd_in_100000 : STD_LOGIC_VECTOR (3 downto 0);
    bcd_in_1000000 : STD_LOGIC_VECTOR (3 downto 0);bcd_in_10000000 : STD_LOGIC_VECTOR (3 downto 0);
    bcd1_in_0: STD_LOGIC_VECTOR (3 downto 0);bcd1_in_10:STD_LOGIC_VECTOR (3 downto 0);
        bcd1_in_100: STD_LOGIC_VECTOR (3 downto 0);bcd1_in_1000 : STD_LOGIC_VECTOR (3 downto 0);
        bcd1_in_10000 : STD_LOGIC_VECTOR (3 downto 0);bcd1_in_100000 : STD_LOGIC_VECTOR (3 downto 0);
        bcd1_in_1000000 : STD_LOGIC_VECTOR (3 downto 0);bcd1_in_10000000 : STD_LOGIC_VECTOR (3 downto 0);
        bcd2_in_0: STD_LOGIC_VECTOR (3 downto 0);bcd2_in_10:STD_LOGIC_VECTOR (3 downto 0);
            bcd2_in_100: STD_LOGIC_VECTOR (3 downto 0);bcd2_in_1000 : STD_LOGIC_VECTOR (3 downto 0);
            bcd2_in_10000 : STD_LOGIC_VECTOR (3 downto 0);bcd2_in_100000 : STD_LOGIC_VECTOR (3 downto 0);
            bcd2_in_1000000 : STD_LOGIC_VECTOR (3 downto 0);bcd2_in_10000000 : STD_LOGIC_VECTOR (3 downto 0);
            bcd3_in_0: STD_LOGIC_VECTOR (3 downto 0);bcd3_in_10:STD_LOGIC_VECTOR (3 downto 0);
                bcd3_in_100: STD_LOGIC_VECTOR (3 downto 0);bcd3_in_1000 : STD_LOGIC_VECTOR (3 downto 0);
                bcd3_in_10000 : STD_LOGIC_VECTOR (3 downto 0);bcd3_in_100000 : STD_LOGIC_VECTOR (3 downto 0);
                bcd3_in_1000000 : STD_LOGIC_VECTOR (3 downto 0);bcd3_in_10000000 : STD_LOGIC_VECTOR (3 downto 0)
    )
  return STD_LOGIC_VECTOR  is 
  variable output : STD_LOGIC_VECTOR (108 downto 0) := (others => '0');

begin

output := (bcd_in_0 * "01")  --multiply by 1
                + (bcd_in_10 * "1010") --multiply by 10
                + (bcd_in_100 * "1100100") --multiply by 100
                + (bcd_in_1000 * "1111101000") --multiply by 1000
                + (bcd_in_10000 * "0010011100010000")
                + (bcd_in_100000 * "11000011010100000")
                + (bcd_in_1000000 * "11110100001001000000")
                + (bcd_in_10000000 * "100110001001011010000000")
                                + (bcd1_in_0 * "1010" * "100110001001011010000000") --multiply by 10
                                + (bcd1_in_10 * "1100100" * "100110001001011010000000") --multiply by 100
                                + (bcd1_in_100 * "1111101000" * "100110001001011010000000") --multiply by 1000
                                + (bcd1_in_1000 * "0010011100010000" * "100110001001011010000000")
                                + (bcd1_in_10000 * "11000011010100000" * "100110001001011010000000")
                                + (bcd1_in_100000 * "11110100001001000000" * "100110001001011010000000")
                                + (bcd1_in_1000000 * "100110001001011010000000" * "100110001001011010000000")
                                + (bcd1_in_10000000 * "101111101011110000100000000" * "100110001001011010000000")
                                                + (bcd2_in_0 * "1010" * "101111101011110000100000000" * "100110001001011010000000") --multiply by 10
                                                + (bcd2_in_10 * "1100100" * "101111101011110000100000000" * "100110001001011010000000") --multiply by 100
                                                + (bcd2_in_100 * "1111101000" * "101111101011110000100000000" * "100110001001011010000000") --multiply by 1000
                                                + (bcd2_in_1000 * "0010011100010000" * "101111101011110000100000000" * "100110001001011010000000")
                                                + (bcd2_in_10000 * "11000011010100000" * "101111101011110000100000000" * "100110001001011010000000")
                                                + (bcd2_in_100000 * "11110100001001000000" * "101111101011110000100000000" * "100110001001011010000000")
                                                + (bcd2_in_1000000 * "100110001001011010000000" * "101111101011110000100000000" * "100110001001011010000000")
                                                + (bcd2_in_10000000 * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000")              
                                                                + (bcd3_in_0 * "1010" * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000") --multiply by 10
                                                                + (bcd3_in_10 * "1100100" * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000") --multiply by 100
                                                                + (bcd3_in_100 * "1111101000" * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000") --multiply by 1000
                                                                + (bcd3_in_1000 * "0010011100010000" * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000")
                                                                + (bcd3_in_10000 * "11000011010100000" * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000")
                                                                + (bcd3_in_100000 * "11110100001001000000" * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000")
                                                                + (bcd3_in_1000000 * "100110001001011010000000" * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000")
                                                                + (bcd3_in_10000000 * "101111101011110000100000000" * "101111101011110000100000000" * "101111101011110000100000000" * "100110001001011010000000");
return output;
end  bcd_2_bin ;
begin
binary <= "0"&bcd_2_bin( bcd ( 3 downto 0 ) , bcd( 7 downto 4 ) , bcd( 11 downto 8 ) ,
                     bcd( 15 downto 12 ) , bcd( 19 downto 16) , bcd( 23 downto 20) ,
                     bcd( 27 downto 24 ) , bcd( 31 downto 28) , bcd( 35 downto 32) ,
                     bcd( 39 downto 36 ) , bcd( 43 downto 40) , bcd( 47 downto 44) ,
                     bcd( 51 downto 48 ) , bcd( 55 downto 52) , bcd( 59 downto 56) ,
                     bcd( 63 downto 60 ) , bcd( 67 downto 64) , bcd( 71 downto 68) ,
                     bcd( 75 downto 72 ) , bcd( 79 downto 76) , bcd( 83 downto 80) ,
                     bcd( 87 downto 84 ) , bcd( 91 downto 88) , bcd( 95 downto 92) ,
                     bcd( 99 downto 96 ) , bcd( 103 downto 100) , bcd( 107 downto 104) ,
                     bcd( 111 downto 108 ) , bcd( 115 downto 112) , bcd( 119 downto 116) ,
                     bcd( 123 downto 120 ) , bcd( 127 downto 124));
end BEhavioral;