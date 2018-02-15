library IEEE;
use IEEE.std_logic_1164.all;

entity cont_vertical is
	generic(
		N : natural:= 10);	
	port(
		clk: in std_logic;						-- clk del sistema
		rst_vertical_in: in std_logic;	--¿¿Lo usamos para algo??			
		ena_vertical_in: in std_logic;	--este es el que viene desde el contador horizontal			
		Q: out std_logic_vector(N-1 downto 0)	-- salida de los N ffd
	);
end;

architecture cont_vertical_arq of cont_vertical is
	signal qaux, xor_aux, and_aux: std_logic_vector(N-1 downto 0);
	
	begin
	-- funciones
	gene: for i in 0 to N-1 generate
		gene_1: if i=0 generate
			and_aux(i) <= '1';
			xor_aux(i) <= and_aux(i) xor qaux(i);
			ffd_0: entity work.ffd 
				port map (clk,rst,ena,xor_aux(i),qaux(i));
		end generate;
		
		gene_2: if i>0 generate
			and_aux(i) <= and_aux(i-1) and qaux(i-1);
			xor_aux(i) <= and_aux(i) xor qaux(i);
			ffd_N: entity work.ffd 
			port map (clk,rst,ena,xor_aux(i),qaux(i));
		end generate;
	end generate;
		
		Q <= qaux;
		
 
		rst_vertical <= not qaux(0) and qaux(1) and not qaux(2) and qaux(3) and not qaux(4) and not qaux(5)and not qaux(6) and not qaux(7) and not qaux(8) and qaux(9);
end;