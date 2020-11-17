library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;           -- Biblioteca IEEE para funções aritméticas

entity aula1Ativ2 is
    generic
    (
        larguraDados : natural := 4
    );
    port
    (
	 
        SW: in STD_LOGIC_VECTOR(9 downto 0);
        LEDR:  out STD_LOGIC_VECTOR((larguraDados-1) downto 0)
--		  entrada7: in STD_LOGIC_VECTOR((larguraDados-1) downto 0):= x"7";
    );
end entity;

architecture comportamento of aula1Ativ2 is

	 signal saida2X : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 signal saida3X : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 signal saida2Y : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 signal saida3X2Y : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 signal resultado : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 
	 component somadorGenerico is
        port (
			  entradaA, entradaB: in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
			  saida:  out STD_LOGIC_VECTOR((larguraDados-1) downto 0)
		  );
    end component;
	 
	 component subtratorGenerico is
        port (
			  entradaA, entradaB: in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
			  saida:  out STD_LOGIC_VECTOR((larguraDados-1) downto 0)
		  );
    end component;


    begin
		  
		  somador2X: somadorGenerico port map (
				entradaA => SW(9 downto 6),
				entradaB => SW(9 downto 6),
				saida => saida2X
		  );  
		  
		  somador3X: somadorGenerico port map (
				entradaA => saida2X,
				entradaB => SW(9 downto 6),
				saida => saida3X
		  );
		  
		  somador2Y: somadorGenerico port map (
				entradaA => SW(3 downto 0),
				entradaB => SW(3 downto 0),
				saida => saida2Y
		  );
		  
		  subtrator3X2Y: subtratorGenerico port map (
				entradaA => saida3X,	
				entradaB => saida2Y,
				saida => saida3X2Y
		  );
		  
		  somadorFinal: somadorGenerico port map (
				entradaA => saida3X2Y,
				entradaB => x"5",
				saida => resultado
		  );
		  
		  LEDR(3 downto 0) <= resultado;
		  

end architecture;