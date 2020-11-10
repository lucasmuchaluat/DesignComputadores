library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SomadorCompleto1bit is

  port   (
   -- Input ports
	entradaA          :  in std_logic;
	entradaB          :  in std_logic;
	vemUM             :  in std_logic;
	-- Output ports
	vaiUM             : out std_logic;
	soma              : out std_logic
	 
    );
end entity;

architecture arch_name of SomadorCompleto1bit is
  signal  saidaXOR_AB       : std_logic;
  signal  saidaAND_AB       : std_logic;
  signal  saidaAND_XOR      : std_logic;
   
begin
				  
  saidaXOR_AB <= entradaA XOR entradaB;
  saidaAND_AB <= entradaA AND entradaB;
  saidaAND_XOR <= saidaXOR_AB AND vemUM;
  
  soma <= vemUM XOR saidaXOR_AB;
  vaiUM <= saidaAND_XOR OR saidaAND_AB;
  
end architecture;