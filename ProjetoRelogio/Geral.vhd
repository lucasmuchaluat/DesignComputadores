library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;           -- Biblioteca IEEE para funções aritméticas

entity Geral is
    generic
    (
        DATA_WIDTH : NATURAL := 8;
		  ADDR_WIDTH : NATURAL := 8
    );
    port
    (
        -- Input ports
		  CLOCK_50 : in std_logic;
		  SW       : in std_logic_vector(7 downto 0);
		  KEY      : in std_logic_vector(3 downto 0);
		  -- Output ports
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity;

architecture comportamento of Geral is

	signal habBaseTempo : std_logic;
	signal limpaBaseTempo : std_logic;

	signal EntradaDados : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal SaidaDados : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal habLeitura : std_logic;
	signal habEscrita : std_logic;
	signal barramentoEnd : std_logic_vector(15 downto 0);
	
	signal habDisplay : std_logic_vector(5 downto 0);
	signal habSW : std_logic_vector(7 downto 0);
	signal habKey : std_logic_vector(3 downto 0);
	
	
	 
	begin
		
		interfaceBaseTempo : entity work.divisorGenerico_e_Interface
		 port map(
			clk              => CLOCK_50,
			habilitaLeitura  => habBasetempo,
			limpaLeitura     => limpaBaseTempo,
			leituraUmSegundo => EntradaDados
		);
		
		interfaceSwitches : ENTITY work.interfaceSwitches
			PORT MAP(
				entrada  => SW(DATA_WIDTH - 1 DOWNTO 0),
				saida    => EntradaDados,
				habilita => habSW
		);
		
		interfaceDisplays : ENTITY work.interfaceDisplays
			PORT MAP(
				dataIN => SaidaDados(3 downto 0),
				enable => habDisplay,
				clk    => CLOCK_50,
				H0     => HEX0,
				H1     => HEX1,
				H2     => HEX2, 
				H3     => HEX3,
				H4     => HEX4,
				H5     => HEX5
			 );
		 
		interfaceBotoes : ENTITY work.interfaceBotao
			PORT MAP(
				entrada  => KEY,
				saida    => EntradaDados,
				habilita => habKey
		);
		
		processador : entity work.processador
		 port map(
			clk              => CLOCK_50,
			EntradaDados     => EntradaDados,
			SaidaDados       => SaidaDados,
			habLeitura       => habLeitura,
		   habEscrita       => habEscrita,
			barramentoEnd    => barramentoEnd
			
		);
		
		decodificador : entity work.decodificador
		 port map(
			dataIN => barramentoEnd,
			store => habEscrita,
			load => habLeitura,
			habDisplay => habDisplay,
			habSW => habSW,
			habBUT => habKey,
			habBaseTempo => habBaseTempo,
			limpaBasetempo => limpaBaseTempo
			
		);
	 
	 
		  

end architecture;