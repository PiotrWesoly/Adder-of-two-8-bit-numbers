library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CNT is
port(ld, en, ck: in std_logic;
     X: in std_logic_vector(3 downto 0);
     zero: out std_logic);
end;

architecture behav of CNT is
signal q_s: std_logic_vector(3 downto 0);
begin
  counter: process(ck)
  begin
    if rising_edge(ck) then
      if ld = '1' then
        q_s <= X;
      elsif en = '1' then
        q_s <= q_s + 1;
      else null;
      end if;
    end if;
  end process;
   zero <= '1' when q_s = "0000" else '0';
end behav; 

