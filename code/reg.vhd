library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
	port(
		clk, rst, write_ena: in std_logic;
		regin_1, regin_2, regin_3: in std_logic_vector(3 downto 0);
		regout_1, regout_2, regout_3: out std_logic_vector(3 downto 0)
	);
end;

architecture reg_arq of reg is
	
begin

	gene_ffd3: for i in 0 to 3 generate
		ffd3: entity work.ffd
		port map(
			clk => clk,
			rst => rst,
			ena => write_ena,
			D => regin_3(i),
			Q => regout_3(i)
		);
	end generate;

	gene_ffd2: for i in 0 to 3 generate
		ffd2: entity work.ffd
		port map(
			clk => clk,
			rst => rst,
			ena => write_ena,
			D => regin_2(i),
			Q => regout_2(i)
		);
	end generate;
	
	gene_ffd1: for i in 0 to 3 generate
		ffd1: entity work.ffd
		port map(
			clk => clk,
			rst => rst,
			ena => write_ena,
			D => regin_1(i),
			Q => regout_1(i)
		);
	end generate;
	
end architecture;