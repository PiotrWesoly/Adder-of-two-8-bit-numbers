library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity FF is
port(ck, D, clr: in std_logic;
     Q: out std_logic);
end;

architecture behav of FF is
begin
  mem: process(ck)
  begin
    if rising_edge(ck) then
      if clr = '1' then
        Q <= '0';
      else
        Q <= D; 
      end if;
    end if;
  end process;
end behav;

