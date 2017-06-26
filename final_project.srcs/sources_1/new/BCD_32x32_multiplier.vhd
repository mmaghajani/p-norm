----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/26/2017 03:10:25 PM
-- Design Name: 
-- Module Name: BCD_32x32_multiplier - Behavioral
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

entity BCD_32x8_multiplier is Port (
a : in std_logic_vector( 127 downto 0 );
b : in std_logic_vector( 31 downto 0 );
product : out std_logic_vector ( 127 downto 0)
);
end BCD_32x8_multiplier;

architecture Behavioral of BCD_32x8_multiplier is

component BCD_8x8_multiplier is Port (
clk : in std_logic;
rst : in std_logic;
a0 , a1 , a2 , a3 , a4 , a5 , a6 , a7 : in std_logic_vector( 3 downto 0 );
b0 , b1 , b2 , b3 , b4 , b5 , b6 , b7 : in std_logic_vector( 3 downto 0 );
p0 , p1 , p2 , p3 , p4 , p5 , p6 , p7 : out std_logic_vector( 3 downto 0 );
p8 , p9 , p10 , p11 , p12 , p13 , p14 , p15 , p16 : out std_logic_vector( 3 downto 0 )
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

signal p00,p01,p02,p03,p04,p05,p06,p07,p08,p09,p010,p011,p012,p013,p014,p015,p016 : std_logic_vector( 3 downto 0 );
signal p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p110,p111,p112,p113,p114,p115,p116 : std_logic_vector( 3 downto 0 );
signal p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p210,p211,p212,p213,p214,p215,p216 : std_logic_vector( 3 downto 0 );
signal p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p310,p311,p312,p313,p314,p315,p316 : std_logic_vector( 3 downto 0 );

signal part1, part2 , part3 , part4 : std_logic_vector( 31 downto 0 );
signal gar1,gar2,gar3 : std_logic;
begin

mul1: BCD_8x8_multiplier port map ( '1' , '0' , a( 3 downto 0) , a( 7 downto 4 ) , a( 11 downto 8 ),
                                    a( 15 downto 12 ) , a( 19 downto 16 ) , a( 23 downto 20 ),
                                    a( 27 downto 24 ) , a( 31 downto 28 ) , b( 3 downto 0 ) , 
                                    b( 7 downto 4 ) , b( 11 downto 8 ) , b( 15 downto 12 ) ,
                                    b( 19 downto 16 ) , b( 23 downto 20 ) , b( 27 downto 24 ),
                                    b( 31 downto 28 ) , p00,p01,p02,p03,p04,p05,p06,p07,p08,p09,p010,p011,p012,p013,p014,p015,p016);
mul2: BCD_8x8_multiplier port map ( '1' , '0' , a( 35 downto 32) , a( 39 downto 36 ) , a( 43 downto 40 ),
                                    a( 47 downto 44 ) , a( 51 downto 48 ) , a( 55 downto 52 ),
                                    a( 59 downto 56 ) , a( 63 downto 60 ) , b( 3 downto 0 ) , 
                                    b( 7 downto 4 ) , b( 11 downto 8 ) , b( 15 downto 12 ) ,
                                    b( 19 downto 16 ) , b( 23 downto 20 ) , b( 27 downto 24 ),
                                    b( 31 downto 28 ) , p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p110,p111,p112,p113,p114,p115,p116);
mul3: BCD_8x8_multiplier port map ( '1' , '0' , a( 67 downto 64) , a( 71 downto 68 ) , a( 75 downto 72 ),
                                    a( 79 downto 76 ) , a( 83 downto 80 ) , a( 87 downto 84 ),
                                    a( 91 downto 88 ) , a( 95 downto 92 ) , b( 3 downto 0 ) , 
                                    b( 7 downto 4 ) , b( 11 downto 8 ) , b( 15 downto 12 ) ,
                                    b( 19 downto 16 ) , b( 23 downto 20 ) , b( 27 downto 24 ),
                                    b( 31 downto 28 ) , p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p210,p211,p212,p213,p214,p215,p216);                                 
mul4: BCD_8x8_multiplier port map ( '1' , '0' , a( 99 downto 96) , a( 103 downto 100 ) , a( 107 downto 104 ),                           
                                    a( 111 downto 108 ) , a( 115 downto 112 ) , a( 119 downto 116 ),                                      
                                    a( 123 downto 120 ) , a( 127 downto 124 ) , b( 3 downto 0 ) ,                                       
                                    b( 7 downto 4 ) , b( 11 downto 8 ) , b( 15 downto 12 ) ,                                        
                                    b( 19 downto 16 ) , b( 23 downto 20 ) , b( 27 downto 24 ),                                      
                                    b( 31 downto 28 ) , p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p310,p311,p312,p313,p314,p315,p316);
part1 <= p07&p06&p05&p04&p03&p02&p01&p00;

add1: N_digit_BCD_adder generic map(8) port map( p015&p014&p013&p012&p011&p010&p09&p08 , p17&p16&p15&p14&p13&p12&p11&p10 ,
                                                    '0' , part2 , gar1);

add2: N_digit_BCD_adder generic map(8) port map( p115&p114&p113&p112&p111&p110&p19&p18 , p27&p26&p25&p24&p23&p22&p21&p20 ,
                                                    '0' , part3 , gar2);

add3: N_digit_BCD_adder generic map(8) port map( p215&p214&p213&p212&p211&p210&p29&p28 , p37&p36&p35&p34&p33&p32&p31&p30 ,
                                                    '0' , part4 , gar3);
                                                    
product <= part4 & part3 & part2 & part1 ;

end Behavioral;
