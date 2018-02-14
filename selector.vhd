library IEEE;
use IEEE.std_logic_1164.all;

entity selector is
	port (
		dig_1, dig_2, dig_3: in std_logic_vector(3 downto 0);
		px_sel_y: in std_logic_vector(1 downto 0);
		px_sel_x: in std_logic_vector(2 downto 0);
		sel_out: out integer range 0 to 11
	);
end entity;

architecture selector_arq of selector is

	constant char_punto: std_logic_vector(3 downto 0):= "1010";
	constant char_v: std_logic_vector(3 downto 0) := "1011";
	signal aux_3, aux_2, aux_1, aux_punto, aux_v: std_logic;
	signal aux_33, aux_22, aux_11, aux_puntopunto, aux_vv: std_logic_vector(3 downto 0);
	signal sel_aux: std_logic_vector(3 downto 0);
begin
	aux_3 <= not px_sel_x(2) and not px_sel_x(1) and not px_sel_x(0) and not px_sel_y(1) and px_sel_y(0);
	aux_punto <= not px_sel_x(2) and not px_sel_x(1) and px_sel_x(0) and not px_sel_y(1) and px_sel_y(0);
	aux_2 <= not px_sel_x(2) and px_sel_x(1) and not px_sel_x(0) and not px_sel_y(1) and px_sel_y(0);
	aux_1 <= not px_sel_x(2) and px_sel_x(1) and px_sel_x(0) and not px_sel_y(1) and px_sel_y(0);
	aux_v <= px_sel_x(2) and not px_sel_x(1) and not px_sel_x(0) and not px_sel_y(1) and px_sel_y(0); -- Ver tabla de px py y 1 2 3
	
	aux_33(3) <= aux_3 and dig_3(3);
	aux_33(2) <= aux_3 and dig_3(2);
	aux_33(1) <= aux_3 and dig_3(1);
	aux_33(0) <= aux_3 and dig_3(0);-- Los 4 bits del digito 3 cuando vaya a ser mostrado en pantalla
	
	aux_puntopunto(3) <= aux_punto and char_punto(3);
	aux_puntopunto(2) <= aux_punto and char_punto(2);
	aux_puntopunto(1) <= aux_punto and char_punto(1);
	aux_puntopunto(0) <= aux_punto and char_punto(0);
	
	aux_22(3) <= aux_2 and dig_2(3);
	aux_22(2) <= aux_2 and dig_2(2); 
	aux_22(1) <= aux_2 and dig_2(1);
	aux_22(0) <= aux_2 and dig_2(0);
	
	aux_11(3) <= aux_1 and dig_1(3);
	aux_11(2) <= aux_1 and dig_1(2);
	aux_11(1) <= aux_1 and dig_1(1);	
	aux_11(0) <= aux_1 and dig_1(0);	
	
	aux_vv(3) <= aux_v and char_v(3);
	aux_vv(2) <= aux_v and char_v(2);
	aux_vv(1) <= aux_v and char_v(1);
	aux_vv(0) <= aux_v and char_v(0);
	
	sel_aux(3) <= aux_33(3) or aux_puntopunto(3) or aux_22(3) or aux_11(3) or aux_vv(3);
	sel_aux(2) <= aux_33(2) or aux_puntopunto(2) or aux_22(2) or aux_11(2) or aux_vv(2);
	sel_aux(1) <= aux_33(1) or aux_puntopunto(1) or aux_22(1) or aux_11(1) or aux_vv(1);
	sel_aux(0) <= aux_33(0) or aux_puntopunto(0) or aux_22(0) or aux_11(0) or aux_vv(0);
	
	sel_out <= to_integer(unsigned(sel_aux));
	
end;
	
-- hacer logica para cada digito, después con un OR seleccionar cada bit de salida