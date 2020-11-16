library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity UReg is
port(ld, sr, ck: in std_logic;
     X: in std_logic_vector(7 downto 0);
     lsb: out std_logic
);
end;

architecture behav of UReg is
signal X_s: std_logic_vector(7 downto 0);
begin
reg: process(ck)
  begin
    if rising_edge(ck) then
      if ld = '1' then
        X_s <= X; 
      elsif sr = '1' then
        X_s <= '0' & X_s(7 downto 1);
      else null;
      end if;
    end if;
  end process;
  lsb <= X_s(0);
end behav;

