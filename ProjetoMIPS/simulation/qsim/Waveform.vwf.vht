-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/21/2020 23:02:20"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MIPS
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MIPS_vhd_vec_tst IS
END MIPS_vhd_vec_tst;
ARCHITECTURE MIPS_arch OF MIPS_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL inULAA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL inULAB : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL outDadoEscrito : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL outDadoLido : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL OUTEndereco : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL outPC : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL testeSaidaMux : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT MIPS
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	inULAA : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	inULAB : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	outDadoEscrito : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	outDadoLido : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	OUTEndereco : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	outPC : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	testeSaidaMux : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : MIPS
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	inULAA => inULAA,
	inULAB => inULAB,
	outDadoEscrito => outDadoEscrito,
	outDadoLido => outDadoLido,
	OUTEndereco => OUTEndereco,
	outPC => outPC,
	testeSaidaMux => testeSaidaMux
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 5000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 240000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;
END MIPS_arch;
