library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.constantesMIPS.all;

entity ULA32bits is

  port   (
	-- Input ports
	entradaA     : in std_logic_vector(31 downto 0);
	entradaB     : in std_logic_vector(31 downto 0);
	operacaoULA  : in std_logic_vector(2 downto 0);
	-- Output ports
	overflow_final : out std_logic;
	resultadoULA : out std_logic_vector(31 downto 0)
	 
    );
end entity;

architecture arch_name of ULA32bits is

  signal  carryIN_inicial : std_logic; 
  signal  vaiUM_final : std_logic_vector(31 downto 0);
  signal  overflow_vetor : std_logic_vector(31 downto 0);
  signal  set_final   : std_logic_vector(31 downto 0);
  
  alias  Binvert : std_logic is operacaoULA(2); -- '1' when operacaoULA = execSubULA else '0'
  alias  ULActrl : std_logic_vector(1 downto 0) is operacaoULA(1 downto 0);

begin
  
  carryIN_inicial <= Binvert;

  ula0 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(0),
			  entradaB          => entradaB(0),
			  entradaLess       => set_final(31),
			  seletorInverteB   => Binvert,
			  vemUM             => carryIN_inicial,
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(0),
			  saidaOverflow     => overflow_vetor(0),
			  saidaSet          => set_final(0),
			  saidaResultado    => resultadoULA(0)
	);

   ula1 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(1),
			  entradaB          => entradaB(1),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(0),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(1),
			  saidaOverflow     => overflow_vetor(1),			  
			  saidaSet          => set_final(1),
			  saidaResultado    => resultadoULA(1)
	);

	ula2 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(2),
			  entradaB          => entradaB(2),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(1),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(2),
			  saidaOverflow     => overflow_vetor(2),			  
			  saidaSet          => set_final(2),
			  saidaResultado    => resultadoULA(2)
	);

	ula3 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(3),
			  entradaB          => entradaB(3),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(2),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(3),
			  saidaOverflow     => overflow_vetor(3),			  
			  saidaSet          => set_final(3),
			  saidaResultado    => resultadoULA(3)
	);

	ula4 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(4),
			  entradaB          => entradaB(4),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(3),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(4),
			  saidaOverflow     => overflow_vetor(4),			  
			  saidaSet          => set_final(4),
			  saidaResultado    => resultadoULA(4)
	);

	ula5 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(5),
			  entradaB          => entradaB(5),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(4),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(5),
			  saidaOverflow     => overflow_vetor(5),			  
			  saidaSet          => set_final(5),
			  saidaResultado    => resultadoULA(5)
	);

	ula6 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(6),
			  entradaB          => entradaB(6),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(5),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(6),
			  saidaOverflow     => overflow_vetor(6),			  
			  saidaSet          => set_final(6),
			  saidaResultado    => resultadoULA(6)
	);

	ula7 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(7),
			  entradaB          => entradaB(7),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(6),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(7),
			  saidaOverflow     => overflow_vetor(7),			  
			  saidaSet          => set_final(7),
			  saidaResultado    => resultadoULA(7)
	);

	ula8 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(8),
			  entradaB          => entradaB(8),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(7),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(8),
			  saidaOverflow     => overflow_vetor(8),			  
			  saidaSet          => set_final(8),
			  saidaResultado    => resultadoULA(8)
	);

	ula9 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(9),
			  entradaB          => entradaB(9),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(8),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(9),
			  saidaOverflow     => overflow_vetor(9),			  
			  saidaSet          => set_final(9),
			  saidaResultado    => resultadoULA(9)
	);

	ula10 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(10),
			  entradaB          => entradaB(10),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(9),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(10),
			  saidaOverflow     => overflow_vetor(10),
			  saidaSet          => set_final(10),
			  saidaResultado    => resultadoULA(10)
	);

	ula11 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(11),
			  entradaB          => entradaB(11),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(10),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(11),
			  saidaOverflow     => overflow_vetor(11),
			  saidaSet          => set_final(11),
			  saidaResultado    => resultadoULA(11)
	);

	ula12 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(12),
			  entradaB          => entradaB(12),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(11),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(12),
			  saidaOverflow     => overflow_vetor(12),
			  saidaSet          => set_final(12),
			  saidaResultado    => resultadoULA(12)
	);

	ula13 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(13),
			  entradaB          => entradaB(13),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(12),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(13),
			  saidaOverflow     => overflow_vetor(13),
			  saidaSet          => set_final(13),
			  saidaResultado    => resultadoULA(13)
	);

	ula14 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(14),
			  entradaB          => entradaB(14),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(13),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(14),
			  saidaOverflow     => overflow_vetor(14),
			  saidaSet          => set_final(14),
			  saidaResultado    => resultadoULA(14)
	);

	ula15 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(15),
			  entradaB          => entradaB(15),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(14),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(15),
			  saidaOverflow     => overflow_vetor(15),
			  saidaSet          => set_final(15),
			  saidaResultado    => resultadoULA(15)
	);

	ula16 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(16),
			  entradaB          => entradaB(16),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(15),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(16),
			  saidaOverflow     => overflow_vetor(16),
			  saidaSet          => set_final(16),
			  saidaResultado    => resultadoULA(16)
	);

	ula17 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(17),
			  entradaB          => entradaB(17),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(16),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(17),
			  saidaOverflow     => overflow_vetor(17),
			  saidaSet          => set_final(17),
			  saidaResultado    => resultadoULA(17)
	);

	ula18 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(18),
			  entradaB          => entradaB(18),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(17),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(18),
			  saidaOverflow     => overflow_vetor(18),
			  saidaSet          => set_final(18),
			  saidaResultado    => resultadoULA(18)
	);

	ula19 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(19),
			  entradaB          => entradaB(19),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(18),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(19),
			  saidaOverflow     => overflow_vetor(19),
			  saidaSet          => set_final(19),
			  saidaResultado    => resultadoULA(19)
	);

	ula20 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(20),
			  entradaB          => entradaB(20),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(19),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(20),
			  saidaOverflow     => overflow_vetor(20),
			  saidaSet          => set_final(20),
			  saidaResultado    => resultadoULA(20)
	);

	ula21 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(21),
			  entradaB          => entradaB(21),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(20),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(21),
			  saidaOverflow     => overflow_vetor(21),
			  saidaSet          => set_final(21),
			  saidaResultado    => resultadoULA(21)
	);

	ula22 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(22),
			  entradaB          => entradaB(22),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(21),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(22),
			  saidaOverflow     => overflow_vetor(22),
			  saidaSet          => set_final(22),
			  saidaResultado    => resultadoULA(22)
	);

	ula23 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(23),
			  entradaB          => entradaB(23),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(22),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(23),
			  saidaOverflow     => overflow_vetor(23),
			  saidaSet          => set_final(23),
			  saidaResultado    => resultadoULA(23)
	);

	ula24 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(24),
			  entradaB          => entradaB(24),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(23),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(24),
			  saidaOverflow     => overflow_vetor(24),
			  saidaSet          => set_final(24),
			  saidaResultado    => resultadoULA(24)
	);

	ula25 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(25),
			  entradaB          => entradaB(25),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(24),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(25),
			  saidaOverflow     => overflow_vetor(25),
			  saidaSet          => set_final(25),
			  saidaResultado    => resultadoULA(25)
	);

	ula26 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(26),
			  entradaB          => entradaB(26),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(25),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(26),
			  saidaOverflow     => overflow_vetor(26),
			  saidaSet          => set_final(26),
			  saidaResultado    => resultadoULA(26)
	);

	ula27 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(27),
			  entradaB          => entradaB(27),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(26),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(27),
			  saidaOverflow     => overflow_vetor(27),
			  saidaSet          => set_final(27),
			  saidaResultado    => resultadoULA(27)
	);

	ula28 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(28),
			  entradaB          => entradaB(28),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(27),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(28),
			  saidaOverflow     => overflow_vetor(28),
			  saidaSet          => set_final(28),
			  saidaResultado    => resultadoULA(28)
	);

	ula29 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(29),
			  entradaB          => entradaB(29),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(28),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(29),
			  saidaOverflow     => overflow_vetor(29),
			  saidaSet          => set_final(29),
			  saidaResultado    => resultadoULA(29)
	);

	ula30 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(30),
			  entradaB          => entradaB(30),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(29),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(30),
			  saidaOverflow     => overflow_vetor(30),
			  saidaSet          => set_final(30),
			  saidaResultado    => resultadoULA(30)
	);

	ula31 : entity work.ULA1bit
	port map( -- Input ports
			  entradaA          => entradaA(31),
			  entradaB          => entradaB(31),
			  entradaLess       => '0',
			  seletorInverteB   => Binvert,
			  vemUM             => vaiUM_final(30),
			  seletorULA        => ULActrl,
			  -- Output ports
			  vaiUM             => vaiUM_final(31),
			  saidaOverflow     => overflow_vetor(31),
			  saidaSet          => set_final(31),
			  saidaResultado    => resultadoULA(31)
	);

	overflow_final <= overflow_vetor(31);
			  
end architecture;