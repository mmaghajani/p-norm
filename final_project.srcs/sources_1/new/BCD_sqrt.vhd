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
clk : in std_logic;
sqrt : out std_logic_vector(127 downto 0) 
);
end BCD_sqrt;

architecture Behavioral of BCD_sqrt is
component BCD_32x8_multiplier is Port (
a : in std_logic_vector( 127 downto 0 );
b : in std_logic_vector( 127 downto 0 );
product : out std_logic_vector ( 127 downto 0)
);
end component;

component BCD_32x32_divider is Port (
 dividend : in std_logic_vector( 127 downto 0 ) ;
 divisor : in std_logic_vector( 127 downto 0 ) ;
 quotient,reminder : out std_logic_vector( 127 downto 0 )
 );
end component;

component BCD_decrement is Port (
a : in std_logic_vector;
b : out std_logic_vector 
);
end component;

component  BCD_power is Port (
base_BCD : in std_logic_vector( 127 downto 0);
power_BCD : in std_logic_vector( 8 downto 0);
result_BCD : out std_logic_vector( 127 downto 0 );
AVF : out std_logic
);
end component;

component N_digit_BCD_adder is
generic (N : integer := 4);
Port (
input1 : in std_logic_vector( 4*N-1 downto 0 );
input2 : in std_logic_vector( 4*N-1 downto 0 );
carry_in : in std_logic ;
sum : out std_logic_vector( 4*N-1 downto 0 );
carry_out : out std_logic 
);
end component;
signal dec1,dec2 : std_logic_vector( 7 downto 0 );
signal mul1,mul2,mul3 : std_logic_vector( 127 downto 0 );
signal div1,div2,div3,div4,div01,div02,div03,div04 : std_logic_vector( 127 downto 0 );
signal pow1, pow3 : std_logic_vector( 127 downto 0 );
signal pow2 : std_logic_vector( 7 downto 0 );
signal add1,add2,add4 : std_logic_vector( 127 downto 0 );
signal add3,add5 : std_logic;
signal doDiv1 , doDiv2 , readyDiv1 , readyDiv2 : std_logic ;
signal rst1 , rst2 : std_logic;

type state_type is ( start , startDiv1 , computeDiv1 , startDiv2 , computeDiv2 , compare , finish ) ;
signal state : state_type := start ;
begin

dec: BCD_decrement port map(dec1 , dec2);
mul: BCD_32x8_multiplier port map(mul1 , mul2 , mul3);
div1: BCD_32x32_divider port map( clk,rst1 , doDiv1 , div1 , div2 , div3 , div4 , readyDiv1);
div2: BCD_32x32_divider port map( clk,rst2 , doDiv2 ,div01 , div02 , div03 , div04,readyDiv2 );
pow: BCD_power port map( pow1 , pow2 , pow3 );
add: N_digit_BCD_adder generic map(32) port map( add1 , add2 , add3 , add4 , add5 );

process( clk )
variable xk : std_logic_vector( 127 downto 0 ) ;
variable xk_1 : std_logic_vector( 127 downto 0);
begin
    if( clk'event and clk = '1' ) then
    case state is
        when start =>
            xk := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
            xk_1 := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
            dec1 <= sqrt_number_bcd ;
            mul1 <= xk;
            mul2 <= "000000000000000000000000"&dec2;
            pow1 <= xk;
            pow2 <= dec2;
            div1 <= number_bcd;
            div2 <= pow3;
            add1 <= mul3;
            add2 <= div3;
            div01 <= add4;
            div02 <= sqrt_number_bcd;
            doDiv1 <= '0';
            doDiv2 <= '0';
            state <= startDiv1 ;
        when startDiv1 =>
            doDiv1 <= '1';
            rst1 <= '1';
            state <= computeDiv1;
        when computeDiv1 =>
            rst1 <= '0';
            if( readyDiv1 = '1' )then
                state <= startDiv2 ;
                doDiv1 <= '0' ;
            end if;
        when startDiv2 =>
            doDiv2 <= '1';
            rst2 <= '1';
            state <= computeDiv2;       
        when computeDiv2 =>
            rst2 <= '0';
            if( readyDiv2 = '1' )then
                state <= compare ;
                doDiv2 <= '0' ;
            end if;  
        when compare =>
            xk_1 := div03;
            if( xk = xk_1 )then
                state <= finish ;
            else
                xk := xk_1;
                state <= start;
            end if;
        when finish =>
            sqrt <= xk;
    end case;
    end if;
end process;

end Behavioral;
