library IEEE;
use IEEE.std_logic_1164.all;

entity cont_bin_3330_tb is
end;

architecture cont_bin_3330_tb_arq of cont_bin_3330_tb is
	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '0';
	constant N_tb: natural := 12;
	signal Q_tb: std_logic_vector(N_tb-1 downto 0);
	signal rst_out_3330_tb: std_logic := '0';
	signal ena_out_3329_tb: std_logic := '1';
begin
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= rst_out_3330_tb; --'0' after 10 ns; --, '1' after 66630 ns;
	ena_tb <= '1' after 12 ns; --ena_out_3329_tb; --'1' after 12 ns; --, '0' after 66630 ns;

	DUT: entity work.cont_bin_3330
		generic map (N => N_tb)
		port map(
			clk => clk_tb,
			rst => rst_tb,
			ena => ena_tb,
			Q => Q_tb,
			rst_out_3330 => rst_out_3330_tb,
			ena_out_3329 => ena_out_3329_tb
		);
	
end;