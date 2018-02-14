library IEEE;
use IEEE.std_logic_1164.all;
--use work.util.all;

entity ffds is
	port(
		clk: in std_logic;
		srst: in std_logic;
		ena: in std_logic;
		arst: in std_logic;
		D: in std_logic;
		Q: out std_logic
	);
end;

architecture ffds_arq of ffds is
begin
	process(clk, srst, arst)
	begin
		if arst = '1' then
			Q <= '0';
		elsif rising_edge(clk) then
			if srst = '1' then
				Q <= '0';
			elsif ena = '1' then
				Q <= D;
			end if;
		end if;
	end process;
end;