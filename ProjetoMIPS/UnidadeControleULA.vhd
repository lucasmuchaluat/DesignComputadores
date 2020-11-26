library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.constantesMIPS.all;

entity UnidadeControleULA is

  port   (
   -- Input ports
   ulaOp  :  in  std_logic_vector(2 downto 0);
	funct  :  in  std_logic_vector(5 downto 0);
   -- Output ports
   ulaCtrl  :  out std_logic_vector(2 downto 0)
  );
end entity;


architecture arch_name of UnidadeControleULA is
  
-- ULAop disponiveis
    constant ADD : std_logic_vector(2 downto 0) := "000";
    constant SUB : std_logic_vector(2 downto 0) := "001";
    constant opFUNCT : std_logic_vector(2 downto 0) := "010";
  
    constant opOR : std_logic_vector(2 downto 0) := "011";
    constant opAND : std_logic_vector(2 downto 0) := "111";
	 constant opLUI : std_logic_vector(2 downto 0) := "101";
	 constant opSLT : std_logic_vector(2 downto 0) := "100";
  	 

  begin		 
					 
         ulaCtrl <= execAddULA when ulaOp = ADD else
                    execSubULA when ulaOp = SUB else
					     execOrULA  when ulaOp = opOR else
						  execAndULA when ulaOp = opAND else
						  execLuiULA when ulaOp = opLUI else
						  execSltULA when ulaOp = opSLT else
                    execAddULA when ulaOp = opFUNCT and funct = functADD else
                    execOrULA  when ulaOp = opFUNCT and funct = functOR else
                    execSubULA when ulaOp = opFUNCT and funct = functSUB else
                    execSltULA when ulaOp = opFUNCT and funct = functSLT else
					"000";                                   


end architecture;