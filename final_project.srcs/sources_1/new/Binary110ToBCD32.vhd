library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Binary110ToBCD32 is
   Port ( 
      number   : in  std_logic_vector (109 downto 0);
      bcd : out std_logic_vector( 127 downto 0 )
   );
end Binary110ToBCD32;

architecture Behavioral of Binary110ToBCD32 is

begin

   bin_to_bcd : process (number)
      -- Internal variable for storing bits
      variable shift : unsigned(237 downto 0);
      
	  -- Alias for parts of shift register
      alias num is shift(109 downto 0);
      alias one is shift(113 downto 110);
      alias ten is shift(117 downto 114);
      alias hun is shift(121 downto 118);
      alias tho is shift(125 downto 122);
      alias one1 is shift(129 downto 126);
      alias ten1 is shift(133 downto 130);
      alias hun1 is shift(137 downto 134);
      alias tho1 is shift(141 downto 138);
      alias one2 is shift(145 downto 142);
      alias ten2 is shift(149 downto 146);
      alias hun2 is shift(153 downto 150);
      alias tho2 is shift(157 downto 154);
      alias one3 is shift(161 downto 158);
      alias ten3 is shift(165 downto 162);
      alias hun3 is shift(169 downto 166);
      alias tho3 is shift(173 downto 170);
      alias one4 is shift(177 downto 174);
      alias ten4 is shift(181 downto 178);
      alias hun4 is shift(185 downto 182);
      alias tho4 is shift(189 downto 186);
      alias one5 is shift(193 downto 190); 
      alias ten5 is shift(197 downto 194); 
      alias hun5 is shift(201 downto 198); 
      alias tho5 is shift(205 downto 202); 
      alias one6 is shift(209 downto 206);
      alias ten6 is shift(213 downto 210);
      alias hun6 is shift(217 downto 214);
      alias tho6 is shift(221 downto 218);
      alias one7 is shift(225 downto 222);
      alias ten7 is shift(229 downto 226);
      alias hun7 is shift(233 downto 230);
      alias tho7 is shift(237 downto 234);

   begin
      -- Clear previous number and store new number in shift register
      num := unsigned(number);
      one := X"0";
      ten := X"0";
      hun := X"0";
      tho := X"0";
      one1 := X"0";
      ten1 := X"0";
      hun1 := X"0";
      tho1 := X"0";
      one2 := X"0";
      ten2 := X"0";
      hun2 := X"0";
      tho2 := X"0";
      one3 := X"0";
      ten3 := X"0";
      hun3 := X"0";
      tho3 := X"0";
      one4 := X"0";
      ten4 := X"0";
      hun4 := X"0";
      tho4 := X"0";
      one5 := X"0";
      ten5 := X"0";
      hun5 := X"0";
      tho5 := X"0";
      one6 := X"0";
      ten6 := X"0";
      hun6 := X"0";
      tho6 := X"0";
      one7 := X"0";
      ten7 := X"0";
	  hun7 := X"0";
	  tho7 := X"0";
	  
	  -- Loop eight times
      
      for i in 1 to num'Length loop
	     -- Check if any digit is greater than or equal to 5
         if one >= 5 then
            one := one + 3;
         end if;
         
         if ten >= 5 then
            ten := ten + 3;
         end if;
         
         if hun >= 5 then
            hun := hun + 3;
         end if;
         
         if tho >= 5 then
            tho := tho + 3;
         end if;
         
         if one1 >= 5 then
            one1 := one1 + 3;
         end if;
         
         if ten1 >= 5 then
            ten1 := ten1 + 3;
         end if;
         
         if hun1 >= 5 then
            hun1 := hun1 + 3;
         end if;
         
         if tho1 >= 5 then
            tho1 := tho1 + 3;
         end if;
         
         if one2 >= 5 then
            one2 := one2 + 3;
         end if;
         
         if ten2 >= 5 then
            ten2 := ten2 + 3;
         end if;
         
         if hun2 >= 5 then
            hun2 := hun2 + 3;
         end if;
         
         if tho2 >= 5 then
            tho2 := tho2 + 3;
         end if;
         
         if one3 >= 5 then
            one3 := one3 + 3;
         end if;
         
         if ten3 >= 5 then
            ten3 := ten3 + 3;
         end if;
         
         if hun3 >= 5 then
            hun3 := hun3 + 3;
         end if;
         
         if tho3 >= 5 then
            tho3 := tho3 + 3;
         end if;
         
         if one4 >= 5 then
            one4 := one4 + 3;
         end if;
         
         if ten4 >= 5 then
            ten4 := ten4 + 3;
         end if;
         
         if hun4 >= 5 then
            hun4 := hun4 + 3;
         end if;
         
         if tho4 >= 5 then
            tho4 := tho4 + 3;
         end if;
         
         if one5 >= 5 then
            one5 := one5 + 3;
         end if;
         
         if ten5 >= 5 then
            ten5 := ten5 + 3;
         end if;
         
         if hun5 >= 5 then
            hun5 := hun5 + 3;
         end if;
         
         if tho5 >= 5 then
            tho5 := tho5 + 3;
         end if;
         
         if one6 >= 5 then
            one6 := one6 + 3;
         end if;
         
         if ten6 >= 5 then
            ten6 := ten6 + 3;
         end if;
         
         if hun6 >= 5 then
            hun6 := hun6 + 3;
         end if;
         
         if tho6 >= 5 then
            tho6 := tho6 + 3;
         end if;
         
         if one7 >= 5 then
            one7 := one7 + 3;
         end if;
         
         if ten7 >= 5 then
            ten7 := ten7 + 3;
         end if;
         
         if hun7 >= 5 then
            hun7 := hun7 + 3;
         end if;
         
         if tho7 >= 5 then
            tho7 := tho7 + 3;
         end if;
         
		 -- Shift entire register left once
         shift := shift_left(shift, 1);
      end loop;
      
	  -- Push decimal numbers to output
	  bcd( 3 downto 0 )     <= std_logic_vector(one);
	  bcd( 7 downto 4 )     <= std_logic_vector(ten);
	  bcd( 11 downto 8 )    <= std_logic_vector(hun);
	  bcd( 15 downto 12)   <= std_logic_vector(tho);
	  bcd( 19 downto 16)   <= std_logic_vector(one1);
	  bcd( 23 downto 20)   <= std_logic_vector(ten1);
	  bcd( 27 downto 24)   <= std_logic_vector(hun1);
	  bcd( 31 downto 28)   <= std_logic_vector(tho1);
	  bcd( 35 downto 32)   <= std_logic_vector(one2);
	  bcd( 39 downto 36)   <= std_logic_vector(ten2);
	  bcd( 43 downto 40)   <= std_logic_vector(hun2);
	  bcd( 47 downto 44)   <= std_logic_vector(tho2);
      bcd( 51 downto 48)   <= std_logic_vector(one3);
      bcd( 55 downto 52)   <= std_logic_vector(ten3);
      bcd( 59 downto 56)   <= std_logic_vector(hun3);
      bcd( 63 downto 60)   <= std_logic_vector(tho3);
      bcd( 67 downto 64)   <= std_logic_vector(one4);
      bcd( 71 downto 68)   <= std_logic_vector(ten4);
      bcd( 75 downto 72)   <= std_logic_vector(hun4);
	  bcd( 79 downto 76)   <= std_logic_vector(tho4);
      bcd( 83 downto 80)   <= std_logic_vector(one5);
      bcd( 87 downto 84)   <= std_logic_vector(ten5);
      bcd( 91 downto 88)   <= std_logic_vector(hun5);
      bcd( 95 downto 92)   <= std_logic_vector(tho5);
      bcd( 99 downto 96)   <= std_logic_vector(one6);
      bcd( 103 downto 100 )   <= std_logic_vector(ten6);
      bcd( 107 downto 104 )   <= std_logic_vector(hun6);
	  bcd( 111 downto 108 )   <= std_logic_vector(tho6);
      bcd( 115 downto 112 )   <= std_logic_vector(one7);
      bcd( 119 downto 116 )   <= std_logic_vector(ten7);
      bcd( 123 downto 120 )   <= std_logic_vector(hun7);
      bcd( 127 downto 124 )   <= std_logic_vector(tho7);
   end process;

end Behavioral;