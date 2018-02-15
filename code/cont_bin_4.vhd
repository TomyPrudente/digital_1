library IEEE;
use IEEE.std_logic_1164.all;
use work.util.all;

entity cont_bin_4 is
	port(
		clk: in std_logic;					-- clk del sistema
		srst: in std_logic;					-- rst sincronico
		ena: in std_logic;					-- ena del sistema
		arst: in std_logic;					-- rst asincronico
		Q: out std_logic_vector(3 downto 0)	-- salidas 
	);
end;

architecture cont_bin_4_arq of cont_bin_4 is
	signal qaux, xor_aux, and_aux: std_logic_vector(3 downto 0);
	
begin
	-- funciones
	and_aux(0) <= '1';
	xor_aux(0) <= and_aux(0) xor qaux(0);
	and_aux(1) <= and_aux(0) and qaux(0);
	xor_aux(1) <= and_aux(1) xor qaux(1);
	and_aux(2) <= and_aux(1) and qaux(1);
	xor_aux(2) <= and_aux(2) xor qaux(2);
	and_aux(3) <= and_aux(2) and qaux(2);
	xor_aux(3) <= and_aux(3) xor qaux(3);
	
	-- instancia FF0
	ffd_0: entity work.ffds
		port map(
			clk => clk,
			srst => srst,
			arst => arst,
			ena => ena, -- 0
			D => xor_aux(0),
			Q => qaux(0)
		);
	-- instancia FF1
	ffd_1: entity work.ffds
		port map(
			clk => clk,
			srst => srst,
			arst => arst,
			ena => ena, -- 0
			D => xor_aux(1),
			Q => qaux(1)
		);
	-- instancia FF2
	ffd_2: entity work.ffds
		port map(
			clk => clk,
			srst => srst,
			arst => arst,
			ena => ena, -- 0
			D => xor_aux(2),
			Q => qaux(2)
		);
	-- instancia FF3
	ffd_3: entity work.ffds
		port map(
			clk => clk,
			srst => srst,
			arst => arst,
			ena => ena, -- 0
			D => xor_aux(3),
			Q => qaux(3)
		);
		
	Q <= qaux;
	
end;
	