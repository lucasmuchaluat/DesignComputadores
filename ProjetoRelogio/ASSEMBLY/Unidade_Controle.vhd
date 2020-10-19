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
  alias je : std_logic is palavraControle(10);
  alias jmp : std_logic is palavraControle(9);
  alias muxImedUla : std_logic is palavraControle(8);
  alias muxImedRam : std_logic is palavraControle(7);
  alias operacao : std_logic_vector(2 downto 0) is palavraControle(6 downto 4);
  alias habEscritaReg : std_logic is palavraControle(3);
  alias habLeituraMem : std_logic is palavraControle(2);
  alias habEscritaMem : std_logic is palavraControle(1);
  alias habilitaFlip : std_logic is palavraControle(0);
  
-- opCodes disponiveis
  constant LOAD : std_logic_vector(3 downto 0) := "0001";
  constant STORE : std_logic_vector(3 downto 0) := "0010";
  constant MOVR : std_logic_vector(3 downto 0) := "0011";
  constant MOVC : std_logic_vector(3 downto 0) := "0100";
  constant CMP : std_logic_vector(3 downto 0) := "0101";
  constant ADD : std_logic_vector(3 downto 0) := "0110";
  constant opAND : std_logic_vector(3 downto 0) := "0111";
  constant SUB : std_logic_vector(3 downto 0) := "1000";
  constant opJMP : std_logic_vector(3 downto 0) := "1001";
  constant opJE : std_logic_vector(3 downto 0) := "1010";
  
  
    --                 LOAD   STORE   MOVR   MOVC   CMP   ADD   AND   SUB   JMP   JE
    -- je                0      0       0      0     0     0     0     0     0     1
    -- jmp               0      0       0      0     0     0     0     0     1     0
    -- muxImedUla        0      0       1      0    N/D    1     1     1     0     0
    -- muxImedRam        0      0      N/D     1    N/D   N/D   N/D   N/D    0     0
    -- operacao         N/D    N/D     011    N/D   N/D   000   110   001   N/D   N/D
    -- habEscritaReg     1      0       1      1     0     1     1     1     0     0
    -- habLeituraMem     1      0       0      0     0     0     0     0     0     0
    -- habEscritaMem     0      1       0      0     0     0     0     0     0     0
	 -- habilitaFlip      0      0       0      0     1     0     0     0     0     0
   

  begin		 
					 
	 palavraControle <= "00000001100" when opCode = LOAD else 	   --  LOAD
				    "00000000010" when opCode = STORE else 				--  STORE
					 "00100111000" when opCode = MOVR else					--  MOVR
					 "00010001000" when opCode = MOVC else 			   --  MOVC
					 "00101110001" when opCode = CMP else 					--  CMP
					 "00100001000" when opCode = ADD else 					--  ADD
					 "00101101000" when opCode = opAND else 				--  AND		
					 "00100011000" when opCode = SUB   else 			   --  SUB		
					 "01000000000" when opCode = opJMP else 		      --  JMP		
					 "10000000000";                                    --  JE	 


end architecture;