library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detectaOverflow is

  port   (
   -- Input ports
	entradaA          :  in std_logic;
	entradaB          :  in std_logic;
	resultado         :  in std_logic;
	-- Output ports
	overflow          : out std_logic
	 
    );
end entity;

architecture arch_name of detectaOverflow is
  signal  saidaAND_ABR1      : std_logic;
  signal  saidaAND_ABR2      : std_logic;
   
begin
				  
  saidaAND_ABR1 <= not(entradaA) AND not(entradaB) AND resultado;
  saidaAND_ABR2 <= entradaA AND entradaB AND not(resultado);
  
  overflow <= saidaAND_ABR1 OR saidaAND_ABR2;
  
end architecture;