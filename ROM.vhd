library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ROM is
	port(
		sel_in: in integer range 0 to 11;		-- Entrada del caracter elegido (de 0 a 11)
		px_x: in std_logic_vector(9 downto 0);	    -- Entrada de la posición horizontal (pixel horizontal)
		px_y: in std_logic_vector(9 downto 0);	    -- Entrada de la posición vertical (pixel vertical)
		BW_out: out std_logic							-- Salida binaria (1 blanco, 2 negro, por eso BW_out)
		);
end;

architecture ROM_arch of ROM is

type caracter is array (0 to 7) of std_logic_vector(0 to 7);	-- Dibujo del caracter en 8x8

type vec_caracter is array (0 to 11) of caracter;				-- Vector de los caracteres (carac - px_y - px_x)


constant ROM_0:  caracter:=("01111110",
							"01000010",
							"01000010",
							"01000010",
							"01000010",
							"01000010",
							"01000010",
							"01111110");	
							
constant ROM_1:  caracter:=("00001000",
							"00011000",
							"00111000",
							"01011000",
							"00011000",
							"00011000",
							"00011000",
							"01111110");
							
constant ROM_2:  caracter:=("01111110",
							"01000010",
							"00000110",
							"00001000",
							"00010000",
							"00100000",
							"01000000",
							"01111110");	
							
constant ROM_3:  caracter:=("01111110",
							"00000010",
							"00000010",
							"00111110",
							"00000010",
							"00000010",
							"00000010",
							"01111110");	
							
constant ROM_4:  caracter:=("01000010",
							"01000010",
							"01000010",
							"01000010",
							"01111110",
							"00000010",
							"00000010",
							"00000010");	
							
constant ROM_5:  caracter:=("01111110",
							"01000000",
							"01000000",
							"01111110",
							"00000010",
							"00000010",
							"00000010",
							"01111110");	

constant ROM_6:  caracter:=("00011110",
							"00100000",
							"01000000",
							"01111110",
							"01000010",
							"01000010",
							"01000010",
							"01111110");	
							
constant ROM_7:  caracter:=("01111110",
							"00000010",
							"00000100",
							"00000100",
							"00001000",
							"00001000",
							"00010000",
							"00010000");
							
constant ROM_8:  caracter:=("01111110",
							"01000010",
							"01000010",
							"01111110",
							"01000010",
							"01000010",
							"01000010",
							"01111110");
							
constant ROM_9:  caracter:=("01111110",
							"01111110",
							"01100110",
							"01111110",
							"01111110",
							"00000110",
							"01111110",
							"01111110");	
							
constant ROM_10: caracter:=("00000000",
							"00000000",
							"00000000",
							"00000000",
							"00000000",
							"00111000",
							"00111000",
							"00111000");	
							
constant ROM_11: caracter:=("01000010",
							"01000010",
							"01000010",
							"00100100",
							"00100100",
							"00100100",
							"00011000",
							"00011000");	
							
signal vec_carac: vec_caracter:=(ROM_0,ROM_1,ROM_2,ROM_3,ROM_4,ROM_5,ROM_6,ROM_7,ROM_8,ROM_9,ROM_10,ROM_11);

signal sel_y, sel_x: integer range 0 to 7; 		    -- Posicion verticales y horizontales (recordar que es de 8x8)
signal super_px_x: std_logic_vector(2 downto 0);	-- Para elegir los bits 4 5 y 6 (convirtiendo asi los
signal super_px_y: std_logic_vector(2 downto 0);	-- pixeles en superpixeles)

begin

	super_px_y <= px_y(6)&px_y(5)&px_y(4); -- Determinación del superpixel vertical
	super_px_x <= px_x(6)&px_x(5)&px_x(4); -- Determinación del superpixel horizontal
	
	sel_y <= to_integer(unsigned(super_px_y));	-- Posicion SuperPixel Vertical (de 0 a 7)
	sel_x <= to_integer(unsigned(super_px_x));	-- Posicion SuperPixel Horizontal (de 0 a 7)
	

	BW_out <= vec_carac(sel_in)(sel_y)(sel_x);	-- (carac - px_y - px_x)

end;

