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
	 -- Output ports
	 Endereco         :  out std_logic_vector(DATA_WIDTH-1 downto 0);
	 
	 --testando proximo PC no WaveForms
	 inULAA      :  out std_logic_vector(DATA_WIDTH-1 downto 0);
	 inULAB      :  out std_logic_vector(DATA_WIDTH-1 downto 0);
	 outEscritaC      :  out std_logic_vector(DATA_WIDTH-1 downto 0);
	 outPC           :  out std_logic_vector(DATA_WIDTH-1 downto 0);
	 ulaop_out : out std_logic_vector(2 downto 0);
	 enderecoRAM_MEM : out std_logic_vector(DATA_WIDTH-1 downto 0);
	 habilitaEscritaRAM : out std_logic;
	 valorEscritoRAM_MEM : out std_logic_vector(DATA_WIDTH-1 downto 0)
	 
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
signal saidaMuxLUI : std_logic_vector(DATA_WIDTH-1 downto 0);
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

signal palavraControle : std_logic_vector(13 downto 0);
signal ULAop : std_logic_vector(2 downto 0);

signal ulaControle: std_logic_vector(2 downto 0);

signal imediatoLUI : std_logic_vector(DATA_WIDTH-1 downto 0);

constant entradaMORTA : std_logic_vector(DATA_WIDTH-1 downto 0) := b"00000000000000000000000000000000";

signal seletorJR : std_logic;

signal dadoLidoRAM : std_logic_vector(DATA_WIDTH-1 downto 0);


-- registradores PIPELINE
-- etapa 2
signal saidaregIFID : std_logic_vector(63 downto 0);
alias saidaPC4_IFID : std_logic_vector(31 downto 0) is saidaregIFID(63 downto 32);
alias saidaInstrucao : std_logic_vector(31 downto 0) is saidaregIFID(31 downto 0);

-- etapa 3
signal saidaregIDEX : std_logic_vector(150 downto 0);
alias saidaULAop : std_logic_vector(2 downto 0) is saidaregIDEX(150 downto 148);
alias saidaWBeM : std_logic_vector(4 downto 0) is saidaregIDEX(147 downto 143);
alias saidaSeletorBNE : std_logic is saidaregIDEX(142);
alias saidaSeletorBEQ : std_logic is saidaregIDEX(141);
alias saidaSeletormuxRtImed : std_logic is saidaregIDEX(140);
alias saidaSeletormuxRtRd : std_logic_vector(1 downto 0) is saidaregIDEX(139 downto 138);
alias saidaPC4_IDEX : std_logic_vector(31 downto 0) is saidaregIDEX(137 downto 106);
alias saidaData1 : std_logic_vector(31 downto 0) is saidaregIDEX(105 downto 74);
alias saidaData2_IDEX : std_logic_vector(31 downto 0) is saidaregIDEX(73 downto 42);
alias saidaSignExt : std_logic_vector(31 downto 0) is saidaregIDEX(41 downto 10);
alias saidaenderecoRt : std_logic_vector(4 downto 0) is saidaregIDEX(9 downto 5);
alias saidaenderecoRd : std_logic_vector(4 downto 0) is saidaregIDEX(4 downto 0);

alias JMP : std_logic_vector(1 DOWNTO 0) is palavraControle(13 downto 12);
alias ZeroImed : std_logic is palavraControle(11);
alias LUI : std_logic is palavraControle(10);

-- etapa 4
signal saidaregEXMEM : std_logic_vector(105 downto 0);
alias saidaWB : std_logic_vector(2 downto 0) is saidaregEXMEM(105 downto 103);
alias saidaSeletorhabEscritaMEM : std_logic is saidaregEXMEM(102);
alias saidaSeletorhabLeituraMEM : std_logic is saidaregEXMEM(101);
alias saidaPC4_EXMEM : std_logic_vector(31 downto 0) is saidaregEXMEM(100 downto 69);
alias saidaResultadoULA_EXMEM : std_logic_vector(31 downto 0) is saidaregEXMEM(68 downto 37);
alias saidaData2_EXMEM : std_logic_vector(31 downto 0) is saidaregEXMEM(36 downto 5);
alias saidaEnderecoR3_EXMEM : std_logic_vector(4 downto 0) is saidaregEXMEM(4 downto 0);


-- etapa 5
signal saidaregMEMWB : std_logic_vector(103 downto 0);
alias saidaSeletormuxULAMem : std_logic_vector(1 downto 0) is saidaregMEMWB(103 downto 102);
alias saidaSeletorescritaReg3 : std_logic is saidaregMEMWB(101);
alias saidaPC4_MEMWB : std_logic_vector(31 downto 0) is saidaregMEMWB(100 downto 69);
alias saidaDadoLido : std_logic_vector(31 downto 0) is saidaregMEMWB(68 downto 37);
alias saidaResultadoULA_MEMWB : std_logic_vector(31 downto 0) is saidaregMEMWB(36 downto 5);
alias saidaEnderecoR3_MEMWB : std_logic_vector(4 downto 0) is saidaregMEMWB(4 downto 0);


-- OPCODE
alias opCode: std_logic_vector(5 DOWNTO 0) is saidaInstrucao(31 downto 26);

-- INSTRUCAO TIPO R
alias enderecoRs: std_logic_vector(4 DOWNTO 0) is saidaInstrucao(25 downto 21);
alias enderecoRt: std_logic_vector(4 DOWNTO 0) is saidaInstrucao(20 downto 16);
alias enderecoRd: std_logic_vector(4 DOWNTO 0) is saidaInstrucao(15 downto 11);
alias shamt: std_logic_vector(4 DOWNTO 0) is saidaInstrucao(10 downto 6);
alias funct: std_logic_vector(5 DOWNTO 0) is saidaSignExt(5 downto 0);

-- INSTRUCAO TIPO I
alias imediato: std_logic_vector(15 DOWNTO 0) is saidaInstrucao(15 downto 0);

-- INSTRUCAO TIPO J
alias addressJMP: std_logic_vector(25 downto 0) is saidaInstrucao(25 downto 0);


begin

	-- Instruction Fetch

	PCIncremento : entity work.somaConstante  generic map (larguraDados => ROM_ADDR_WIDTH, constante => IncrementoPC)
        port map( entrada => saidaPC, saida => saidaSomaCtePC);

	PC : entity work.registradorGenerico   generic map (larguraDados => ROM_ADDR_WIDTH)
		port map (DIN => saidaMuxJMP, DOUT => saidaPC, ENABLE => '1', CLK => clk, RST => '0');
		
	muxJMP :  entity work.muxGenerico4x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saidaMuxBEQ, entradaB_MUX => concatJMP, entradaC_MUX => saidaData1, entradaD_MUX => entradaMORTA, seletor_MUX => JMP, saida_MUX => saidaMuxJMP);

	ROM : entity work.ROMMIPS   generic map (dataWidth => ROM_DATA_WIDTH, addrWidth => ROM_ADDR_WIDTH, memoryAddrWidth => 6)
		port map (Endereco => saidaPC, Dado => instrucao);

	regIFID : entity work.registradorGenerico   generic map (larguraDados => 64)
	    --                  63-32           31-0
		port map (DIN => saidaSomaCtePC & instrucao, 
				  DOUT => saidaregIFID, 
				  ENABLE => '1', 
				  CLK => clk, 
				  RST => '0');
	
	-- Instruction Decode

	concatJMP <= saidaSomaCtePC(31 downto 28) & addressJMP & b"00";

	UC_FD : entity work.UnidadeControleFD port map( clk => clk, opCode => opCode, entradaJR => seletorJR, palavraControle => palavraControle, ULAop => ULAop);

	bancoReg : entity work.bancoRegistradores   generic map (larguraDados => DATA_WIDTH, larguraEndBancoRegs => 5)
          port map ( clk => clk,
              enderecoA => enderecoRs,
              enderecoB => enderecoRt,
              enderecoC => saidaEnderecoR3_MEMWB,
              dadoEscritaC => saidaMuxULABanco,
              escreveC => saidaSeletorescritaReg3,
              saidaA => RB,
			  saidaB  => RC);
			  
	estendeSinal : entity work.estendeSinalGenerico   generic map (larguraDadoEntrada => 16, larguraDadoSaida => 32)
		port map (estendeSinal_IN => imediato, seletorZeroImed => ZeroImed, estendeSinal_OUT =>  imediatoExt);

	imediatoLUI <= imediato & b"0000000000000000";
			 
	muxLUI : entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
		port map( entradaA_MUX => imediatoExt, entradaB_MUX => imediatoLUI, seletor_MUX => LUI, saida_MUX => saidaMuxLUI);
		
	regIDEX : entity work.registradorGenerico   generic map (larguraDados => 151)
	    --              150-148                147-138            137-106     105-74    73-42     41-10           9-5          4-0     
		port map (DIN => ULAop & palavraControle(9 downto 0) & saidaPC4_IFID & RB   &   RC    & saidaMuxLUI & enderecoRt & enderecoRd, 
				  DOUT => saidaregIDEX, 
				  ENABLE => '1', 
				  CLK => clk, 
				  RST => '0');
		
	
	-- Execute

	shiftBEQ <= saidaSignExt(29 DOWNTO 0) & b"00";

	saidaSomaCteShift <= std_logic_vector(unsigned(shiftBEQ) + unsigned(saidaPC4_IDEX));

	ULA : entity work.ULA  generic map(larguraDados => DATA_WIDTH)
          port map (entradaA => saidaData1, entradaB => saidaMuxBancoULA, seletor => ulaControle, saida => saidaULA, flagZero => sigFlagZero);

	muxBancoULA :  entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saidaData2_IDEX, entradaB_MUX => saidaSignExt, seletor_MUX => saidaSeletormuxRtImed, saida_MUX => saidaMuxBancoULA);

	ucULA : entity work.UnidadeControleULA
		port map( ulaOp   => saidaULAop, 
                funct   => funct,
                ulaCtrl => ulaControle,
					 saidaJR => seletorJR);

	muxRomBanco :  entity work.muxGenerico4x1  generic map (larguraDados => 5)
		port map( entradaA_MUX => saidaenderecoRt, entradaB_MUX => saidaenderecoRd, entradaC_MUX => b"11111", entradaD_MUX => entradaMORTA(31 downto 27), seletor_MUX => saidaSeletormuxRtRd, saida_MUX => saidaMuxRomBanco);

	andE <= (sigFlagZero AND saidaSeletorBEQ) OR (saidaSeletorBNE AND NOT(sigFlagZero));

	muxBEQ :  entity work.muxGenerico2x1  generic map (larguraDados => DATA_WIDTH)
		port map( entradaA_MUX => saidaSomaCtePC, entradaB_MUX => saidaSomaCteShift, seletor_MUX => andE, saida_MUX => saidaMuxBEQ);
	
	regEXMEM : entity work.registradorGenerico   generic map (larguraDados => 106)
	    --                105-101      100-69         68-37        36-5                 4-0     
		port map (DIN => saidaWBeM & saidaPC4_IDEX & saidaULA & saidaData2_IDEX & saidaMuxRomBanco, 
				  DOUT => saidaregEXMEM, 
				  ENABLE => '1', 
				  CLK => clk, 
				  RST => '0');
	
	-- Memory Access

	RAM : entity work.RAMMIPS  generic map (dataWidth => DATA_WIDTH, addrWidth => DATA_WIDTH, memoryAddrWidth => 6)
          port map (clk => clk, Endereco => saidaResultadoULA_EXMEM, Dado_in => saidaData2_EXMEM, Dado_out => dadoLidoRAM, wr => saidaSeletorhabEscritaMEM, rd => saidaSeletorhabLeituraMEM );
		  
	regMEMWB : entity work.registradorGenerico   generic map (larguraDados => 104)
		--                103-101     100-69           68-37            36-5                    4-0
		port map (DIN => saidaWB & saidaPC4_EXMEM & dadoLidoRAM & saidaResultadoULA_EXMEM & saidaEnderecoR3_EXMEM, 
				DOUT => saidaregMEMWB, 
				ENABLE => '1', 
				CLK => clk, 
				RST => '0');

	
	-- Write Back				  
	
	muxULABanco :  entity work.muxGenerico4x1  generic map (larguraDados => DATA_WIDTH)
        port map( entradaA_MUX => saidaResultadoULA_MEMWB, entradaB_MUX => saidaDadoLido, entradaC_MUX => saidaPC4_MEMWB, entradaD_MUX => entradaMORTA, seletor_MUX => saidaSeletormuxULAMem, saida_MUX => saidaMuxULABanco);
		  

	-- RESTO				 
	-- para fins de teste apenas
	Endereco <= saidaULA;
	outPC <= saidaPC;
	outEscritaC <= saidaMuxULABanco;
	enderecoRAM_MEM <= saidaResultadoULA_EXMEM;
	habilitaEscritaRAM <= saidaSeletorhabEscritaMEM;
	valorEscritoRAM_MEM <= saidaData2_EXMEM;
	inULAA <= saidaData1;
	inULAB <= saidaMuxBancoULA;
	ulaop_out <= saidaULAop;
end architecture;