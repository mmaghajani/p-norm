----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2017 03:20:27 PM
-- Design Name: 
-- Module Name: divider - Behavioral
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
use ieee.numeric_std.all; 
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity new_divider is 
generic( N : integer := 4 );
Port (
 clk,rst,do : in std_logic;
 dividend : in std_logic_vector( 2*N-1 downto 0 ) ;
 divisor : in std_logic_vector( N-1 downto 0 ) ;
 quotient,reminder : out std_logic_vector( N-1 downto 0 );
 DVF,ready : out std_logic
 );
end new_divider;



architecture RTL of new_divider is

type state_type is ( start , overflow , startCompute , compute , finish );
signal state : state_type := start ;

begin

process(clk)
variable sc : integer;
variable a : std_logic_vector( N-1 downto 0 );
variable q : std_logic_vector( N-1 downto 0 );
variable b : std_logic_vector( N-1 downto 0 );
variable er : std_logic := '0';
variable temp : unsigned( 2*N downto 0 );
variable temp2 : std_logic_vector( N downto 0 );
begin
    if( clk'event and clk ='1' )then
    if( do = '1' )then
    if( rst = '1' )then
        state <= start;
        ready <= '0';
    else
        case state is
            when start =>
                a := dividend( 2*N-1 downto N );
                q := dividend( N-1 downto 0 );
                b := divisor;
                sc := N;
                temp2 := ('1'&a)-('0'&b);
                er := temp2(N);
                a := temp2( N-1 downto 0);
                if( er = '1' ) then
                    state <= overflow;
                else
                    state <= startCompute;
                end if;
            when overflow =>
                DVF <= '1';
                temp2 := ('1'&a) + ('0'&b);
                a := temp2( N-1 downto 0 );
                state <= finish;
            when startCompute =>
                DVF <= '0';
                temp2 := ('1'&a) + ('0'&b);
                a := temp2( N-1 downto 0 );
                er := temp2(N);
                state <= compute;
            when compute =>
                if( sc /= 0 )then
                    er := a(N-1);
                    a := a( N-2 downto 0 ) & q(N-1);
                    q := q(N-2 downto 0 ) & '0';
                    if( er = '1')then
                        a := a-b;
                        q(0) := '1';
                    else
                        temp2 := ('1'&a) - ('0'&b);
                        er := temp2(N);
                        a := temp2(N-1 downto 0 );                    
                        if( er = '1' )then
                            q(0) := '1';
                        else
                            temp2 := ('1'&a) + ('0'&b);
                            er := temp2(N);
                            a := temp2(N-1 downto 0);
                        end if;
                    end if;
                    sc := sc-1;
                else
                    quotient <= q;
                    reminder <= a;
                    state <= finish;
                end if;
            when finish =>
                ready <= '1';
        end case;
    end if;
    end if;
    end if;
end process;
end RTL;
