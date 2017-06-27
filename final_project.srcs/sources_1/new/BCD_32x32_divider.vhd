----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/26/2017 03:23:34 PM
-- Design Name: 
-- Module Name: BCD_32x32_divider - Behavioral
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

entity BCD_32x32_divider is Port (
 clk,rst : in std_logic ;
 do : in std_logic;
 dividend : in std_logic_vector( 127 downto 0 ) ;
 divisor : in std_logic_vector( 127 downto 0 ) ;
 quotient,reminder : out std_logic_vector( 127 downto 0 );
 ready : out std_logic
 );
end BCD_32x32_divider;

architecture Behavioral of BCD_32x32_divider is
component BinToBCD is
   Port ( 
      number   : in  std_logic_vector (15 downto 0);
      thousend : out std_logic_vector (3 downto 0);
      hundreds : out std_logic_vector (3 downto 0);
      tens     : out std_logic_vector (3 downto 0);
      ones     : out std_logic_vector (3 downto 0)
   );
end component;

component BCDtoBin is 
Port (
bcd : in std_logic_vector( 31 downto 0);
binary : out std_logic_vector( 27 downto 0 )
);
end component;

component new_divider is 
generic( N : integer := 4 );
Port (
 clk,rst,do : in std_logic;
 dividend : in std_logic_vector( 2*N-1 downto 0 ) ;
 divisor : in std_logic_vector( N-1 downto 0 ) ;
 quotient,reminder : out std_logic_vector( N-1 downto 0 );
 DVF,ready : out std_logic
 );
end component;

signal binaryDividend : std_logic_vector( 27 downto 0 );
signal binaryDivisor : std_logic_vector( 27 downto 0 );
signal binaryQuotient , binaryReminder : std_logic_vector( 13 downto 0);
begin

bcdTObin1: BCDtoBin port map( dividend ,  binaryDividend );
bcdTObin2: BCDtoBin port map( "0000000000000000"&divisor , binaryDivisor );
div: new_divider generic map(14) port map(clk ,rst, do , binaryDividend , binaryDivisor(13 downto 0) ,
                                         binaryQuotient , binaryReminder , DVF ,ready );
                                         
binTObcd1: BinToBCD port map( "00"&binaryQuotient , quotient( 15 downto 12) , quotient( 11 downto 8),
                                quotient( 7 downto 4 ) , quotient( 3 downto 0 ) );
binTObcd2: BinToBCD port map( "00"&binaryReminder , reminder( 15 downto 12) , reminder( 11 downto 8),
                                reminder( 7 downto 4 ) , reminder( 3 downto 0 ) );

end Behavioral;
