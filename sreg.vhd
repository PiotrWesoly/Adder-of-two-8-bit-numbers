library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SReg is
port(ck, sr, inp, rst: in std_logic;
     Y: buffer std_logic_vector(8 downto 0));
end;

architecture behav of SReg is
begin
  reg: process(ck, rst)
  begin
    if rst = '1' then Y <= (others => '0');
    elsif rising_edge(ck) then
      if sr = '1' then
        Y <= inp & Y(8 downto 1);
      else null;
      end if;
    end if;
  end process;
end behav;

