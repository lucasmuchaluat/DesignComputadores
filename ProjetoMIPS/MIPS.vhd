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
	 OUTEndereco    : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 outPC          : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 testeSaidaMux  : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 inULAA : out std_logic_vector(DATA_WIDTH-1 downto 0);
   inULAB : out std_logic_vector(DATA_WIDTH-1 downto 0);
   ulaop_out : out std_logic_vector(2 downto 0);
   enderecoRAM_MEM : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 habilitaEscritaRAM : out std_logic;
	 valorEscritoRAM_MEM : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end entity;

architecture arch_name of MIPS is
  signal  endereco: std_logic_vector(DATA_WIDTH-1 downto 0);

  signal  PC: std_logic_vector(DATA_WIDTH-1 downto 0);
  
   
begin

  FD : entity work.FluxoDados
    port map(
      clk => CLOCK_50, Endereco => endereco, outPC => PC, outEscritaC => testeSaidaMux, inULAA => inULAA, inULAB => inULAB, ulaop_out => ulaop_out, enderecoRAM_MEM => enderecoRAM_MEM, habilitaEscritaRAM => habilitaEscritaRAM, valorEscritoRAM_MEM => valorEscritoRAM_MEM );

  -- Waveforms
  OUTEndereco <= endereco;
  outPC <= PC;
  

END ARCHITECTURE;