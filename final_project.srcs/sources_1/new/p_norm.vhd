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

component BCD_sqrt is Port (
number_bcd : in std_logic_vector(127 downto 0 );
sqrt_number_bcd : in std_logic_vector(7 downto 0);
clk : in std_logic;
sqrt : out std_logic_vector(127 downto 0) 
);
end component;

component BCD_power is Port (
base_BCD : in std_logic_vector( 127 downto 0);
power_BCD : in std_logic_vector( 7 downto 0);
result_BCD : out std_logic_vector( 127 downto 0 );
AVF : out std_logic
);
end component;

signal add01,add02,add04 : std_logic_vector( 127 downto 0 ) ;
signal add03,add05 : std_logic;

signal add11,add12,add14 : std_logic_vector( 127 downto 0 ) ;
signal add13,add15 : std_logic;

signal add21,add22,add24 : std_logic_vector( 127 downto 0 ) ;
signal add23,add25 : std_logic;

signal add31,add32,add34 : std_logic_vector( 127 downto 0 ) ;
signal add33,add35 : std_logic;

signal pow01 , pow03 : std_logic_vector( 127 downto 0 );
signal pow02 : std_logic_vector( 7 downto 0);
signal pow04 : std_logic;

signal pow11 , pow13 : std_logic_vector( 127 downto 0 );
signal pow14 : std_logic;

signal pow21 , pow23 : std_logic_vector( 127 downto 0 );
signal pow24 : std_logic;

signal pow31 , pow33 : std_logic_vector( 127 downto 0 );
signal pow34 : std_logic;

signal pow41 , pow43 : std_logic_vector( 127 downto 0 );
signal pow44 : std_logic;

signal sqrt1 , sqrt3 : std_logic_vector( 127 downto 0 );

begin

adder1: N_digit_BCD_adder generic map(32) port map(add01 , add02 , add03 , add04 , add05);
adder2: N_digit_BCD_adder generic map(32) port map(add11 , add12 , add13 , add14 , add15);
adder3: N_digit_BCD_adder generic map(32) port map(add21 , add22 , add23 , add24 , add25);
adder4: N_digit_BCD_adder generic map(32) port map(add31 , add32 , add33 , add34 , add35);

power1: BCD_power port map( pow01 , p , pow03 , pow04 );
power2: BCD_power port map( pow11 , p , pow13 , pow14 );
power3: BCD_power port map( pow21 , p , pow23 , pow24 );
power4: BCD_power port map( pow31 , p , pow33 , pow34 );
power5: BCD_power port map( pow41 , p , pow43 , pow44 );

sqrt: BCD_sqrt port map( sqrt1 , p , clk , sqrt3 );

add11 <= add04 ;
add21 <= add14 ;
add31 <= add24 ;

pow01 <= X"000000000000000000000000" & a1;
pow11 <= X"000000000000000000000000" & a2;
pow21 <= X"000000000000000000000000" & a3;
pow31 <= X"000000000000000000000000" & a4;
pow41 <= X"000000000000000000000000" & a5;

add01 <= pow03 ;
add02 <= pow13 ;
add12 <= pow23 ;
add22 <= pow33 ;
add32 <= pow43 ;

sqrt1 <= add34 ;

norm <= sqrt3 ;

end Behavioral;
