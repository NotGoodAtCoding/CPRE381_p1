library IEEE;
use IEEE.std_logic_1164.all;

entity alu_one_bit is
 port(i_A, i_B    : in std_logic;
      i_S         : in std_logic_vector(3 downto 0);
      o_S         : out std_logic;
      o_C         : out std_logic);

end alu_one_bit;

component full_adder_flow is
 generic(N : integer := 4);
 port(i_A, i_B, i_C  : in std_logic_vector(N-1 downto 0);
      i_C            : in std_logic;
      o_S            : out std_logic_vector(N-1 downto 0);
      o_C            : out std_logic);

end component;

architecture dataflow of alu_one_bit is

begin

-- Select to operation map
-- i_S		op
-- (~A)(~B)(OP1)(OP2)
-- 0000		and
-- 0001		or
-- 0010		add
-- 0011		addu
-- 0100		
-- 0101		
-- 0110		
-- 0111		slt
-- 1000		
-- 1001		
-- 1010		sub
-- 1011		subu
-- 1100		nor
-- 1101		nand
-- 1110		
-- 1111

if ( i_S = '0000') then
  o_S <= ( ( i_A AND i_B ) ) 
  o_C <= '0'
else if ( i_S = '0001') then
  o_S <= ( i_A OR i_B ) 
  o_C <= '0'
else if ( i_S = '0010') then
  o_S <= ( (i_A XOR i_B) XOR i_C)
  o_C <= (i_A AND i_B) OR (i_C AND (i_A XOR i_B))
else if (i_S = '0010') then
  o_S <= ( (i_A XOR i_B) XOR i_C)
  o_C <= '0'

end dataflow;
