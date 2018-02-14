
--Voy a tener los flags de sinc_horizontal; sinc_vertical; back_vertical; front_vertical; front_horizontal y back_horizontal

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity flags is
	port (
	    clk: in std_logic;		-- Reloj del sistema
		Q_h: in std_logic_vector( 9 downto 0);
		sinc_horizontal: out std_logic; 
		sinc_vertical: out std_logic; 
		back_vertical: out std_logic; 
		front_vertical: out std_logic; 
		front_horizontal: out std_logic; 
		back_horizontal: out std_logic
 );
end flags;

architecture flags_arq of flags is

component ffd
	port(
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		D: in std_logic;
		Q: out std_logic
	);	
end component;

	signal

begin

--		Generación del pulso de sicronismo horizontal
   ffd_sinc_horizontal: ffd
		port map(
          clk => clk,	     -- Clock del módulo
          rst => rsth,	  	 -- Reset del módulo
          ena => enahs,    	 -- Enable del sistema
          D => Dhs,	  
          Q => Qhs
	  );
	Dhs <= not Qhs;
	hs <= Dhs;
	-- 96 = 0b 00 0110 0000 1

--	1	   =		0			0		0			0		0			0		0			0			1			1			1	
	enahs <= (not (Q_h(10) or Q_h(9) or Q_h(8) or Q_h(5) or Q_h(4) or Q_h(3) or Q_h(2) or Q_h(1))) and (Q_h(7) and Q_h(6) and Q_h(0));

--		Generación del pulso de sicronismo vertical vs = '1' when (vc <= vpw) else '0'; --	
	ffd_vs: ffd
		port map(
          clk => clk,	     -- Clock del módulo
          rst => rstv,	  	 -- Reset del módulo
          ena => enavs,    	 -- Enable del sistema
          D => Dvs,	  
          Q => Qvs
	  );
	Dvs <= not Qvs;
	vs <= Dvs;
	-- 2 = 0b 00 0000 0010
	
--	1	   =		0			0		0			0		0			0		0			0		0			1			1
	enavs <= (not (Q_v(9) or Q_v(8) or Q_v(7) or Q_v(6) or Q_v(5) or Q_v(4) or Q_v(3) or Q_v(2) or Q_v(0))) and Q_v(1) and enav;
	


end flags_arq;