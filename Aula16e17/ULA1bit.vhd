library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA1bit is

  port   (
    -- Input ports
	entradaA          :  in std_logic;
	entradaB          :  in std_logic;
	entradaLess       :  in std_logic;
	seletorInverteB   :  in std_logic;
	vemUM             :  in std_logic;
	seletorULA        :  in std_logic_vector(1 downto 0);
	-- Output ports
	vaiUM             : out std_logic;
	saidaOverflow     : out std_logic;
	saidaSet          : out std_logic;
	saidaResultado    : out std_logic
	 
    );
end entity;

architecture arch_name of ULA1bit is
  signal  saidaInverteB     : std_logic;
  signal  signalSomaSubtrai : std_logic;
  signal  signalAND         : std_logic;
  signal  signalOR          : std_logic;
  signal  outResultado      : std_logic;
   
begin

  inverteB : entity work.muxGenerico2x1
    port map( entradaA_MUX => entradaB, 
				  entradaB_MUX => not(entradaB), 
				  seletor_MUX => seletorInverteB, 
				  saida_MUX => saidaInverteB);
				  
  signalAND <= saidaInverteB AND  entradaA;
  signalOR <= saidaInverteB OR entradaA;
  
  SomaSubtrai : entity work.SomadorCompleto1bit
    port map( entradaA          => entradaA,
	              entradaB          => entradaB,
				  vemUM             => vemUM,
				  vaiUM             => vaiUM,
				  soma              => signalSomaSubtrai);
				  
  saidaSet <= signalSomaSubtrai;
	 
  muxULA : entity work.muxGenerico4x1
    port map( entradaA_MUX => signalAND, 
				  entradaB_MUX => signalOR, 
				  entradaC_MUX => signalSomaSubtrai,
				  entradaD_MUX => entradaLess,
				  seletor_MUX => seletorULA, 
				  saida_MUX => outResultado);

  detectaOF : entity work.detectaOverflow
	port map( entradaA => entradaA,
			  entradaB => entradaB,
			  resultado => outResultado,
			  overflow => saidaOverflow);
			  
  saidaResultado <= outResultado;
  
end architecture;