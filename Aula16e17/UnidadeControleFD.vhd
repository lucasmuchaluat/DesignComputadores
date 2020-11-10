library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UnidadeControleFD is
  port   (
    -- Input ports
    clk  :  in  std_logic;
	 opCode  :  in  std_logic_vector(5 downto 0);
    -- Output ports
    palavraControle  :  out std_logic_vector(7 downto 0);
	 ULAop : out std_logic_vector(1 downto 0)
  );
end entity;


architecture arch_name of UnidadeControleFD is

-- aliases para saida
  alias JMP : std_logic is palavraControle(7);
  alias habEscritaMEM : std_logic is palavraControle(6);
  alias habLeituraMEM : std_logic is palavraControle(5);
  alias BEQ : std_logic is palavraControle(4);
  alias muxULAMem : std_logic is palavraControle(3);
  alias muxRtImed : std_logic is palavraControle(2);
  alias escritaReg3 : std_logic is palavraControle(1);
  alias muxRtRd : std_logic is palavraControle(0);

-- operacoes ULA disponiveis
  constant ADD : std_logic_vector(1 downto 0) := "00";
  constant SUB : std_logic_vector(1 downto 0) := "01";
  constant FUNCT : std_logic_vector(1 downto 0) := "10";

  
  
  --                 muxRtRd      escritaReg3   muxRtImed   operacao   muxULAMem   BEQ   habLeituraMEM   habEscritaMEM      JMP
    -- Add               1              1           0           000           0       0         0               0            0
    -- Sub               1              1           0           001           0       0         0               0            0
    -- And               1              1           0            0            0       0         0               0            0
    -- OR                1              1           0            0            0       0         0               0            0
    -- SLT              N/D            N/D         011           0            0       0         0               0            0
    -- LW                0              1           1           000           0       0         0               0            0
    -- SW                0              0           1           000           0       0         0               1            0
    -- BEQ               0              0           1           001           0       1         0               0            0
	--  JMP               0              0           0           000           0       0         0               0            1


  begin
    muxRtRd <= '1' when opCode = "000000" else '0';
    escritaReg3 <= '1' when opCode = "000000" else '1' when opCode = 6x"23" else '0';
    muxRtImed <= '0' when opCode = "000000" else '1';
    ULAop <= ADD when opCode = 6x"23" else
        ADD when opCode = 6x"2b" else
        SUB when opCode = 6x"4" else
        FUNCT when opCode = 6x"0" else
        "00"; 
            
    muxULAMem <= '0' when opCode = "000000" AND opCode = 6x"23" AND opCode = 6x"2b" AND opCode = 6x"4" else '1';
    BEQ <= '1' when opCode = 6x"4" else '0';
    habLeituraMEM <= '0' when opCode = "000000" AND opCode = 6x"23" AND opCode = 6x"2b" AND opCode = 6x"4" else '1';
    habEscritaMEM <= '0' when opCode = "000000" AND opCode = 6x"23" AND opCode = 6x"4" else '1';
    JMP <= '1' when opCode = 6x"2" else '0';

end architecture;