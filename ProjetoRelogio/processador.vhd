library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processador is
  generic   (
    DATA_WIDTH  : natural :=  16;
    ADDR_WIDTH  : natural :=  12
  );

  port   (
    -- Input ports
    clk  : in  std_logic;
    dataIn : in std_logic_vector(DATA_WIDTH - 1 DOWNTO 0);
    -- Output ports
    dadoDsp     : out std_logic_vector(3 DOWNTO 0);
    load        : out std_logic;
    store       : out std_logic;
    outToDecode : out std_logic_vector(DATA_WIDTH - 1 DOWNTO 0)
  );
end entity;


architecture arch_name of processador is
	 signal toDecode        : std_logic_vector(DATA_WIDTH - 1 DOWNTO 0);
    signal saidaBancoReg   : std_logic_vector(DATA_WIDTH - 1 DOWNTO 0);
    signal palavraControle : std_logic_vector(9 DOWNTO 0);
    signal opCode          : std_logic_vector(2 DOWNTO 0);
  
begin
  -- Para instanciar, a atribuição de sinais (e generics) segue a ordem: (nomeSinalArquivoDefinicaoComponente => nomeSinalNesteArquivo)
	 FD : ENTITY work.fluxoDados
        PORT MAP(
            clk             => clk,
            dataIN          => dataIN,
            palavraControle => palavraControle(9 DOWNTO 2), -- nao precisamos passar o habilita leitura e escrita, eles sao usados no decodificador
            opCode          => opCode, -- opCode que veio da ROM, sera interpretado pela UC
            toDecode        => toDecode, -- endereco para o decodificador
            dataOUT         => saidaBancoReg -- saida com 8 bits... Necessitamos apenas 4 para os displays
        );

    UC : ENTITY work.Unidade_Controle
        PORT MAP(
            palavraControle => palavraControle,
            opCode          => opCode,
            clk             => clk
        );

    load        <= palavraControle(1); -- usado no top_level, no decodificador
    store       <= palavraControle(0); -- usado no top_level, no decodificador
    dadoDsp     <= saidaBancoReg(3 DOWNTO 0); 
    outToDecode <= toDecode; 

end architecture;