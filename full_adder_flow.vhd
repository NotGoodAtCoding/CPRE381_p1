library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_flow is
 generic(N : integer := 4);
 port(i_A, i_B    : in std_logic_vector(N-1 downto 0);
      i_C         : in std_logic;
      o_S         : out std_logic_vector(N-1 downto 0);
      o_C         : out std_logic);

end full_adder_flow;

architecture dataflow of full_adder_flow is

signal carry : std_logic_vector(N downto 0);
signal s_axb, s_carry1, s_carry2 : std_logic_vector(N downto 0);

begin

carry(0) <= i_C;
G1: for i in 0 to N-1 generate
 s_axb(i)       <= i_A(i) XOR i_B(i);
 o_S(i)         <= s_axb(i) XOR carry(i);
 s_carry1(i)    <= s_axb(i) AND carry(i);
 s_carry2(i)    <= i_A(i) AND i_B(i);
 carry(i+1)     <= s_carry1(i) OR s_carry2(i);

end generate;

o_C <= carry(N);

end dataflow;
