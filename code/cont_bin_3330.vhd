library IEEE;
use IEEE.std_logic_1164.all;

entity cont_bin_3330 is
	generic(
		N : natural:= 12);	
	port(
		clk: in std_logic;						-- clk del sistema
		rst: in std_logic;						-- rst del sistema
		ena: in std_logic;						-- ena del sistema
		rst_out_3330 : out std_logic;			-- rst para 3330 cuentas (3329) (1101 0000 0001)
		ena_out_3329: out std_logic;			-- ena para 3329 cuentas (3328) (1101 0000 0000)
		Q: out std_logic_vector(N-1 downto 0)	-- salida de los N ffd
	);
end;

architecture cont_bin_3330_arq of cont_bin_3330 is
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
		--rst_out_3330 <= (not qaux(0)) and qaux(1) and (not qaux(2)) and (not qaux(3)) and (not qaux(4)) and (not qaux(5)) and (not qaux(6)) and (not qaux(6)) and (not qaux(7)) and qaux(8) and (not qaux(9)) and qaux(10) and qaux(11);
		rst_out_3330 <= qaux(0) and qaux(8) and qaux(10) and qaux(11);

		--ena_out_3329 <= qaux(0) and (not qaux(1)) and (not qaux(2)) and (not qaux(3)) and (not qaux(4)) and (not qaux(5)) and (not qaux(6)) and (not qaux(6)) and (not qaux(7)) and qaux(8) and (not qaux(9)) and qaux(10) and qaux(11);
		ena_out_3329 <= qaux(8) and qaux(10) and qaux(11);
end;