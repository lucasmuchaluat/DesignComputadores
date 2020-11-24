library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.constantesMIPS.all;

entity UnidadeControleFD is
  port   (
    -- Input ports
    clk  :  in  std_logic;
	 opCode  :  in  std_logic_vector(5 downto 0);
    -- Output ports
    palavraControle  :  out std_logic_vector(9 downto 0);
	 ULAop : out std_logic_vector(2 downto 0)
  );
end entity;


architecture arch_name of UnidadeControleFD is

-- aliases para saida
  alias ZeroImed : std_logic is palavraControle(9);
  alias LUI : std_logic is palavraControle(8);
  alias JMP : std_logic is palavraControle(7);
  alias habEscritaMEM : std_logic is palavraControle(6);
  alias habLeituraMEM : std_logic is palavraControle(5);
  alias BEQ : std_logic is palavraControle(4);
  alias muxULAMem : std_logic is palavraControle(3);
  alias muxRtImed : std_logic is palavraControle(2);
  alias escritaReg3 : std_logic is palavraControle(1);
  alias muxRtRd : std_logic is palavraControle(0);

-- operacoes ULA disponiveis
  constant ADD : std_logic_vector(2 downto 0) := "000";
  constant SUB : std_logic_vector(2 downto 0) := "001";
  constant opFUNCT : std_logic_vector(2 downto 0) := "010";
  
  constant opOR : std_logic_vector(2 downto 0) := "011";
  constant opAND : std_logic_vector(2 downto 0) := "111";
  constant opLUI : std_logic_vector(2 downto 0) := "101";

  
  
    --               muxRtRd      escritaReg3   muxRtImed    muxULAMem  BEQ   habLeituraMEM   habEscritaMEM    JMP  LUI ZeroImed
    -- Tipo R            1              1           0            0       0         0               0            0    0    0
    -- LW                0              1           1            1       0         1               0            0    0    0
    -- SW                0              0           1            0       0         0               1            0    0    0
    -- BEQ               0              0           0            0       1         0               0            0    0    0
	 -- JMP               0              0           0            0       0         0               0            1    0    0
	 -- ORI               0              1           1            0       0         0               0            0    0    1
	 -- LUI               0              1           1            0       0         0               0            0    1    0
	 -- ANDI              0              1           1            0       0         0               0            0    0    1
		
  begin
    muxRtRd <= '1' when opCode = opCodeTipoR else '0';
    escritaReg3 <= '1' when opCode = opCodeTipoR OR opCode = opCodeLW OR opCode = opCodeORI OR opCode = opCodeLUI OR opCode = opCodeANDI else '0';
    muxRtImed <= '0' when opCode = opCodeTipoR OR opCode = opCodeBEQ  OR opCode = opCodeTipoJ else '1';            
    muxULAMem <= '1' when opCode = opCodeLW else '0';
    BEQ <= '1' when opCode = opCodeBEQ else '0';
    habLeituraMEM <= '1' when opCode = opCodeLW else '0';
    habEscritaMEM <= '1' when opCode = opCodeSW else '0';
    JMP <= '1' when opCode = opCodeTipoJ else '0';
	 LUI <= '1' when opCode = opCodeLUI else '0';
	 ZeroImed <= '1' when opCode = opCodeORI OR opCode = opCodeANDI else '0';
	 
	 ULAop <= ADD when opCode = opCodeLW else
        ADD when opCode = opCodeSW else
        SUB when opCode = opCodeBEQ else
		  opOR when opCode = opCodeORI else
		  opLUI when opCode = opCodeLUI else
		  opAND when opCode = opCodeANDI else
        opFUNCT when opCode = opCodeTipoR else
        "000"; 

end architecture;