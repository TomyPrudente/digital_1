library IEEE;
use IEEE.std_logic_1164.all;
use work.util.all;

entity cont_BCD is
	port(
		clk: in std_logic;
		arst: in std_logic;
		ena: in std_logic;
		--srst: in std_logic;
		Q: out std_logic_vector(3 downto 0);
		F: out std_logic --señal de fin de cuenta
	);
end;

architecture cont_BCD_arq of cont_BCD is
	signal qaux: std_logic_vector(3 downto 0);
	signal S, SA: std_logic;
	signal arst_aux: std_logic;
	
begin
	arst_aux <= SA or arst;

	-- cont BCD
	contador: entity work.cont_bin_4
		port map(
			clk => clk,
			srst => '0',
			arst => arst_aux,
			ena => ena, -- 0
			Q => qaux
		);
		
	S <= qaux(3) and not qaux(2) and not qaux(1) and qaux(0);
	SA <= qaux(3) and not qaux(2) and qaux(1) and not qaux(0);

	-- process(clk)
	-- begin
		-- if rising_edge(clk) then
			-- SA <= S
		-- end if;
	-- end process;
	
	
	Q <= qaux;
	F <= S;
	
	
end;