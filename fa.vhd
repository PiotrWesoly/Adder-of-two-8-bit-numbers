library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity FA is
port(a,b,c: in std_logic;
     sum, cout: out std_logic);
end;

architecture equations of FA is
begin
  sum <= a xor b xor c;
  cout <= (a and b) or (a and c) or (b and c);
end equations;

