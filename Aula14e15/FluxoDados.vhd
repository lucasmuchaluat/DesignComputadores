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
    clk     		   :  in  std_logic;
	 DadoLido		   :  in  std_logic_vector(DATA_WIDTH-1 downto 0);
	 -- Output ports
	 Endereco         :  out std_logic_vector(DATA_WIDTH-1 downto 0);
	 DadoEscrito      :  out std_logic_vector(DATA_WIDTH-1 downto 0);
	 habLeitura       :  out std_logic;
    habEscrita       :  out std_logic;
	 
	 
	 --testando proximo PC no WaveForms
	 proxPC           :  out std_logic_vector(DATA_WIDTH-1 downto 0)
	 
    );
end entity;

architecture arch_name of FluxoDados is

signal saidaSomaCtePC : std_logic_vector(ROM_ADDR_WIDTH-1 downto 0);
signal saidaSomaCteShift : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaMuxRomBanco : std_logic_vector(4 downto 0);
signal saidaMuxBancoULA : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaMuxULABanco : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaMuxBEQ : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaMuxJMP : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaPC : std_logic_vector(ROM_ADDR_WIDTH-1 downto 0);
signal imediatoExt : std_logic_vector(DATA_WIDTH-1 downto 0);
signal sigFlagZero : std_logic;
signal andE : std_logic;
signal shiftBEQ : std_logic_vector(DATA_WIDTH-1 downto 0);
signal concatJMP : std_logic_vector(DATA_WIDTH-1 downto 0);
signal instrucao : std_logic_vector(DATA_WIDTH-1 downto 0);
signal RB : std_logic_vector(DATA_WIDTH-1 downto 0);
signal RC : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaULA : std_logic_vector(DATA_WIDTH-1 downto 0);

signal palavraControle : std_logic_vector(10 downto 0);

-- aliases pontos de controle
alias JMP : std_logic is palavraControle(10);
alias habEscritaMEM : std_logic is palavraControle(9);
alias habLeituraMEM : std_logic is palavraControle(8);
alias BEQ : std_logic is palavraControle(7);
alias muxULAMem : std_logic is palavraControle(6);
alias operacao : std_logic_vector(2 downto 0) is palavraControle(5 downto 3);
alias muxRtImed : std_logic is palavraControle(2);
alias escritaReg3 : std_logic is palavraControle(1);
alias muxRtRd : std_logic is palavraControle(0);


-- OPCODE
alias opCode: std_logic_vector(5 DOWNTO 0) is instrucao(31 downto 26);

-- INSTRUCAO TIPO R
alias enderecoRs: std_logic_vector(4 DOWNTO 0) is instrucao(25 downto 21);
alias enderecoRt: std_logic_vector(4 DOWNTO 0) is instrucao(20 downto 16);
alias enderecoRd: std_logic_vector(4 DOWNTO 0) is instrucao(15 downto 11);
alias shamt: std_logic_vector(4 DOWNTO 0) is instrucao(10 downto 6);
alias funct: std_logic_vector(5 DOWNTO 0) is instrucao(5 downto 0);

-- INSTRUCAO TIPO I
alias imediato: std_logic_vector(15 DOWNTO 0) is instrucao(15 downto 0);

-- INSTRUCAO TIPO J
alias addressJMP: std_logic_vector(25 downto 0) is instrucao(25 downto 0);

	
  
begin
	
	PCIncremento : entity work.somaConstante  generic map (larguraDados => ROM_ADDR_WIDTH, constante => IncrementoPC)
        port map( entrada => saidaPC, saida => saidaSomaCtePC);

	PC : entity work.registradorGenerico   generic map (larguraDados => ROM_ADDR_WIDTH)
        port map (DIN => saidaMuxJMP, DOUT => saidaPC, ENABLE => '1', CLK => clk, RST => '0');

	ROM : entity work.ROMMIPS   generic map (dataWidth => ROM_DATA_WIDTH, addrWidth => ROM_ADDR_WIDTH, memoryAddrWidth => 6)
          port map (Endereco => saidaPC, Dado => instrucao);
			 
	muxRomBanco :  entity work.muxGenerico2x1  generic map (larguraDados => 5)
        port map( entradaA_MUX => enderecoRt, entradaB_MUX => enderecoRd, seletor_MUX => muxRtRd, saida_MUX => saidaMuxRomBanco);
	
	bancoReg : entity work.bancoRegistradores   generic map (larguraDados => DATA_WIDTH, larguraEndBancoRegs => 5)
          port map ( clk => clk,
              enderecoA => enderecoRs,
              enderecoB => enderecoRt,
              enderecoC => saidaMuxRomBanco,
              dadoEscritaC => saidaMuxULABanco,
              escreveC => escritaReg3,
              saidaA => RB,
              saidaB  => RC);
				  
	estendeSinal : entity work.estendeSinalGenerico   generic map (larguraDadoEntrada => 16, larguraDadoSaida => 32)
          port map (estendeSinal_IN => imediato, estendeSinal_OUT =>  imediatoExt);
				  
	muxBancoULA :  entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => RC, entradaB_MUX => imediatoExt, seletor_MUX => muxRtImed, saida_MUX => saidaMuxBancoULA);
					  
	ULA : entity work.ULA  generic map(larguraDados => DATA_WIDTH)
          port map (entradaA => RB, entradaB => saidaMuxBancoULA, seletor => operacao, saida => saidaULA, flagZero => sigFlagZero);
	
	muxULABanco :  entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saidaULA, entradaB_MUX => DadoLido, seletor_MUX => muxULAMem, saida_MUX => saidaMuxULABanco);
		  
	andE <= sigFlagZero AND BEQ;
	
	shiftBEQ <= imediatoExt(29 DOWNTO 0) & b"00";
	
	saidaSomaCteShift <= std_logic_vector(unsigned(shiftBEQ) + unsigned(saidaSomaCtePC));
	
	muxBEQ :  entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saidaSomaCtePC, entradaB_MUX => saidaSomaCteShift, seletor_MUX => JMP, saida_MUX => saidaMuxBEQ);
		  
	
	concatJMP <= saidaSomaCtePC(31 downto 28) & addressJMP & b"00";
	
	muxJMP :  entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saidaMuxBEQ, entradaB_MUX => concatJMP, seletor_MUX => andE, saida_MUX => saidaMuxJMP);
			 
	UC : entity work.UnidadeControle port map( clk => clk, opCode => opCode, funct => funct, palavraControle => palavraControle);
 	
	Endereco <= saidaULA;
	DadoEscrito <= RC;
	habLeitura <= habLeituraMEM;
	habEscrita <= habEscritaMEM;
	
	-- para fins de teste apenas
	proxPC <= saidaPC;
	
end architecture;