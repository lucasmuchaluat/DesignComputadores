library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaROM is
   generic (
          dataWidth: natural := 8;
          addrWidth: natural := 3
    );
   port (
          Endereco : in std_logic_vector (addrWidth-1 DOWNTO 0);
          Dado : out std_logic_vector (dataWidth-1 DOWNTO 0)
    );
end entity;

architecture assincrona of memoriaROM is

  type blocoMemoria is array(0 TO 2**addrWidth - 1) of std_logic_vector(dataWidth-1 DOWNTO 0);

  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
  begin
        -- Inicializa os endereços:
		  -- tmp -> OPCODE   Ra     Rb     Rc    IMEDIATO
	   tmp(0):= b"01000011000000000000000000000001";
		tmp(1):= b"01000110000000000000000000000000";
		tmp(2):= b"01000000000000000000000000001001";
		tmp(3):= b"01001001000000000000000000000101";
		tmp(4):= b"01000111000000000000000000000010";
		tmp(5):= b"01001000000000000000000000000011";
		tmp(6):= b"00100011000000000000000000001110";
		tmp(7):= b"00100110000000000000000000001111";
		tmp(8):= b"00100000000000000000000000010000";
		tmp(9):= b"00101001000000000000000000010001";
		tmp(10):= b"00100111000000000000000000010010";
		tmp(11):= b"00101000000000000000000000010011";
        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;