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
-- Generated on "12/05/2020 21:43:52"
                                                             
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
SIGNAL enderecoRAM_MEM : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL habilitaEscritaRAM : STD_LOGIC;
SIGNAL inULAA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL inULAB : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL OUTEndereco : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL outPC : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL testeSaidaMux : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ulaop_out : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL valorEscritoRAM_MEM : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT MIPS
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	enderecoRAM_MEM : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	habilitaEscritaRAM : OUT STD_LOGIC;
	inULAA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	inULAB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	OUTEndereco : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	outPC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	testeSaidaMux : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	ulaop_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	valorEscritoRAM_MEM : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : MIPS
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	enderecoRAM_MEM => enderecoRAM_MEM,
	habilitaEscritaRAM => habilitaEscritaRAM,
	inULAA => inULAA,
	inULAB => inULAB,
	OUTEndereco => OUTEndereco,
	outPC => outPC,
	testeSaidaMux => testeSaidaMux,
	ulaop_out => ulaop_out,
	valorEscritoRAM_MEM => valorEscritoRAM_MEM
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 5000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1500000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;
END MIPS_arch;
