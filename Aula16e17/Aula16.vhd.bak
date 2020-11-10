library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Aula16 is
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
	 OUTEndereco    : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 outPC          : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 outDadoLido    : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 outDadoEscrito : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 testeSaidaMux  : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end entity;

architecture arch_name of Aula16 is
  signal  endereco: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal  dadoLido: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal  dadoEscrito: std_logic_vector(DATA_WIDTH-1 downto 0);
  
  signal  habilitaLeitura: std_logic;
  signal  habilitaEscrita: std_logic;

  signal  proximoPC: std_logic_vector(DATA_WIDTH-1 downto 0);
  
   
begin

  FD : entity work.FluxoDados
    port map(
      clk => CLOCK_50, DadoLido => dadoLido, Endereco => endereco, DadoEscrito => dadoEscrito, habLeitura => habilitaLeitura, habEscrita => habilitaEscrita, proxPC => proximoPC, outMuxBEQ => testeSaidaMux );
	 
  RAM : entity work.RAMMIPS  generic map (dataWidth => DATA_WIDTH, addrWidth => DATA_WIDTH, memoryAddrWidth => 6)
          port map (clk => CLOCK_50, Endereco => endereco, Dado_in => dadoEscrito, Dado_out => dadoLido, wr => habilitaEscrita, rd => habilitaLeitura );

  -- Waveforms
  OUTEndereco <= endereco;
  outPC <= proximoPC;
  outDadoLido <= dadoLido;
  outDadoEscrito <= dadoEscrito;
  

END ARCHITECTURE;