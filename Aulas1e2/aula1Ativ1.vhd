library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;           -- Biblioteca IEEE para funções aritméticas

entity aula1Ativ1 is
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

architecture comportamento of aula1Ativ1 is

	 signal saida2X : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 signal saida2Y : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 signal saida3Y : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 signal saida2X3Y : STD_LOGIC_VECTOR((larguraDados-1) downto 0);

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
		  
		  somador2Y: somadorGenerico port map (
				entradaA => SW(3 downto 0),
				entradaB => SW(3 downto 0),
				saida => saida2Y
		  );
		  
		  somador3Y: somadorGenerico port map (
				entradaA => saida2Y,
				entradaB => SW(3 downto 0),
				saida => saida3Y
		  );
		  
		  subtrator2X3Y: subtratorGenerico port map (
				entradaA => saida2X,	
				entradaB => saida3Y,
				saida => saida2X3Y
		  );
		  
		  somadorFinal: somadorGenerico port map (
				entradaA => saida2X3Y,
				entradaB => x"7",
				saida => resultado
		  );
		  
		  LEDR(3 downto 0) <= resultado;
		  

end architecture;