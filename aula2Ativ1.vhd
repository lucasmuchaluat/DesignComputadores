library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;           -- Biblioteca IEEE para funções aritméticas

entity aula2Ativ1 is
    generic
    (
        larguraDados : natural := 8
    );
    port
    (
	 
        SW: in STD_LOGIC_VECTOR(9 downto 0);
		  KEY: in STD_LOGIC_VECTOR(3 downto 0);
		  FPGA_RESET: in  STD_LOGIC;
		  CLOCK_50: in  STD_LOGIC;
        LEDR:  out STD_LOGIC_VECTOR(9 downto 0)
--		  entrada7: in STD_LOGIC_VECTOR((larguraDados-1) downto 0):= x"7";
    );
end entity;

architecture comportamento of aula2Ativ1 is

	 signal saidaRegA, saidaRegB, outMUX : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 signal edgeClock, edgeRstb, edgeRsta : std_logic;

	 signal resultadoULA : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	 
	 component ULA is
        port (
			  entradaA, entradaB: in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
			  operacao: in STD_LOGIC;
			  saida:  out STD_LOGIC_VECTOR((larguraDados-1) downto 0)
		  );
    end component;
	 
	 component muxGenerico2x1 is
        port (
			  entradaA_MUX, entradaB_MUX : in std_logic_vector((larguraDados-1) downto 0);
			  seletor_MUX : in std_logic;
			  saida_MUX : out std_logic_vector((larguraDados-1) downto 0)
		  );
    end component;
	 
	 component registradorGenerico is
        port (
			  DIN : in std_logic_vector(larguraDados-1 downto 0);
			  DOUT : out std_logic_vector(larguraDados-1 downto 0);
			  ENABLE : in std_logic;
			  CLK,RST : in std_logic
		  );
	end component;

	component edgeDetector is
        port (
			  clk : in  std_logic;
			  entrada : in  std_logic;
			  saida : out std_logic
		  );
	end component;

	begin
		
		  detectorCLK: work.edgeDetector(bordaSubida) port map (
			  clk => CLOCK_50,
			  entrada => FPGA_RESET,
			  saida => edgeClock
		  );

		  detectorRSTA: work.edgeDetector(bordaSubida) port map (
			  clk => CLOCK_50,
			  entrada => KEY(1),
			  saida => edgeRsta
		  );

		  detectorRSTB: work.edgeDetector(bordaSubida) port map (
			  clk => CLOCK_50,
			  entrada => KEY(0),
			  saida => edgeRstb
		  );
		  
		  regA: registradorGenerico port map (
				DIN => outMUX,
				DOUT => saidaRegA,
				ENABLE => KEY(3),
				CLK => edgeClock,
				RST => edgeRsta
		  );
		  
		  regB: registradorGenerico port map (
				DIN => SW(7 downto 0),
				DOUT => saidaRegB,
				ENABLE => KEY(2),
				CLK => edgeClock,
				RST => edgeRstb
		  );
		  
		  mux: muxGenerico2x1 port map (
				entradaA_MUX => SW(7 downto 0),
				entradaB_MUX => resultadoULA,
				seletor_MUX => SW(8),
				saida_MUX => outMux
				
		  );
		  
		  ula_dif: ULA port map (
				entradaA => saidaRegA,
				entradaB => saidaRegB,
				operacao => SW(9),
				saida => resultadoULA
		  );
		  
		  
		  LEDR(7 downto 0) <= resultadoULA;
		  LEDR(8) <= SW(8);
		  LEDR(9) <= SW(9);
		  

end architecture;