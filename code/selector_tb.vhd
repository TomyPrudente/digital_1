library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity selector_tb is
end;

architecture selector_tb_arq of selector_tb is
	--signal clk_tb: std_logic := '0';
	signal dig_1_tb: std_logic_vector(3 downto 0);
	signal dig_2_tb: std_logic_vector(3 downto 0);
	signal dig_3_tb: std_logic_vector(3 downto 0);
	signal px_sel_x_tb: std_logic_vector(2 downto 0);
	signal px_sel_y_tb: std_logic_vector(1 downto 0);
	signal sel_out_tb: integer range 0 to 11;
begin
	--clk_tb <= not clk_tb after 10 ns;
	dig_1_tb <= "0100";
	dig_2_tb <= "0101";
	dig_3_tb <= "0001";
	px_sel_x_tb <= "000", "001" after 30 ns, "010" after 60 ns, "011" after 90 ns, "100" after 120 ns;
	px_sel_y_tb <= "01";
	
	DUT: entity work.selector
		port map(
		--clk => clk_tb,
		dig_1 => dig_1_tb,
		dig_2 => dig_2_tb,
		dig_3 => dig_3_tb,
		px_sel_x => px_sel_x_tb,
		px_sel_y => px_sel_y_tb,
		sel_out => sel_out_tb		
		);
		
end;