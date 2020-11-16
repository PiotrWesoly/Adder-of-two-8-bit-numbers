library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity add_seq is
port(	ar, start, ck:  in std_logic;
	A, B: in std_logic_vector(7 downto 0);
	Y: out std_logic_vector(8 downto 0);
	done: out std_logic);	
end;

architecture sequential of add_seq is

component fsm is
port(	stop, clock, reset, start: in std_logic;
	init, add, done: out std_logic);
end component;	

component CNT is
port(ld, en, ck: in std_logic;
     X: in std_logic_vector(3 downto 0);
     zero: out std_logic);
end component;

component FA is
port(a,b,c: in std_logic;
     sum, cout: out std_logic);
end component;

component FF is
port(ck, D, clr: in std_logic;
     Q: out std_logic);
end component;

component SReg is
port(ck, sr, inp, rst: in std_logic;
     Y: buffer std_logic_vector(8 downto 0));
end component;

component UReg is
port(ld, sr, ck: in std_logic;
     X: in std_logic_vector(7 downto 0);
     lsb: out std_logic);
end component;

signal zero_stop, init_signal, add_signal, lsb_a, lsb_b, Q_c, sum_inp, cout_D: std_logic;
begin


statemachine: fsm port map(stop => zero_stop , clock => ck, reset => ar, start =>start, init => init_signal, add => add_signal , done => done);
counter: CNT port map(ld => init_signal  , en => add_signal , ck => ck, X => "0000" , zero => zero_stop);
adder: FA port map(a=> lsb_a, b=>lsb_b ,c => Q_c,sum => sum_inp ,cout => cout_D);
flop: FF port map(ck => ck, D =>cout_D, clr =>init_signal, Q => Q_c);
Sregister: SReg port map(ck => ck, sr => add_signal , inp => sum_inp, rst => ar, Y => Y);
UregisterA: UReg port map(ld => init_signal, sr => add_signal, ck => ck, X => A,lsb => lsb_a);
UregisterB: UReg port map(ld => init_signal, sr => add_signal, ck => ck, X => B,lsb => lsb_b);
end sequential;

