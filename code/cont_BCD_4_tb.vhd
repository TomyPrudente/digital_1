library IEEE;
use IEEE.std_logic_1164.all;
use work.util.all;

entity cont_BCD_4_tb is
end;

architecture cont_BCD_4_tb_arq of cont_BCD_4_tb is
	signal clk_tb: std_logic := '0';
	signal arst_tb: std_logic := '1';
	signal ena_tb: std_logic := '0';
	signal F_tb: std_logic;
	signal Q_tb: vect(3 downto 0);
	
begin

	clk_tb <= not clk_tb after 10 ns;
	arst_tb <= '0' after 10 ns;
	ena_tb <= '1' after 12 ns;--, '0' after 150000 ns;
	
	DUT: entity work.cont_BCD_4
		port map(
			clk => clk_tb,
			ena => ena_tb,
			arst => arst_tb,
			F => F_tb,
			Q => Q_tb
		);
end;