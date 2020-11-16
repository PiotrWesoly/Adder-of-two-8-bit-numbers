library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fsm is
port(	stop, clock, reset, start: in std_logic;
	init, add, done: out std_logic);
end;

architecture behavioral of fsm is

subtype state is std_logic_vector(1 downto 0);
signal s, z: state; 
constant s0: state :="00";
constant s1: state :="01";
constant s2: state :="10";

begin
memory: process(clock, reset)
begin
	if reset = '1' then
	s <= s0;
	elsif rising_edge(clock) then
	s <= z;
	end if;
end process;

states: process(stop, start, s)
begin
	case s is

		when s0 =>
		if start = '1' and stop= '0' then z <= s1;
		else z <= s0;
		end if;

		when s1 =>
		if start = '0' and stop='1'  then z <= s2;
		else z <= s1;
		end if;

		when others =>
		if ((start='1' and stop='0') or (start='1' and stop='1')) then z<=s0;
		else z<= s2;
		end if;

	end case;
end process;

data: process(s)
begin
	case s is
		when s0 =>
			add<='0';
			init<='1';
			done<='0';
		when s1 =>
			add<='1';
			init<='0';
			done<='0';
		when others =>
			add<='0';
			init<='0';
			done<='1';
	end case;
end process;
end behavioral;

