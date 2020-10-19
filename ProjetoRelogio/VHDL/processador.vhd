library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processador is
  generic   (
	 DATA_WIDTH  : natural :=  8;
	 ROM_DATA_WIDTH  : natural :=  32;
    ROM_ADDR_WIDTH  : natural :=  16;
	 IncrementoPC 		: natural := 1
    
  );

  port   (
    -- Input ports
    clk     		   :  in  std_logic;
	 EntradaDados		:  in  std_logic_vector(DATA_WIDTH-1 downto 0);
	 SaidaDados       :  out std_logic_vector(DATA_WIDTH-1 downto 0);
	 habLeitura       :  out std_logic;
	 habEscrita       :  out std_logic;
	 barramentoEnd	   :  out std_logic_vector(15 downto 0)
  
		
    );
end entity;
architecture arch_name of processador is

signal saidaMuxProxPC : std_logic_vector(ROM_ADDR_WIDTH-1 downto 0);
signal saidaSomaConstante : std_logic_vector(ROM_ADDR_WIDTH-1 downto 0);
signal saidaPC : std_logic_vector(ROM_ADDR_WIDTH-1 downto 0);
signal instrucao : std_logic_vector(31 downto 0);
signal MuxJump : std_logic;
signal saidaFlipFlop : std_logic;
signal sigFlagIgual : std_logic;
signal dadoEscrita : std_logic_vector(DATA_WIDTH-1 downto 0);
signal RA : std_logic_vector(DATA_WIDTH-1 downto 0);
signal RB : std_logic_vector(DATA_WIDTH-1 downto 0);
signal RC : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaULA : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saida : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaMuxRam : std_logic_vector(DATA_WIDTH-1 downto 0);
signal saidaMuxULA : std_logic_vector(DATA_WIDTH-1 downto 0);
signal palavraControle : std_logic_vector(10 downto 0);



alias je : std_logic is palavraControle(10);
alias jmp : std_logic is palavraControle(9);
alias muxImedUla : std_logic is palavraControle(8);
alias muxImedRam : std_logic is palavraControle(7);
alias operacao : std_logic_vector(2 downto 0) is palavraControle(6 downto 4);
alias habEscritaReg : std_logic is palavraControle(3);
alias habLeituraMem : std_logic is palavraControle(2);
alias habEscritaMem : std_logic is palavraControle(1);
alias habilitaFlip : std_logic is palavraControle(0);

alias opCode: std_logic_vector(3 DOWNTO 0) is Instrucao(31 downto 28);
alias enderecoRegA: std_logic_vector(3 DOWNTO 0) is instrucao(27 downto 24);
alias enderecoRegB: std_logic_vector(3 DOWNTO 0) is instrucao(23 downto 20);
alias enderecoRegC: std_logic_vector(3 DOWNTO 0) is instrucao(19 downto 16);
alias imediato: std_logic_vector(15 DOWNTO 0) is instrucao(15 downto 0);
alias imediatoValor: std_logic_vector(DATA_WIDTH-1 DOWNTO 0) is instrucao(DATA_WIDTH-1 downto 0);

	
  
begin

	MuxJump <= jmp OR (je AND saidaFlipFlop);

	flipflop : entity work.flipflop   
          port map (DIN => sigFlagIgual, DOUT => saidaFlipFlop, ENABLE => habilitaFlip, CLK => clk, RST => '0');
	
	somaConstante : entity work.somaConstante  generic map (larguraDados => ROM_ADDR_WIDTH, constante => IncrementoPC)
        port map( entrada => saidaPC, saida => saidaSomaConstante);

	muxProxPC :  entity work.muxGenerico2x1  generic map (larguraDados => ROM_ADDR_WIDTH)
        port map( entradaA_MUX => saidaSomaConstante, entradaB_MUX => imediato, seletor_MUX => MuxJump, saida_MUX => saidaMuxProxPC);

	PC : entity work.registradorGenerico   generic map (larguraDados => ROM_ADDR_WIDTH)
        port map (DIN => saidaMuxProxPC, DOUT => saidaPC, ENABLE => '1', CLK => clk, RST => '0');

	ROM : entity work.memoriaROM   generic map (dataWidth => ROM_DATA_WIDTH, addrWidth => ROM_ADDR_WIDTH)
          port map (Endereco => saidaPC, Dado => instrucao);
			 
	bancoReg : entity work.bancoRegistradoresArqRegReg   generic map (larguraDados => 8, larguraEndBancoRegs => 4)
          port map ( clk => clk,
              enderecoA => enderecoRegA,
              enderecoB => enderecoRegB,
              enderecoC => enderecoRegC,
              dadoEscritaC => dadoEscrita,
              escreveC => habEscritaReg,
              saidaA => RA,
              saidaB  => RB);
					  
	ULA : entity work.ULA  generic map(larguraDados => 8)
          port map (entradaA => RA, entradaB =>  RB, saida => saidaULA, seletor => operacao, flagIgual => sigFlagIgual);
			 
	muxImediatoRam :  entity work.muxGenerico2x1  generic map (larguraDados => 8)
        port map( entradaA_MUX => EntradaDados, entradaB_MUX => imediatoValor, seletor_MUX => muxImedRam, saida_MUX => saidaMuxRam);
		  
   muxULAImediatoRam :  entity work.muxGenerico2x1  generic map (larguraDados => 8)
   port map( entradaA_MUX => saidaMuxRam, entradaB_MUX => saidaULA, seletor_MUX => muxImedUla	, saida_MUX => dadoEscrita);

	UC : entity work.Unidade_Controle port map( clk => clk, opCode => opCode,  palavraControle => palavraControle);
	
	SaidaDados <= RA;
	barramentoEnd   <= imediato;
	habLeitura <= habLeituraMem;
	habEscrita <= habEscritaMem;
 	
end architecture;