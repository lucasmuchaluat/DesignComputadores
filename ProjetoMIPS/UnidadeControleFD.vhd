library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.constantesMIPS.all;

entity UnidadeControleFD is
  port   (
    -- Input ports
    clk  :  in  std_logic;
	 opCode  :  in  std_logic_vector(5 downto 0);
	 entradaJR : in std_logic;
    -- Output ports
    palavraControle  :  out std_logic_vector(13 downto 0);
	 ULAop : out std_logic_vector(2 downto 0)
  );
end entity;


architecture arch_name of UnidadeControleFD is

-- aliases para saida
  alias JMP : std_logic_vector(1 DOWNTO 0) is palavraControle(13 downto 12);
  alias ZeroImed : std_logic is palavraControle(11);
  alias LUI : std_logic is palavraControle(10);
  alias muxULAMem : std_logic_vector(1 DOWNTO 0) is palavraControle(9 downto 8);
  alias escritaReg3 : std_logic is palavraControle(7);
  alias habEscritaMEM : std_logic is palavraControle(6);
  alias habLeituraMEM : std_logic is palavraControle(5);
  alias BNE : std_logic is palavraControle(4);
  alias BEQ : std_logic is palavraControle(3);
  alias muxRtImed : std_logic is palavraControle(2);
  alias muxRtRd : std_logic_vector(1 DOWNTO 0) is palavraControle(1 downto 0);

-- operacoes ULA disponiveis
  constant ADD : std_logic_vector(2 downto 0) := "000";
  constant SUB : std_logic_vector(2 downto 0) := "001";
  constant opFUNCT : std_logic_vector(2 downto 0) := "010";
  
  constant opOR : std_logic_vector(2 downto 0) := "011";
  constant opAND : std_logic_vector(2 downto 0) := "111";
  constant opLUI : std_logic_vector(2 downto 0) := "101";
  constant opSLT : std_logic_vector(2 downto 0) := "100";

  
  
    --               muxRtRd      escritaReg3   muxRtImed    muxULAMem  BEQ   habLeituraMEM   habEscritaMEM   JMP   LUI ZeroImed
    -- Tipo R           01              1           0           00       0         0               0           00    0    0
    -- LW               00              1           1           01       0         1               0           00    0    0
    -- SW               00              0           1           00       0         0               1           00    0    0
    -- BEQ              00              0           0           00       1         0               0           00    0    0
	 -- JMP              00              0           0           00       0         0               0           01    0    0
	 -- ORI              00              1           1           00       0         0               0           00    0    1
	 -- LUI              00              1           1           00       0         0               0           00    1    0
	 -- ANDI             00              1           1           00       0         0               0           00    0    1
	 -- ADDI             00              1           1           00       0         0               0           00    0    0	
	 -- SLTI             00              1           1           00       0         0               0           00    0    0   
	 -- JAL              10              1           X           10       0         0               0           01    0    0 
  
  begin
    muxRtRd <= "01" when opCode = opCodeTipoR else 
					"10" when opCode = opCodeJAL else 
				   "00";
    escritaReg3 <= '0' when opCode = opCodeSW OR opCode = opCodeBEQ  OR opCode = opCodeTipoJ OR opCode = opCodeBNE else '1';
    muxRtImed <= '0' when opCode = opCodeTipoR OR opCode = opCodeBEQ  OR opCode = opCodeTipoJ OR opCode = opCodeBNE else '1';            
    muxULAMem <= "01" when opCode = opCodeLW else 
					  "10" when opCode = opCodeJAL else
					  "00";
    BEQ <= '1' when opCode = opCodeBEQ else '0';
    habLeituraMEM <= '1' when opCode = opCodeLW else '0';
    habEscritaMEM <= '1' when opCode = opCodeSW else '0';
    JMP <= "01" when opCode = opCodeTipoJ OR opCode = opCodeJAL else
	        "10" when opCode = opCodeTipoR AND entradaJR = '1' else
			  "00";
	 LUI <= '1' when opCode = opCodeLUI else '0';
	 ZeroImed <= '1' when opCode = opCodeORI OR opCode = opCodeANDI else '0';
	 BNE <= '1' when opCode = opCodeBNE else '0';
	 
	 
	 ULAop <= ADD when opCode = opCodeLW else
        ADD when opCode = opCodeSW else
        SUB when opCode = opCodeBEQ else
		  SUB when opCode = opCodeBNE else
		  opOR when opCode = opCodeORI else
		  opLUI when opCode = opCodeLUI else
		  opAND when opCode = opCodeANDI else
		  ADD when opCode = opCodeADDI else
		  opSLT when opCode = opCodeSLTI else
        opFUNCT when opCode = opCodeTipoR else
        "000"; 

end architecture;