library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MIPS is
  generic   (
	 DATA_WIDTH  : natural :=  32;
	 ROM_DATA_WIDTH  : natural :=  32;
    ROM_ADDR_WIDTH  : natural :=  32;
	 IncrementoPC 		: natural := 4
    
  );

  port   (
    -- Input ports
    CLOCK_50     		:  in  std_logic;
	 -- Output ports
--	 OUTEndereco    : out std_logic_vector(DATA_WIDTH-1 downto 0);
--	 outPC          : out std_logic_vector(DATA_WIDTH-1 downto 0);
--	 testeSaidaMux  : out std_logic_vector(DATA_WIDTH-1 downto 0);
--	 inULAA : out std_logic_vector(DATA_WIDTH-1 downto 0);
--   inULAB : out std_logic_vector(DATA_WIDTH-1 downto 0);
--   ulaop_out : out std_logic_vector(2 downto 0);
--   enderecoRAM_MEM : out std_logic_vector(DATA_WIDTH-1 downto 0);
--	 habilitaEscritaRAM : out std_logic;
--	 valorEscritoRAM_MEM : out std_logic_vector(DATA_WIDTH-1 downto 0)
--	 
	 -- PLACA
	 SW       : in std_logic_vector(1 downto 0);
	 KEY      : in std_logic_vector(3 downto 0);
	 HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(6 downto 0)
    );
end entity;

architecture arch_name of MIPS is
  signal  endereco: std_logic_vector(DATA_WIDTH-1 downto 0);

  signal  PC: std_logic_vector(DATA_WIDTH-1 downto 0);
  
  --PLACA
  signal displayShow : std_logic_vector(23 downto 0);
  signal clkReset : std_logic;
  signal testeSaidaMux : std_logic_vector (DATA_WIDTH-1 downto 0);
  signal enderecoRAM_MEM : std_logic_vector (DATA_WIDTH-1 downto 0);
  signal inULAA : std_logic_vector (DATA_WIDTH-1 downto 0);
  signal inULAB : std_logic_vector (DATA_WIDTH-1 downto 0);
  signal ulaop_out : std_logic_vector (2 downto 0);
  signal habilitaEscritaRAM : std_logic;
  signal valorEscritoRAM_MEM : std_logic_vector (DATA_WIDTH-1 downto 0);
  
  
   
begin

  FD : entity work.FluxoDados
    port map(
      clk => clkReset, Endereco => endereco, outPC => PC, outEscritaC => testeSaidaMux, inULAA => inULAA, inULAB => inULAB, ulaop_out => ulaop_out, enderecoRAM_MEM => enderecoRAM_MEM, habilitaEscritaRAM => habilitaEscritaRAM, valorEscritoRAM_MEM => valorEscritoRAM_MEM );

  -- Waveforms
--  OUTEndereco <= endereco;
--  outPC <= PC;
  
  --PLACA
  
  displayShow <= PC(23 downto 0) when SW = "00" else
					  endereco(23 downto 0) when SW = "01" else
					  testeSaidaMux(23 downto 0) when SW = "10" else
					  enderecoRAM_MEM(23 downto 0);
  
  
  detectorSub0: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => clkReset);
  
  DISPLAY0 : entity work.conversorHex7Seg
    port map
    (
      dadoHex   => displayShow(3 downto 0),
      apaga     => '0',
		negativo  => '0',
		overFlow  => '0',
		saida7seg => HEX0
    );

 
  DISPLAY1 : entity work.conversorHex7Seg
    port map
    (
      dadoHex   => displayShow(7 downto 4),
      apaga     => '0',
		negativo  => '0',
		overFlow  => '0',
      saida7seg => HEX1
    );
 
  DISPLAY2 : ENTITY work.conversorHex7Seg
    PORT MAP
    (
      dadoHex   => displayShow(11 downto 8),
      apaga     => '0',
		negativo  => '0',
		overFlow  => '0',
      saida7seg => HEX2
    );
  
  DISPLAY3 : entity work.conversorHex7Seg
    port map
    (
      dadoHex   => displayShow(15 downto 12),
      apaga     => '0',
		negativo  => '0',
		overFlow  => '0',
      saida7seg => HEX3
    );
  
  DISPLAY4 : entity work.conversorHex7Seg
    port map
    (
      dadoHex   => displayShow(19 downto 16),
      apaga     => '0',
		negativo  => '0',
		overFlow  => '0',
      saida7seg => HEX4
    );
  
  DISPLAY5 : entity work.conversorHex7Seg
    port map
    (
      dadoHex   => displayShow(23 downto 20),
      apaga     => '0',
		negativo  => '0',
		overFlow  => '0',
      saida7seg => HEX5
    );

END ARCHITECTURE;