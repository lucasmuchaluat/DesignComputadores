library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UnidadeControleULA is

  port   (
   -- Input ports
   ulaOp  :  in  std_logic_vector(1 downto 0);
	funct  :  in  std_logic_vector(5 downto 0);
   -- Output ports
   ulaCtrl  :  out std_logic_vector(2 downto 0)
  );
end entity;


architecture arch_name of UnidadeControleULA is
  
-- ULAop disponiveis
    constant ADD : std_logic_vector(1 downto 0) := "00";
    constant SUB : std_logic_vector(1 downto 0) := "01";
    constant FUNCT : std_logic_vector(1 downto 0) := "10";
-- funct disponiveis
    constant FUNCT_ADD : std_logic_vector(2 downto 0) := 6x"20";
    constant FUNCT_SUB : std_logic_vector(2 downto 0) := 6x"22";
    constant FUNCT_AND : std_logic_vector(2 downto 0) := 6x"24";
    constant FUNCT_OR : std_logic_vector(2 downto 0) := 6x"25";
    constant FUNCT_SLT : std_logic_vector(2 downto 0) := 6x"2a";
-- ULAcrtl disponiveis
    constant CTRL_ADD : std_logic_vector(1 downto 0) := "010";
    constant CTRL_SUB : std_logic_vector(1 downto 0) := "110";
    constant CTRL_AND : std_logic_vector(1 downto 0) := "000";
    constant CTRL_OR : std_logic_vector(1 downto 0) := "001";
    constant CTRL_SLT : std_logic_vector(1 downto 0) := "111";
   

  begin		 
					 
         ulaCtrl <= CTRL_ADD when ulaOp = ADD else
                    CTRL_SUB when ulaOp = SUB else

                    CTRL_ADD when ulaOp = FUNCT and funct = FUNCT_ADD else
                    CTRL_OR when ulaOp = FUNCT and funct = FUNCT_OR else
                    CTRL_SUB when ulaOp = FUNCT and funct = FUNCT_SUB else
                    CTRL_SLT when ulaOp = FUNCT and funct = FUNCT_SLT else
					"000";                                   


end architecture;