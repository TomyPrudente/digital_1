library IEEE;
use IEEE.std_logic_1164.all;

entity cont_horizontal is
	generic(
		N : natural:= 10);	
	port(
		clk: in std_logic;						-- clk del sistema
		--rst_horizontal_in: in std_logic;		--Lo uso para algo?
		ena_horizontal: in std_logic;		
		rst_horizontal_out : out std_logic;			-- rst para 800 cuentas (un bit de mas para bajar la frecuencia a la mitad)
		ena_vertical_out: out std_logic;			-- ena para 800 cuentas 
		Q_horizontal: out std_logic_vector(N-1 downto 0)	-- salida de los N ffd
	);
end;

architecture cont_horizontal_arq of cont_horizontal is
	signal qaux, xor_aux, and_aux: std_logic_vector(N-1 downto 0);
	
	begin
	-- funciones
	gene: for i in 0 to N-1 generate
		gene_1: if i=0 generate
			and_aux(i) <= '1';
			xor_aux(i) <= and_aux(i) xor qaux(i);
			ffd_0: entity work.ffd 
				port map (clk,rst_horizontal_out,ena_horizontal,xor_aux(i),qaux(i)); --rst_horizontal_in¿?
		end generate;
		
		gene_2: if i>0 generate
			and_aux(i) <= and_aux(i-1) and qaux(i-1);
			xor_aux(i) <= and_aux(i) xor qaux(i);
			ffd_N: entity work.ffd 
			port map (clk,rst_horizontal_out,ena_horizontal,xor_aux(i),qaux(i));
		end generate;
	end generate;
		
		Q_horizontal <= qaux;
		
 
		rst_horizontal_out <= qaux(0) and not qaux(1) and not qaux(2) and not qaux(3) and not qaux(4) and qaux(5)and not qaux(6) and not qaux(7) and qaux(8) and qaux(9);
	
		ena_vertical_out <= not qaux(0) and not qaux(1) and not qaux(2) and not qaux(3) and not qaux(4) and qaux(5)and not qaux(6) and not qaux(7) and qaux(8) and qaux(9);
end;