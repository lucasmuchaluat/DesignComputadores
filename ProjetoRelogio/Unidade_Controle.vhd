library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Unidade_Controle is
  generic   (
    DATA_WIDTH  : natural :=  8;
    ADDR_WIDTH  : natural :=  4
  );

  port   (
    -- Input ports
    clk  :  in  std_logic;
	 opCode  :  in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    -- Output ports
    palavraControle  :  out std_logic_vector(10 downto 0)
  );
end entity;


architecture arch_name of Unidade_Controle is

-- aliases para saida
  alias rstZ : std_logic is palavraControle(10);
  alias rstN : std_logic is palavraControle(9);
  alias selMuxJump : std_logic is palavraControle(8);
  alias selMuxULAImed : std_logic is palavraControle(7);
  alias selMuxImedRAM : std_logic is palavraControle(6);
  alias HabEscritaReg : std_logic is palavraControle(5);
  alias selOperacaoULA : std_logic_vector(2 downto 0) is palavraControle(4 downto 2);
  alias habLeituraMEM : std_logic is palavraControle(1);
  alias habEscritaMEM : std_logic is palavraControle(0);
  
-- opCodes disponiveis
  constant ADD : std_logic_vector(3 downto 0) := "0001";
  constant SUB : std_logic_vector(3 downto 0) := "0010";
  constant MOVR : std_logic_vector(3 downto 0) := "0011";
  constant MOVC : std_logic_vector(3 downto 0) := "0100";
  constant STORE : std_logic_vector(3 downto 0) := "0101";
  constant LOAD : std_logic_vector(3 downto 0) := "0110";
  constant DIV : std_logic_vector(3 downto 0) := "0111";
  constant JMP : std_logic_vector(3 downto 0) := "1000";
  constant JE : std_logic_vector(3 downto 0) := "1001";
  constant JL : std_logic_vector(3 downto 0) := "1010";
  constant CMP : std_logic_vector(3 downto 0) := "1011";
  
--
  begin
-
					 
					 
	 palavraControle<= "11010100000" when opCode = "0001" else 			--  add
				    "11010100100" when opCode =  "0010" else 				--  sub
					 "11011101000" when opCode = "0011" else					--  movr
					 "11001100000" when opCode = "0100" else 					--  movc
					 "11000000001" when opCode = "0101" else 					--  store
					 "11000100010" when opCode = "0110" else 					--  load
--					 "11000000000" when opCode = "0111" else 					--  div		
					 "11100000000" when opCode =  JMP   else 					--  jump		
					 "01100000000" when opCode = "1001" AND zero = '1' else 		--  je		
					 "10100000000" when opCode = "1010" AND negativo = '1' else --  jl	 
					 "00010000100" when opCode = "1011" else 					--  cmp
					 "11000000000";



end architecture;