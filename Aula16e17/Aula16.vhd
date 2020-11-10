library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Aula16 is

  port   (
    -- Input ports
    A :  in std_logic_vector(31 downto 0);
    B :  in std_logic_vector(31 downto 0);
	 funct   :  in std_logic_vector(5 downto 0);
    ULAop   :  in  std_logic_vector(1 downto 0);
	 -- Output ports
	 resultado :  out std_logic_vector(31 downto 0);
	 overflow  :  out std_logic
    );
end entity;

architecture arch_name of Aula16 is

  signal  ulaControle: std_logic_vector(2 downto 0);

   
begin

  ucULA : entity work.UnidadeControleULA
		port map( ulaOp   => ULAop, 
                funct   => funct,
                ulaCtrl => ulaControle);


  
  ULA : entity work.ULA32bits
      port map( entradaA => A,
					 entradaB => B,
					 operacaoULA => ulaControle,
					 overflow_final => overflow,
					 resultadoULA => resultado);
  

END ARCHITECTURE;