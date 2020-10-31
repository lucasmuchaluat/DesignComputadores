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
-- Generated on "10/30/2020 20:58:46"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Aula14
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Aula14_vhd_vec_tst IS
END Aula14_vhd_vec_tst;
ARCHITECTURE Aula14_arch OF Aula14_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL outDadoEscrito : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL outDadoLido : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL OUTEndereco : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL outPC : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT Aula14
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	outDadoEscrito : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	outDadoLido : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	OUTEndereco : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	outPC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Aula14
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	outDadoEscrito => outDadoEscrito,
	outDadoLido => outDadoLido,
	OUTEndereco => OUTEndereco,
	outPC => outPC
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
END Aula14_arch;
