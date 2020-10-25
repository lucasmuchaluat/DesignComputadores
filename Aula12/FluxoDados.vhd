library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FluxoDados is
  generic   (
	 DATA_WIDTH  : natural :=  32;
	 ROM_DATA_WIDTH  : natural :=  32;
    ROM_ADDR_WIDTH  : natural :=  32;
	 IncrementoPC 		: natural := 4
    
  );

  port   (
    -- Input ports
    CLOCK_50     		:  in  std_logic
    );
end entity;

architecture arch_name of FluxoDados is

signal saidaSomaConstante : std_logic_vector(ROM_ADDR_WIDTH-1 downto 0);
signal saidaPC : std_logic_vector(ROM_ADDR_WIDTH-1 downto 0);
signal instrucao : std_logic_vector(31 downto 0);
signal RB : std_logic_vector(DATA_WIDTH-1 downto 0);
signal RC : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaULA : std_logic_vector(DATA_WIDTH-1 downto 0);

signal palavraControle : std_logic_vector(1 downto 0);

alias operacao : std_logic is palavraControle(1);
alias escritaReg3 : std_logic is palavraControle(0);

alias opCode: std_logic_vector(5 DOWNTO 0) is instrucao(31 downto 26);
alias enderecoRs: std_logic_vector(4 DOWNTO 0) is instrucao(25 downto 21);
alias enderecoRt: std_logic_vector(4 DOWNTO 0) is instrucao(20 downto 16);
alias enderecoRd: std_logic_vector(4 DOWNTO 0) is instrucao(15 downto 11);
alias shamt: std_logic_vector(4 DOWNTO 0) is instrucao(10 downto 6);
alias funct: std_logic_vector(5 DOWNTO 0) is instrucao(5 downto 0);

	
  
begin
	
	PCIncremento : entity work.somaConstante  generic map (larguraDados => ROM_ADDR_WIDTH, constante => IncrementoPC)
        port map( entrada => saidaPC, saida => saidaSomaConstante);

	PC : entity work.registradorGenerico   generic map (larguraDados => ROM_ADDR_WIDTH)
        port map (DIN => saidaSomaConstante, DOUT => saidaPC, ENABLE => '1', CLK => CLOCK_50, RST => '0');

	ROM : entity work.ROMMIPS   generic map (dataWidth => ROM_DATA_WIDTH, addrWidth => ROM_ADDR_WIDTH, memoryAddrWidth => 6)
          port map (Endereco => saidaPC, Dado => instrucao);
			 
	bancoReg : entity work.bancoRegistradores   generic map (larguraDados => DATA_WIDTH, larguraEndBancoRegs => 5)
          port map ( clk => CLOCK_50,
              enderecoA => enderecoRs,
              enderecoB => enderecoRt,
              enderecoC => enderecoRd,
              dadoEscritaC => saidaULA,
              escreveC => escritaReg3,
              saidaA => RB,
              saidaB  => RC);
					  
	ULA : entity work.ULA  generic map(larguraDados => DATA_WIDTH)
          port map (entradaA => RB, entradaB =>  RC, operacao => operacao, saida => saidaULA);
			 
	UC : entity work.UnidadeControle port map( clk => CLOCK_50, opCode => opCode, funct => funct, palavraControle => palavraControle);
 	
end architecture;