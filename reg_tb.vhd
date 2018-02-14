library IEEE;
use IEEE.std_logic_1164.all;

entity reg_tb is
end;

architecture reg_tb_arq of reg_tb is
	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	--signal ena_tb: std_logic := '0';
	signal write_ena_tb: std_logic := '0';
	signal regin_1_tb: std_logic_vector(3 downto 0);
	signal regin_2_tb: std_logic_vector(3 downto 0);
	signal regin_3_tb: std_logic_vector(3 downto 0);
	signal regout_1_tb: std_logic_vector(3 downto 0);
	signal regout_2_tb: std_logic_vector(3 downto 0);
	signal regout_3_tb: std_logic_vector(3 downto 0);
	
begin
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 10 ns;
	write_ena_tb <= '1' after 50 ns, '0' after 60 ns, '1' after 70 ns;
	regin_1_tb <= "0001", "0010" after 51 ns;
	regin_2_tb <= "0010", "0011" after 51 ns;
	regin_3_tb <= "1001", "0000" after 51 ns;
	
	DUT: entity work.reg
		port map(
		clk => clk_tb,
		rst => rst_tb,
		write_ena => write_ena_tb,
		regin_1 => regin_1_tb,
		regin_2 => regin_2_tb,
		regin_3 => regin_3_tb,
		regout_1 => regout_1_tb,
		regout_2 => regout_2_tb,
		regout_3 => regout_3_tb
		);
		
end;