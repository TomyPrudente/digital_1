library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rom_tb is
end;

architecture rom_tb_arq of rom_tb is

	signal sel_in_tb: integer range 0 to 11;
	signal px_x_tb: std_logic_vector(9 downto 0);
	signal px_y_tb: std_logic_vector(9 downto 0);
	signal BW_out_tb: std_logic;
	
	begin

	sel_in_tb <= 0, 1 after 50 ns, 2 after 100 ns;
	px_x_tb <= "0000110000";--, "0000000001" after 20 ns, "0000000010" after 30 ns, "0000000011" after 40 ns, "0000000100" after 50 ns;
	px_y_tb <= "0000000000";
	
	DUT: entity work.ROM
		port map(
		sel_in => sel_in_tb,
		px_x => px_x_tb,
		px_y => px_y_tb,
		BW_out => BW_out_tb
		);
		
end;