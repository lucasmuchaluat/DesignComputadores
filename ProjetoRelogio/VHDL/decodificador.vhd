library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decodificador is
  generic (
    DATA_WIDTH : NATURAL := 8;
    ADDR_WIDTH : NATURAL := 8
  );

  port (
    -- Input ports
    dataIN : in std_logic_vector(15 downto 0);
    store  : in std_logic; 
    load   : in std_logic; 
    -- Output ports
    habDisplay    : out std_logic_vector(5 downto 0);
    habSW     : out std_logic_vector(7 downto 0);
	 habBUT    : out std_logic_vector(3 downto 0);
    habBaseTempo : out std_logic;
    limpaBasetempo    : out std_logic
  );
end entity;
architecture arch_name of decodificador is

begin
  habSW(0) <= '1' when (DataIN = x"0000" AND load = '1') else -- SW0
  '0';
  habSW(1) <= '1' when (DataIN = x"0001" AND load = '1') else -- SW1
  '0';
  habSW(2) <= '1' when (DataIN = x"0002" AND load = '1') else -- SW2]
  '0';
  habSW(3) <= '1' when (DataIN = x"0003" AND load = '1') else -- SW3
  '0';
  habSW(4) <= '1' when (DataIN = x"0004" AND load = '1') else -- SW4
  '0';
  habSW(5) <= '1' when (DataIN = x"0005" AND load = '1') else -- SW5
  '0';
  habSW(6) <= '1' when (DataIN = x"0006" AND load = '1') else -- SW6
  '0';
  habSW(7) <= '1' when (DataIN = x"0007" AND load = '1') else -- SW7
  '0';

  
  habBUT(0) <= '1' when (DataIN = x"0008" AND load = '1') else -- BUT0
  '0';
  habBUT(1) <= '1' when (DataIN = x"0009" AND load = '1') else -- BUT1
  '0';
  habBUT(2) <= '1' when (DataIN = x"000A" AND load = '1') else -- BUT2
  '0';
  habBUT(3) <= '1' when (DataIN = x"000B" AND load = '1') else -- BUT3
  '0';
  

  habBaseTempo <= '1' when (DataIN = x"000C" AND load = '1') else -- Habilita Base de tempo
    '0';
  limpaBasetempo <= '1' when (DataIN = x"000D" AND load = '1') else -- Limpa base de tempo
    '0';


  habDisplay(0) <= '1' when (DataIN = x"000E" AND store = '1') else -- Display segundo unidade 
  '0';
  habDisplay(1) <= '1' when (DataIN = x"000F" AND store = '1') else -- Display segundo d ezena
  '0';
  habDisplay(2) <= '1' when (DataIN = x"0010" AND store = '1') else -- Display minuto s egundo
  '0';
  habDisplay(3) <= '1' when (DataIN = x"0011" AND store = '1') else -- Display minuto dezena
  '0';
  habDisplay(4) <= '1' when (DataIN = x"0012" AND store = '1') else -- Display hora unidade
  '0';
  habDisplay(5) <= '1' when (DataIN = x"0013" AND store = '1') else -- Display hora dezena
  '0';

end architecture;