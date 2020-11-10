library ieee;
use ieee.std_logic_1164.all;

entity muxGenerico4x1 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
    entradaA_MUX, entradaB_MUX , entradaC_MUX, entradaD_MUX: in std_logic_vector((larguraDados-1) downto 0);
    seletor_MUX : in std_logic;
    saida_MUX : out std_logic_vector((larguraDados-1) downto 0)
  );
end entity;

architecture comportamento of muxGenerico4x1 is
  begin
    saida_MUX <= entradaA_MUX when (seletor_MUX = '00') else
    saida_MUX <= entradaB_MUX when (seletor_MUX = '01') else
    saida_MUX <= entradaC_MUX when (seletor_MUX = '10') else
    saida_MUX <= entradaD_MUX
end architecture;