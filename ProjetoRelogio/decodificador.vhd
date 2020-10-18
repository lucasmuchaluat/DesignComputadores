library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY decodificador IS
  GENERIC (
    DATA_WIDTH : NATURAL := 8;
    ADDR_WIDTH : NATURAL := 8
  );

  PORT (
    -- Input ports
    dataIN : IN std_logic_vector(15 downto 0);
    store  : IN std_logic; 
    load   : IN std_logic; 
    -- Output ports
    habDisplay    : OUT std_logic_vector(5 downto 0);
    habSW     : OUT std_logic_vector(7 DOWNTO 0);
	 habBUT    : out std_logic_vector(3 downto 0);
    habBaseTempo : OUT std_logic;
    limpaBasetempo    : OUT std_logic
  );
END ENTITY;
ARCHITECTURE arch_name OF decodificador IS

  -- Mapa de memoria
  -- sw: 1 endereco p/ cada       [x00 ~ x09]
  -- keys: 1 endereco p/ cada     [x0A ~ x0D]
  -- displays: 1 endereco p/ cada [x0E ~ x13]
  -- base tempo: 1 endereco       [x14]
  -- limpa base tempo: 1 endereco [x15]
  -- 

BEGIN
  habSW(0) <= '1' WHEN (DataIN = x"0000" AND load = '1') ELSE -- SW[0]
  '0';
  habSW(1) <= '1' WHEN (DataIN = x"0001" AND load = '1') ELSE -- SW[1]
  '0';
  habSW(2) <= '1' WHEN (DataIN = x"0002" AND load = '1') ELSE -- SW[2]
  '0';
  habSW(3) <= '1' WHEN (DataIN = x"0003" AND load = '1') ELSE -- SW[3]
  '0';
  habSW(4) <= '1' WHEN (DataIN = x"0004" AND load = '1') ELSE -- SW[4]
  '0';
  habSW(5) <= '1' WHEN (DataIN = x"0005" AND load = '1') ELSE -- SW[5]
  '0';
  habSW(6) <= '1' WHEN (DataIN = x"0006" AND load = '1') ELSE -- SW[6]
  '0';
  habSW(7) <= '1' WHEN (DataIN = x"0007" AND load = '1') ELSE -- SW[7]
  '0';

  
  habBUT(0) <= '1' WHEN (DataIN = x"0008" AND load = '1') ELSE -- BUT[0]
  '0';
  habBUT(1) <= '1' WHEN (DataIN = x"0009" AND load = '1') ELSE -- BUT[1]
  '0';
  habBUT(2) <= '1' WHEN (DataIN = x"000A" AND load = '1') ELSE -- BUT[2]
  '0';
  habBUT(3) <= '1' WHEN (DataIN = x"000B" AND load = '1') ELSE -- BUT[3]
  '0';
  

  habBaseTempo <= '1' WHEN (DataIN = x"000C" AND load = '1') ELSE -- Habilita Base de tempo
    '0';
  limpaBasetempo <= '1' WHEN (DataIN = x"000D" AND load = '1') ELSE -- Limpa base de tempo
    '0';


  habDisplay(0) <= '1' WHEN (DataIN = x"000E" AND store = '1') ELSE -- Display unidade segundo 
  '0';
  habDisplay(1) <= '1' WHEN (DataIN = x"000F" AND store = '1') ELSE -- Display dezena segundo
  '0';
  habDisplay(2) <= '1' WHEN (DataIN = x"0010" AND store = '1') ELSE -- Display unidade minuto
  '0';
  habDisplay(3) <= '1' WHEN (DataIN = x"0011" AND store = '1') ELSE -- Display dezena minuto
  '0';
  habDisplay(4) <= '1' WHEN (DataIN = x"0012" AND store = '1') ELSE -- Display unidade hora
  '0';
  habDisplay(5) <= '1' WHEN (DataIN = x"0013" AND store = '1') ELSE -- Display dezena hora
  '0';

END ARCHITECTURE;