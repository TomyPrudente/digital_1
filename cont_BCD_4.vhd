library IEEE;
use IEEE.std_logic_1164.all;
use work.util.all;

entity cont_BCD_4 is
	port(
		clk: in std_logic;
		ena: in std_logic;
		arst: in std_logic;
		Q: out vect(3 downto 0); -- cada Q es un vector de 4 elementos
		F: out std_logic --señal de fin de cuenta
	);
end;

architecture cont_BCD_4_arq of cont_BCD_4 is
	signal faux: std_logic_vector(3 downto 0);
	signal and_aux: std_logic_vector(3 downto 0);
	signal qaux: vect(3 downto 0);
	
	
begin
	-- funciones
	-- and_aux(0) <= ena and faux(0);
	-- and_aux(1) <= and_aux(0) and faux(1);
	and_aux(0) <= ena;
	and_aux(1) <= and_aux(0) and faux(0);
	and_aux(2) <= and_aux(1) and faux(1);
	and_aux(3) <= and_aux(2) and faux(2);
	
	
	cont_0: entity work.cont_BCD
		port map(
			clk => clk,
			ena => and_aux(0),
			arst => arst,
			Q => qaux(0), 
			F => faux(0)
		); -- digito menos significativo. Se descarta porque en el display salen 3 digitos
	cont_1: entity work.cont_BCD
		port map(
			clk => clk,
			ena => and_aux(1),
			arst => arst,
			Q => qaux(1), 
			F => faux(1)
		);
	cont_2: entity work.cont_BCD
		port map(
			clk => clk,
			ena => and_aux(2),
			arst => arst,
			Q => qaux(2), 
			F => faux(2)
		);
	cont_3: entity work.cont_BCD
	port map(
		clk => clk,
		ena => and_aux(3),
		arst => arst,
		Q => qaux(3), 
		F => faux(3)
	);
	Q(1) <= qaux(1); -- La salida deberían ser 1, 2 y 3. El 0 se descarta
	Q(2) <= qaux(2);
	Q(3) <= qaux(3);
	F <= faux(3); -- último final de cuenta. Podría servir como un enable?
end;