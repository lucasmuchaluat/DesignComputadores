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
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(6 downto 0);
		  LEDR : out std_logic_vector(9 downto 0)
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
	signal habLED : std_logic;
	
	signal valorLED : std_logic;
	
	
	 
	begin
	
		flipflop : entity work.flipflop   
          port map (DIN => SaidaDados(0), DOUT => valorLED, ENABLE => habLED, CLK => CLOCK_50, RST => '0');
			 
		LEDR(0) <= valorLED;
		LEDR(1) <= valorLED;
		LEDR(2) <= valorLED;
		LEDR(3) <= valorLED;
		LEDR(4) <= valorLED;
		LEDR(5) <= valorLED;
		LEDR(6) <= valorLED;
		LEDR(7) <= valorLED;
		LEDR(8) <= valorLED;
		LEDR(9) <= valorLED;
		
		interfaceBaseTempo : entity work.divisorGenerico_e_Interface
		 port map(
			clk              => CLOCK_50,
			habilitaLeitura  => habBasetempo,
			limpaLeitura     => limpaBaseTempo,
			leituraUmSegundo => EntradaDados,
			seletorMux       => SW(0)
		);
		
		interfaceSwitches : entity work.interfaceSwitches
			port map(
				entrada  => SW(DATA_WIDTH - 1 downto 0),
				saida    => EntradaDados,
				habilita => habSW
		);
		
		interfaceDisplays : entity work.interfaceDisplays
			port map(
				entrada => SaidaDados(3 downto 0),
				habilita => habDisplay,
				clk    => CLOCK_50,
				H0     => HEX0,
				H1     => HEX1,
				H2     => HEX2, 
				H3     => HEX3,
				H4     => HEX4,
				H5     => HEX5
			 );
		 
		interfaceBotoes : entity work.interfaceBotao
			port map(
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
			habLED => habLED,
			habSW => habSW,
			habBUT => habKey,
			habBaseTempo => habBaseTempo,
			limpaBasetempo => limpaBaseTempo
			
		);
	 
end architecture;