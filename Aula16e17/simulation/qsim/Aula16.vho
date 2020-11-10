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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "11/10/2020 16:37:57"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Aula16 IS
    PORT (
	A : IN std_logic_vector(31 DOWNTO 0);
	B : IN std_logic_vector(31 DOWNTO 0);
	funct : IN std_logic_vector(5 DOWNTO 0);
	ULAop : IN std_logic_vector(1 DOWNTO 0);
	resultado : OUT std_logic_vector(31 DOWNTO 0);
	overflow : OUT std_logic
	);
END Aula16;

ARCHITECTURE structure OF Aula16 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_funct : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_ULAop : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_resultado : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_overflow : std_logic;
SIGNAL \resultado[0]~output_o\ : std_logic;
SIGNAL \resultado[1]~output_o\ : std_logic;
SIGNAL \resultado[2]~output_o\ : std_logic;
SIGNAL \resultado[3]~output_o\ : std_logic;
SIGNAL \resultado[4]~output_o\ : std_logic;
SIGNAL \resultado[5]~output_o\ : std_logic;
SIGNAL \resultado[6]~output_o\ : std_logic;
SIGNAL \resultado[7]~output_o\ : std_logic;
SIGNAL \resultado[8]~output_o\ : std_logic;
SIGNAL \resultado[9]~output_o\ : std_logic;
SIGNAL \resultado[10]~output_o\ : std_logic;
SIGNAL \resultado[11]~output_o\ : std_logic;
SIGNAL \resultado[12]~output_o\ : std_logic;
SIGNAL \resultado[13]~output_o\ : std_logic;
SIGNAL \resultado[14]~output_o\ : std_logic;
SIGNAL \resultado[15]~output_o\ : std_logic;
SIGNAL \resultado[16]~output_o\ : std_logic;
SIGNAL \resultado[17]~output_o\ : std_logic;
SIGNAL \resultado[18]~output_o\ : std_logic;
SIGNAL \resultado[19]~output_o\ : std_logic;
SIGNAL \resultado[20]~output_o\ : std_logic;
SIGNAL \resultado[21]~output_o\ : std_logic;
SIGNAL \resultado[22]~output_o\ : std_logic;
SIGNAL \resultado[23]~output_o\ : std_logic;
SIGNAL \resultado[24]~output_o\ : std_logic;
SIGNAL \resultado[25]~output_o\ : std_logic;
SIGNAL \resultado[26]~output_o\ : std_logic;
SIGNAL \resultado[27]~output_o\ : std_logic;
SIGNAL \resultado[28]~output_o\ : std_logic;
SIGNAL \resultado[29]~output_o\ : std_logic;
SIGNAL \resultado[30]~output_o\ : std_logic;
SIGNAL \resultado[31]~output_o\ : std_logic;
SIGNAL \overflow~output_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \funct[0]~input_o\ : std_logic;
SIGNAL \funct[2]~input_o\ : std_logic;
SIGNAL \funct[1]~input_o\ : std_logic;
SIGNAL \funct[3]~input_o\ : std_logic;
SIGNAL \ULAop[1]~input_o\ : std_logic;
SIGNAL \funct[4]~input_o\ : std_logic;
SIGNAL \funct[5]~input_o\ : std_logic;
SIGNAL \ULAop[0]~input_o\ : std_logic;
SIGNAL \ucULA|ulaCtrl~0_combout\ : std_logic;
SIGNAL \ucULA|ulaCtrl[0]~1_combout\ : std_logic;
SIGNAL \ULA|ula0|inverteB|saida_MUX~0_combout\ : std_logic;
SIGNAL \ucULA|ulaCtrl~2_combout\ : std_logic;
SIGNAL \ULA|ula0|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|muxULA|Equal1~0_combout\ : std_logic;
SIGNAL \A[17]~input_o\ : std_logic;
SIGNAL \B[17]~input_o\ : std_logic;
SIGNAL \A[20]~input_o\ : std_logic;
SIGNAL \B[20]~input_o\ : std_logic;
SIGNAL \A[19]~input_o\ : std_logic;
SIGNAL \B[19]~input_o\ : std_logic;
SIGNAL \A[18]~input_o\ : std_logic;
SIGNAL \B[18]~input_o\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \A[16]~input_o\ : std_logic;
SIGNAL \B[16]~input_o\ : std_logic;
SIGNAL \A[15]~input_o\ : std_logic;
SIGNAL \B[15]~input_o\ : std_logic;
SIGNAL \ULA|ula15|SomaSubtrai|saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|saidaAND_XOR~1_combout\ : std_logic;
SIGNAL \A[14]~input_o\ : std_logic;
SIGNAL \B[14]~input_o\ : std_logic;
SIGNAL \ULA|ula14|SomaSubtrai|saidaXOR_AB~combout\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[6]~input_o\ : std_logic;
SIGNAL \B[6]~input_o\ : std_logic;
SIGNAL \A[5]~input_o\ : std_logic;
SIGNAL \B[5]~input_o\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \B[4]~input_o\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|saidaAND_XOR~1_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|saidaAND_XOR~2_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|vaiUM~1_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|vaiUM~2_combout\ : std_logic;
SIGNAL \A[10]~input_o\ : std_logic;
SIGNAL \B[10]~input_o\ : std_logic;
SIGNAL \A[13]~input_o\ : std_logic;
SIGNAL \B[13]~input_o\ : std_logic;
SIGNAL \A[12]~input_o\ : std_logic;
SIGNAL \B[12]~input_o\ : std_logic;
SIGNAL \A[11]~input_o\ : std_logic;
SIGNAL \B[11]~input_o\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \A[9]~input_o\ : std_logic;
SIGNAL \B[9]~input_o\ : std_logic;
SIGNAL \ULA|ula9|SomaSubtrai|saidaXOR_AB~combout\ : std_logic;
SIGNAL \A[8]~input_o\ : std_logic;
SIGNAL \B[8]~input_o\ : std_logic;
SIGNAL \ULA|ula8|SomaSubtrai|saidaXOR_AB~combout\ : std_logic;
SIGNAL \A[7]~input_o\ : std_logic;
SIGNAL \B[7]~input_o\ : std_logic;
SIGNAL \ULA|ula7|SomaSubtrai|saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|saidaAND_XOR~1_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|saidaAND_XOR~2_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|vaiUM~1_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|vaiUM~2_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|saidaAND_XOR~2_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|saidaAND_XOR~3_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|vaiUM~1_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|vaiUM~2_combout\ : std_logic;
SIGNAL \A[24]~input_o\ : std_logic;
SIGNAL \B[24]~input_o\ : std_logic;
SIGNAL \A[27]~input_o\ : std_logic;
SIGNAL \B[27]~input_o\ : std_logic;
SIGNAL \A[26]~input_o\ : std_logic;
SIGNAL \B[26]~input_o\ : std_logic;
SIGNAL \A[25]~input_o\ : std_logic;
SIGNAL \B[25]~input_o\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \A[23]~input_o\ : std_logic;
SIGNAL \B[23]~input_o\ : std_logic;
SIGNAL \ULA|ula23|SomaSubtrai|saidaXOR_AB~combout\ : std_logic;
SIGNAL \A[22]~input_o\ : std_logic;
SIGNAL \B[22]~input_o\ : std_logic;
SIGNAL \ULA|ula22|SomaSubtrai|saidaXOR_AB~combout\ : std_logic;
SIGNAL \A[21]~input_o\ : std_logic;
SIGNAL \B[21]~input_o\ : std_logic;
SIGNAL \ULA|ula21|SomaSubtrai|saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|saidaAND_XOR~1_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|saidaAND_XOR~2_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|vaiUM~1_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|vaiUM~2_combout\ : std_logic;
SIGNAL \A[30]~input_o\ : std_logic;
SIGNAL \B[30]~input_o\ : std_logic;
SIGNAL \A[29]~input_o\ : std_logic;
SIGNAL \B[29]~input_o\ : std_logic;
SIGNAL \A[28]~input_o\ : std_logic;
SIGNAL \B[28]~input_o\ : std_logic;
SIGNAL \ULA|ula30|SomaSubtrai|saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \ULA|ula30|SomaSubtrai|vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula30|SomaSubtrai|vaiUM~combout\ : std_logic;
SIGNAL \A[31]~input_o\ : std_logic;
SIGNAL \B[31]~input_o\ : std_logic;
SIGNAL \ULA|ula31|SomaSubtrai|soma~0_combout\ : std_logic;
SIGNAL \ULA|ula0|muxULA|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula2|muxULA|saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula2|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula1|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula2|muxULA|saida_MUX~1_combout\ : std_logic;
SIGNAL \ULA|ula3|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula4|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula5|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula6|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula7|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula8|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula9|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula10|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula11|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula12|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula13|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula14|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula15|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula16|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula17|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula18|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula19|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula20|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula21|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula22|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula23|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula24|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula25|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula26|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula27|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula28|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula29|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula30|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|muxULA|saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|detectaOF|overflow~0_combout\ : std_logic;
SIGNAL \ULA|ula23|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~2_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~1_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~3_combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~2_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~1_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\ : std_logic;
SIGNAL \ULA|ula7|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula8|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula9|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~2_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~1_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\ : std_logic;
SIGNAL \ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \ULA|ula14|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\ : std_logic;
SIGNAL \ULA|ula15|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \ULA|ula31|muxULA|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ULA|ula0|muxULA|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ucULA|ALT_INV_ulaCtrl~2_combout\ : std_logic;
SIGNAL \ULA|ula0|inverteB|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ucULA|ALT_INV_ulaCtrl[0]~1_combout\ : std_logic;
SIGNAL \ucULA|ALT_INV_ulaCtrl~0_combout\ : std_logic;
SIGNAL \ALT_INV_B[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_ULAop[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_ULAop[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_funct[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;
SIGNAL \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\ : std_logic;
SIGNAL \ULA|ula31|detectaOF|ALT_INV_overflow~0_combout\ : std_logic;
SIGNAL \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\ : std_logic;
SIGNAL \ULA|ula31|SomaSubtrai|ALT_INV_soma~0_combout\ : std_logic;
SIGNAL \ULA|ula30|SomaSubtrai|ALT_INV_vaiUM~combout\ : std_logic;
SIGNAL \ULA|ula30|SomaSubtrai|ALT_INV_vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula30|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~2_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~1_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~0_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\ : std_logic;
SIGNAL \ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\ : std_logic;
SIGNAL \ULA|ula21|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ : std_logic;
SIGNAL \ULA|ula22|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_funct <= funct;
ww_ULAop <= ULAop;
resultado <= ww_resultado;
overflow <= ww_overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ULA|ula23|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ <= NOT \ULA|ula23|SomaSubtrai|saidaXOR_AB~combout\;
\ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ <= NOT \ULA|ula27|SomaSubtrai|saidaAND_XOR~0_combout\;
\ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~2_combout\ <= NOT \ULA|ula20|SomaSubtrai|vaiUM~2_combout\;
\ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~1_combout\ <= NOT \ULA|ula20|SomaSubtrai|vaiUM~1_combout\;
\ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~0_combout\ <= NOT \ULA|ula20|SomaSubtrai|vaiUM~0_combout\;
\ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~3_combout\ <= NOT \ULA|ula20|SomaSubtrai|saidaAND_XOR~3_combout\;
\ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\ <= NOT \ULA|ula20|SomaSubtrai|saidaAND_XOR~2_combout\;
\ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~2_combout\ <= NOT \ULA|ula13|SomaSubtrai|vaiUM~2_combout\;
\ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~1_combout\ <= NOT \ULA|ula13|SomaSubtrai|vaiUM~1_combout\;
\ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~0_combout\ <= NOT \ULA|ula13|SomaSubtrai|vaiUM~0_combout\;
\ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\ <= NOT \ULA|ula13|SomaSubtrai|saidaAND_XOR~2_combout\;
\ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\ <= NOT \ULA|ula13|SomaSubtrai|saidaAND_XOR~1_combout\;
\ULA|ula7|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ <= NOT \ULA|ula7|SomaSubtrai|saidaXOR_AB~combout\;
\ULA|ula8|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ <= NOT \ULA|ula8|SomaSubtrai|saidaXOR_AB~combout\;
\ULA|ula9|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ <= NOT \ULA|ula9|SomaSubtrai|saidaXOR_AB~combout\;
\ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ <= NOT \ULA|ula13|SomaSubtrai|saidaAND_XOR~0_combout\;
\ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~2_combout\ <= NOT \ULA|ula6|SomaSubtrai|vaiUM~2_combout\;
\ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~1_combout\ <= NOT \ULA|ula6|SomaSubtrai|vaiUM~1_combout\;
\ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~0_combout\ <= NOT \ULA|ula6|SomaSubtrai|vaiUM~0_combout\;
\ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\ <= NOT \ULA|ula6|SomaSubtrai|saidaAND_XOR~2_combout\;
\ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\ <= NOT \ULA|ula6|SomaSubtrai|saidaAND_XOR~1_combout\;
\ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ <= NOT \ULA|ula6|SomaSubtrai|saidaAND_XOR~0_combout\;
\ULA|ula14|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ <= NOT \ULA|ula14|SomaSubtrai|saidaXOR_AB~combout\;
\ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\ <= NOT \ULA|ula20|SomaSubtrai|saidaAND_XOR~1_combout\;
\ULA|ula15|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ <= NOT \ULA|ula15|SomaSubtrai|saidaXOR_AB~combout\;
\ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ <= NOT \ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\;
\ULA|ula31|muxULA|ALT_INV_Equal1~0_combout\ <= NOT \ULA|ula31|muxULA|Equal1~0_combout\;
\ULA|ula0|muxULA|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula0|muxULA|saida_MUX~0_combout\;
\ucULA|ALT_INV_ulaCtrl~2_combout\ <= NOT \ucULA|ulaCtrl~2_combout\;
\ULA|ula0|inverteB|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula0|inverteB|saida_MUX~0_combout\;
\ucULA|ALT_INV_ulaCtrl[0]~1_combout\ <= NOT \ucULA|ulaCtrl[0]~1_combout\;
\ucULA|ALT_INV_ulaCtrl~0_combout\ <= NOT \ucULA|ulaCtrl~0_combout\;
\ALT_INV_B[31]~input_o\ <= NOT \B[31]~input_o\;
\ALT_INV_A[31]~input_o\ <= NOT \A[31]~input_o\;
\ALT_INV_B[28]~input_o\ <= NOT \B[28]~input_o\;
\ALT_INV_A[28]~input_o\ <= NOT \A[28]~input_o\;
\ALT_INV_B[29]~input_o\ <= NOT \B[29]~input_o\;
\ALT_INV_A[29]~input_o\ <= NOT \A[29]~input_o\;
\ALT_INV_B[30]~input_o\ <= NOT \B[30]~input_o\;
\ALT_INV_A[30]~input_o\ <= NOT \A[30]~input_o\;
\ALT_INV_B[21]~input_o\ <= NOT \B[21]~input_o\;
\ALT_INV_A[21]~input_o\ <= NOT \A[21]~input_o\;
\ALT_INV_B[22]~input_o\ <= NOT \B[22]~input_o\;
\ALT_INV_A[22]~input_o\ <= NOT \A[22]~input_o\;
\ALT_INV_B[23]~input_o\ <= NOT \B[23]~input_o\;
\ALT_INV_A[23]~input_o\ <= NOT \A[23]~input_o\;
\ALT_INV_B[25]~input_o\ <= NOT \B[25]~input_o\;
\ALT_INV_A[25]~input_o\ <= NOT \A[25]~input_o\;
\ALT_INV_B[26]~input_o\ <= NOT \B[26]~input_o\;
\ALT_INV_A[26]~input_o\ <= NOT \A[26]~input_o\;
\ALT_INV_B[27]~input_o\ <= NOT \B[27]~input_o\;
\ALT_INV_A[27]~input_o\ <= NOT \A[27]~input_o\;
\ALT_INV_B[24]~input_o\ <= NOT \B[24]~input_o\;
\ALT_INV_A[24]~input_o\ <= NOT \A[24]~input_o\;
\ALT_INV_B[7]~input_o\ <= NOT \B[7]~input_o\;
\ALT_INV_A[7]~input_o\ <= NOT \A[7]~input_o\;
\ALT_INV_B[8]~input_o\ <= NOT \B[8]~input_o\;
\ALT_INV_A[8]~input_o\ <= NOT \A[8]~input_o\;
\ALT_INV_B[9]~input_o\ <= NOT \B[9]~input_o\;
\ALT_INV_A[9]~input_o\ <= NOT \A[9]~input_o\;
\ALT_INV_B[11]~input_o\ <= NOT \B[11]~input_o\;
\ALT_INV_A[11]~input_o\ <= NOT \A[11]~input_o\;
\ALT_INV_B[12]~input_o\ <= NOT \B[12]~input_o\;
\ALT_INV_A[12]~input_o\ <= NOT \A[12]~input_o\;
\ALT_INV_B[13]~input_o\ <= NOT \B[13]~input_o\;
\ALT_INV_A[13]~input_o\ <= NOT \A[13]~input_o\;
\ALT_INV_B[10]~input_o\ <= NOT \B[10]~input_o\;
\ALT_INV_A[10]~input_o\ <= NOT \A[10]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_B[4]~input_o\ <= NOT \B[4]~input_o\;
\ALT_INV_A[4]~input_o\ <= NOT \A[4]~input_o\;
\ALT_INV_B[5]~input_o\ <= NOT \B[5]~input_o\;
\ALT_INV_A[5]~input_o\ <= NOT \A[5]~input_o\;
\ALT_INV_B[6]~input_o\ <= NOT \B[6]~input_o\;
\ALT_INV_A[6]~input_o\ <= NOT \A[6]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_B[14]~input_o\ <= NOT \B[14]~input_o\;
\ALT_INV_A[14]~input_o\ <= NOT \A[14]~input_o\;
\ALT_INV_B[15]~input_o\ <= NOT \B[15]~input_o\;
\ALT_INV_A[15]~input_o\ <= NOT \A[15]~input_o\;
\ALT_INV_B[16]~input_o\ <= NOT \B[16]~input_o\;
\ALT_INV_A[16]~input_o\ <= NOT \A[16]~input_o\;
\ALT_INV_B[18]~input_o\ <= NOT \B[18]~input_o\;
\ALT_INV_A[18]~input_o\ <= NOT \A[18]~input_o\;
\ALT_INV_B[19]~input_o\ <= NOT \B[19]~input_o\;
\ALT_INV_A[19]~input_o\ <= NOT \A[19]~input_o\;
\ALT_INV_B[20]~input_o\ <= NOT \B[20]~input_o\;
\ALT_INV_A[20]~input_o\ <= NOT \A[20]~input_o\;
\ALT_INV_B[17]~input_o\ <= NOT \B[17]~input_o\;
\ALT_INV_A[17]~input_o\ <= NOT \A[17]~input_o\;
\ALT_INV_ULAop[0]~input_o\ <= NOT \ULAop[0]~input_o\;
\ALT_INV_funct[5]~input_o\ <= NOT \funct[5]~input_o\;
\ALT_INV_funct[4]~input_o\ <= NOT \funct[4]~input_o\;
\ALT_INV_ULAop[1]~input_o\ <= NOT \ULAop[1]~input_o\;
\ALT_INV_funct[3]~input_o\ <= NOT \funct[3]~input_o\;
\ALT_INV_funct[1]~input_o\ <= NOT \funct[1]~input_o\;
\ALT_INV_funct[2]~input_o\ <= NOT \funct[2]~input_o\;
\ALT_INV_funct[0]~input_o\ <= NOT \funct[0]~input_o\;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;
\ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\ <= NOT \ULA|ula2|muxULA|saida_MUX~2_combout\;
\ULA|ula31|detectaOF|ALT_INV_overflow~0_combout\ <= NOT \ULA|ula31|detectaOF|overflow~0_combout\;
\ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\ <= NOT \ULA|ula2|muxULA|saida_MUX~0_combout\;
\ULA|ula31|SomaSubtrai|ALT_INV_soma~0_combout\ <= NOT \ULA|ula31|SomaSubtrai|soma~0_combout\;
\ULA|ula30|SomaSubtrai|ALT_INV_vaiUM~combout\ <= NOT \ULA|ula30|SomaSubtrai|vaiUM~combout\;
\ULA|ula30|SomaSubtrai|ALT_INV_vaiUM~0_combout\ <= NOT \ULA|ula30|SomaSubtrai|vaiUM~0_combout\;
\ULA|ula30|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\ <= NOT \ULA|ula30|SomaSubtrai|saidaAND_XOR~0_combout\;
\ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~2_combout\ <= NOT \ULA|ula27|SomaSubtrai|vaiUM~2_combout\;
\ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~1_combout\ <= NOT \ULA|ula27|SomaSubtrai|vaiUM~1_combout\;
\ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~0_combout\ <= NOT \ULA|ula27|SomaSubtrai|vaiUM~0_combout\;
\ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\ <= NOT \ULA|ula27|SomaSubtrai|saidaAND_XOR~2_combout\;
\ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\ <= NOT \ULA|ula27|SomaSubtrai|saidaAND_XOR~1_combout\;
\ULA|ula21|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ <= NOT \ULA|ula21|SomaSubtrai|saidaXOR_AB~combout\;
\ULA|ula22|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\ <= NOT \ULA|ula22|SomaSubtrai|saidaXOR_AB~combout\;

\resultado[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula0|muxULA|saida_MUX~1_combout\,
	devoe => ww_devoe,
	o => \resultado[0]~output_o\);

\resultado[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula1|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[1]~output_o\);

\resultado[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula2|muxULA|saida_MUX~1_combout\,
	devoe => ww_devoe,
	o => \resultado[2]~output_o\);

\resultado[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula3|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[3]~output_o\);

\resultado[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula4|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[4]~output_o\);

\resultado[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula5|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[5]~output_o\);

\resultado[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula6|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[6]~output_o\);

\resultado[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula7|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[7]~output_o\);

\resultado[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula8|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[8]~output_o\);

\resultado[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula9|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[9]~output_o\);

\resultado[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula10|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[10]~output_o\);

\resultado[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula11|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[11]~output_o\);

\resultado[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula12|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[12]~output_o\);

\resultado[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula13|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[13]~output_o\);

\resultado[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula14|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[14]~output_o\);

\resultado[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula15|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[15]~output_o\);

\resultado[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula16|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[16]~output_o\);

\resultado[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula17|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[17]~output_o\);

\resultado[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula18|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[18]~output_o\);

\resultado[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula19|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[19]~output_o\);

\resultado[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula20|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[20]~output_o\);

\resultado[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula21|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[21]~output_o\);

\resultado[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula22|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[22]~output_o\);

\resultado[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula23|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[23]~output_o\);

\resultado[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula24|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[24]~output_o\);

\resultado[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula25|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[25]~output_o\);

\resultado[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula26|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[26]~output_o\);

\resultado[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula27|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[27]~output_o\);

\resultado[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula28|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[28]~output_o\);

\resultado[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula29|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[29]~output_o\);

\resultado[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula30|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[30]~output_o\);

\resultado[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula31|muxULA|saida_MUX~0_combout\,
	devoe => ww_devoe,
	o => \resultado[31]~output_o\);

\overflow~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ULA|ula31|detectaOF|ALT_INV_overflow~0_combout\,
	devoe => ww_devoe,
	o => \overflow~output_o\);

\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

\funct[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(0),
	o => \funct[0]~input_o\);

\funct[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(2),
	o => \funct[2]~input_o\);

\funct[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(1),
	o => \funct[1]~input_o\);

\funct[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(3),
	o => \funct[3]~input_o\);

\ULAop[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ULAop(1),
	o => \ULAop[1]~input_o\);

\funct[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(4),
	o => \funct[4]~input_o\);

\funct[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct(5),
	o => \funct[5]~input_o\);

\ULAop[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ULAop(0),
	o => \ULAop[0]~input_o\);

\ucULA|ulaCtrl~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ucULA|ulaCtrl~0_combout\ = (!\funct[4]~input_o\ & (\funct[5]~input_o\ & !\ULAop[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000001000000010000000100000001000000010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_funct[4]~input_o\,
	datab => \ALT_INV_funct[5]~input_o\,
	datac => \ALT_INV_ULAop[0]~input_o\,
	combout => \ucULA|ulaCtrl~0_combout\);

\ucULA|ulaCtrl[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ucULA|ulaCtrl[0]~1_combout\ = ( \ULAop[1]~input_o\ & ( \ucULA|ulaCtrl~0_combout\ & ( (!\funct[0]~input_o\ & (!\funct[2]~input_o\ & (\funct[1]~input_o\ & \funct[3]~input_o\))) # (\funct[0]~input_o\ & (\funct[2]~input_o\ & (!\funct[1]~input_o\ & 
-- !\funct[3]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_funct[0]~input_o\,
	datab => \ALT_INV_funct[2]~input_o\,
	datac => \ALT_INV_funct[1]~input_o\,
	datad => \ALT_INV_funct[3]~input_o\,
	datae => \ALT_INV_ULAop[1]~input_o\,
	dataf => \ucULA|ALT_INV_ulaCtrl~0_combout\,
	combout => \ucULA|ulaCtrl[0]~1_combout\);

\ULA|ula0|inverteB|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|inverteB|saida_MUX~0_combout\ = !\B[0]~input_o\ $ (!\ucULA|ulaCtrl[0]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datab => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	combout => \ULA|ula0|inverteB|saida_MUX~0_combout\);

\ucULA|ulaCtrl~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ucULA|ulaCtrl~2_combout\ = (!\funct[0]~input_o\ & (!\funct[2]~input_o\ & \ucULA|ulaCtrl~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_funct[0]~input_o\,
	datab => \ALT_INV_funct[2]~input_o\,
	datac => \ucULA|ALT_INV_ulaCtrl~0_combout\,
	combout => \ucULA|ulaCtrl~2_combout\);

\ULA|ula0|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|muxULA|saida_MUX~0_combout\ = (\ULAop[1]~input_o\ & ((!\ucULA|ulaCtrl~2_combout\) # ((!\funct[1]~input_o\ & \funct[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000010000011110000001000001111000000100000111100000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_funct[1]~input_o\,
	datab => \ALT_INV_funct[3]~input_o\,
	datac => \ALT_INV_ULAop[1]~input_o\,
	datad => \ucULA|ALT_INV_ulaCtrl~2_combout\,
	combout => \ULA|ula0|muxULA|saida_MUX~0_combout\);

\ULA|ula31|muxULA|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|muxULA|Equal1~0_combout\ = ( \ucULA|ulaCtrl~2_combout\ & ( (!\ULAop[1]~input_o\ & (((!\ULAop[0]~input_o\)))) # (\ULAop[1]~input_o\ & (!\funct[1]~input_o\ & (!\funct[3]~input_o\))) ) ) # ( !\ucULA|ulaCtrl~2_combout\ & ( (!\ULAop[1]~input_o\ & 
-- !\ULAop[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111110000000100011110000000000001111100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_funct[1]~input_o\,
	datab => \ALT_INV_funct[3]~input_o\,
	datac => \ALT_INV_ULAop[1]~input_o\,
	datad => \ALT_INV_ULAop[0]~input_o\,
	datae => \ucULA|ALT_INV_ulaCtrl~2_combout\,
	combout => \ULA|ula31|muxULA|Equal1~0_combout\);

\A[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(17),
	o => \A[17]~input_o\);

\B[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(17),
	o => \B[17]~input_o\);

\A[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(20),
	o => \A[20]~input_o\);

\B[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(20),
	o => \B[20]~input_o\);

\A[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(19),
	o => \A[19]~input_o\);

\B[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(19),
	o => \B[19]~input_o\);

\A[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(18),
	o => \A[18]~input_o\);

\B[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(18),
	o => \B[18]~input_o\);

\ULA|ula20|SomaSubtrai|saidaAND_XOR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\ = ( !\A[18]~input_o\ & ( \B[18]~input_o\ & ( (!\A[20]~input_o\ & (\B[20]~input_o\ & (!\A[19]~input_o\ $ (!\B[19]~input_o\)))) # (\A[20]~input_o\ & (!\B[20]~input_o\ & (!\A[19]~input_o\ $ (!\B[19]~input_o\)))) 
-- ) ) ) # ( \A[18]~input_o\ & ( !\B[18]~input_o\ & ( (!\A[20]~input_o\ & (\B[20]~input_o\ & (!\A[19]~input_o\ $ (!\B[19]~input_o\)))) # (\A[20]~input_o\ & (!\B[20]~input_o\ & (!\A[19]~input_o\ $ (!\B[19]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001100110000000000110011000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[20]~input_o\,
	datab => \ALT_INV_B[20]~input_o\,
	datac => \ALT_INV_A[19]~input_o\,
	datad => \ALT_INV_B[19]~input_o\,
	datae => \ALT_INV_A[18]~input_o\,
	dataf => \ALT_INV_B[18]~input_o\,
	combout => \ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\);

\A[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(16),
	o => \A[16]~input_o\);

\B[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(16),
	o => \B[16]~input_o\);

\A[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(15),
	o => \A[15]~input_o\);

\B[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(15),
	o => \B[15]~input_o\);

\ULA|ula15|SomaSubtrai|saidaXOR_AB\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|SomaSubtrai|saidaXOR_AB~combout\ = !\A[15]~input_o\ $ (!\B[15]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[15]~input_o\,
	datab => \ALT_INV_B[15]~input_o\,
	combout => \ULA|ula15|SomaSubtrai|saidaXOR_AB~combout\);

\ULA|ula20|SomaSubtrai|saidaAND_XOR~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|SomaSubtrai|saidaAND_XOR~1_combout\ = ( \B[16]~input_o\ & ( \ULA|ula15|SomaSubtrai|saidaXOR_AB~combout\ & ( (\ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\ & (!\A[16]~input_o\ & (!\A[17]~input_o\ $ (!\B[17]~input_o\)))) ) ) ) # ( 
-- !\B[16]~input_o\ & ( \ULA|ula15|SomaSubtrai|saidaXOR_AB~combout\ & ( (\ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\ & (\A[16]~input_o\ & (!\A[17]~input_o\ $ (!\B[17]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001100000011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[17]~input_o\,
	datab => \ALT_INV_B[17]~input_o\,
	datac => \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ALT_INV_A[16]~input_o\,
	datae => \ALT_INV_B[16]~input_o\,
	dataf => \ULA|ula15|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	combout => \ULA|ula20|SomaSubtrai|saidaAND_XOR~1_combout\);

\A[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(14),
	o => \A[14]~input_o\);

\B[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(14),
	o => \B[14]~input_o\);

\ULA|ula14|SomaSubtrai|saidaXOR_AB\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|SomaSubtrai|saidaXOR_AB~combout\ = !\A[14]~input_o\ $ (!\B[14]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[14]~input_o\,
	datab => \ALT_INV_B[14]~input_o\,
	combout => \ULA|ula14|SomaSubtrai|saidaXOR_AB~combout\);

\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

\A[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(6),
	o => \A[6]~input_o\);

\B[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(6),
	o => \B[6]~input_o\);

\A[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(5),
	o => \A[5]~input_o\);

\B[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(5),
	o => \B[5]~input_o\);

\A[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

\B[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(4),
	o => \B[4]~input_o\);

\ULA|ula6|SomaSubtrai|saidaAND_XOR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|SomaSubtrai|saidaAND_XOR~0_combout\ = ( !\A[4]~input_o\ & ( \B[4]~input_o\ & ( (!\A[6]~input_o\ & (\B[6]~input_o\ & (!\A[5]~input_o\ $ (!\B[5]~input_o\)))) # (\A[6]~input_o\ & (!\B[6]~input_o\ & (!\A[5]~input_o\ $ (!\B[5]~input_o\)))) ) ) ) # ( 
-- \A[4]~input_o\ & ( !\B[4]~input_o\ & ( (!\A[6]~input_o\ & (\B[6]~input_o\ & (!\A[5]~input_o\ $ (!\B[5]~input_o\)))) # (\A[6]~input_o\ & (!\B[6]~input_o\ & (!\A[5]~input_o\ $ (!\B[5]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001100110000000000110011000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[6]~input_o\,
	datab => \ALT_INV_B[6]~input_o\,
	datac => \ALT_INV_A[5]~input_o\,
	datad => \ALT_INV_B[5]~input_o\,
	datae => \ALT_INV_A[4]~input_o\,
	dataf => \ALT_INV_B[4]~input_o\,
	combout => \ULA|ula6|SomaSubtrai|saidaAND_XOR~0_combout\);

\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

\ULA|ula6|SomaSubtrai|saidaAND_XOR~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|SomaSubtrai|saidaAND_XOR~1_combout\ = ( \B[2]~input_o\ & ( (\ULA|ula6|SomaSubtrai|saidaAND_XOR~0_combout\ & (!\A[2]~input_o\ & (!\A[3]~input_o\ $ (!\B[3]~input_o\)))) ) ) # ( !\B[2]~input_o\ & ( (\ULA|ula6|SomaSubtrai|saidaAND_XOR~0_combout\ & 
-- (\A[2]~input_o\ & (!\A[3]~input_o\ $ (!\B[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000110000001100000000000000000000001100000011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datab => \ALT_INV_B[3]~input_o\,
	datac => \ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ALT_INV_A[2]~input_o\,
	datae => \ALT_INV_B[2]~input_o\,
	combout => \ULA|ula6|SomaSubtrai|saidaAND_XOR~1_combout\);

\ULA|ula6|SomaSubtrai|saidaAND_XOR~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|SomaSubtrai|saidaAND_XOR~2_combout\ = ( \B[1]~input_o\ & ( \ULA|ula6|SomaSubtrai|saidaAND_XOR~1_combout\ & ( (\ucULA|ulaCtrl[0]~1_combout\ & (!\A[1]~input_o\ & (!\A[0]~input_o\ $ (!\B[0]~input_o\)))) ) ) ) # ( !\B[1]~input_o\ & ( 
-- \ULA|ula6|SomaSubtrai|saidaAND_XOR~1_combout\ & ( (\ucULA|ulaCtrl[0]~1_combout\ & (\A[1]~input_o\ & (!\A[0]~input_o\ $ (!\B[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001100000011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_B[0]~input_o\,
	datac => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datad => \ALT_INV_A[1]~input_o\,
	datae => \ALT_INV_B[1]~input_o\,
	dataf => \ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\,
	combout => \ULA|ula6|SomaSubtrai|saidaAND_XOR~2_combout\);

\ULA|ula6|SomaSubtrai|vaiUM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|SomaSubtrai|vaiUM~0_combout\ = ( \A[4]~input_o\ & ( \B[4]~input_o\ & ( (!\A[6]~input_o\ & (\B[6]~input_o\ & ((\B[5]~input_o\) # (\A[5]~input_o\)))) # (\A[6]~input_o\ & (((\B[5]~input_o\) # (\A[5]~input_o\)) # (\B[6]~input_o\))) ) ) ) # ( 
-- !\A[4]~input_o\ & ( \B[4]~input_o\ & ( (!\A[6]~input_o\ & (\B[6]~input_o\ & (\A[5]~input_o\ & \B[5]~input_o\))) # (\A[6]~input_o\ & (((\A[5]~input_o\ & \B[5]~input_o\)) # (\B[6]~input_o\))) ) ) ) # ( \A[4]~input_o\ & ( !\B[4]~input_o\ & ( (!\A[6]~input_o\ 
-- & (\B[6]~input_o\ & (\A[5]~input_o\ & \B[5]~input_o\))) # (\A[6]~input_o\ & (((\A[5]~input_o\ & \B[5]~input_o\)) # (\B[6]~input_o\))) ) ) ) # ( !\A[4]~input_o\ & ( !\B[4]~input_o\ & ( (!\A[6]~input_o\ & (\B[6]~input_o\ & (\A[5]~input_o\ & 
-- \B[5]~input_o\))) # (\A[6]~input_o\ & (((\A[5]~input_o\ & \B[5]~input_o\)) # (\B[6]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010111000100010001011100010001000101110001011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[6]~input_o\,
	datab => \ALT_INV_B[6]~input_o\,
	datac => \ALT_INV_A[5]~input_o\,
	datad => \ALT_INV_B[5]~input_o\,
	datae => \ALT_INV_A[4]~input_o\,
	dataf => \ALT_INV_B[4]~input_o\,
	combout => \ULA|ula6|SomaSubtrai|vaiUM~0_combout\);

\ULA|ula6|SomaSubtrai|vaiUM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|SomaSubtrai|vaiUM~1_combout\ = ( \B[2]~input_o\ & ( !\ULA|ula6|SomaSubtrai|vaiUM~0_combout\ & ( (!\ULA|ula6|SomaSubtrai|saidaAND_XOR~0_combout\) # ((!\A[3]~input_o\ & ((!\B[3]~input_o\) # (!\A[2]~input_o\))) # (\A[3]~input_o\ & (!\B[3]~input_o\ 
-- & !\A[2]~input_o\))) ) ) ) # ( !\B[2]~input_o\ & ( !\ULA|ula6|SomaSubtrai|vaiUM~0_combout\ & ( (!\A[3]~input_o\) # ((!\B[3]~input_o\) # (!\ULA|ula6|SomaSubtrai|saidaAND_XOR~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111011111110111111101111100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datab => \ALT_INV_B[3]~input_o\,
	datac => \ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ALT_INV_A[2]~input_o\,
	datae => \ALT_INV_B[2]~input_o\,
	dataf => \ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~0_combout\,
	combout => \ULA|ula6|SomaSubtrai|vaiUM~1_combout\);

\ULA|ula6|SomaSubtrai|vaiUM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|SomaSubtrai|vaiUM~2_combout\ = ( \ULA|ula6|SomaSubtrai|saidaAND_XOR~1_combout\ & ( \ULA|ula6|SomaSubtrai|vaiUM~1_combout\ & ( (!\A[1]~input_o\ & ((!\A[0]~input_o\) # ((!\B[0]~input_o\) # (!\B[1]~input_o\)))) # (\A[1]~input_o\ & (!\B[1]~input_o\ 
-- & ((!\A[0]~input_o\) # (!\B[0]~input_o\)))) ) ) ) # ( !\ULA|ula6|SomaSubtrai|saidaAND_XOR~1_combout\ & ( \ULA|ula6|SomaSubtrai|vaiUM~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111011100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	datad => \ALT_INV_B[1]~input_o\,
	datae => \ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\,
	dataf => \ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~1_combout\,
	combout => \ULA|ula6|SomaSubtrai|vaiUM~2_combout\);

\A[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(10),
	o => \A[10]~input_o\);

\B[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(10),
	o => \B[10]~input_o\);

\A[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(13),
	o => \A[13]~input_o\);

\B[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(13),
	o => \B[13]~input_o\);

\A[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(12),
	o => \A[12]~input_o\);

\B[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(12),
	o => \B[12]~input_o\);

\A[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(11),
	o => \A[11]~input_o\);

\B[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(11),
	o => \B[11]~input_o\);

\ULA|ula13|SomaSubtrai|saidaAND_XOR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|SomaSubtrai|saidaAND_XOR~0_combout\ = ( !\A[11]~input_o\ & ( \B[11]~input_o\ & ( (!\A[13]~input_o\ & (\B[13]~input_o\ & (!\A[12]~input_o\ $ (!\B[12]~input_o\)))) # (\A[13]~input_o\ & (!\B[13]~input_o\ & (!\A[12]~input_o\ $ (!\B[12]~input_o\)))) 
-- ) ) ) # ( \A[11]~input_o\ & ( !\B[11]~input_o\ & ( (!\A[13]~input_o\ & (\B[13]~input_o\ & (!\A[12]~input_o\ $ (!\B[12]~input_o\)))) # (\A[13]~input_o\ & (!\B[13]~input_o\ & (!\A[12]~input_o\ $ (!\B[12]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001100110000000000110011000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[13]~input_o\,
	datab => \ALT_INV_B[13]~input_o\,
	datac => \ALT_INV_A[12]~input_o\,
	datad => \ALT_INV_B[12]~input_o\,
	datae => \ALT_INV_A[11]~input_o\,
	dataf => \ALT_INV_B[11]~input_o\,
	combout => \ULA|ula13|SomaSubtrai|saidaAND_XOR~0_combout\);

\A[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(9),
	o => \A[9]~input_o\);

\B[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(9),
	o => \B[9]~input_o\);

\ULA|ula9|SomaSubtrai|saidaXOR_AB\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|SomaSubtrai|saidaXOR_AB~combout\ = !\A[9]~input_o\ $ (!\B[9]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[9]~input_o\,
	datab => \ALT_INV_B[9]~input_o\,
	combout => \ULA|ula9|SomaSubtrai|saidaXOR_AB~combout\);

\A[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(8),
	o => \A[8]~input_o\);

\B[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(8),
	o => \B[8]~input_o\);

\ULA|ula8|SomaSubtrai|saidaXOR_AB\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|SomaSubtrai|saidaXOR_AB~combout\ = !\A[8]~input_o\ $ (!\B[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[8]~input_o\,
	datab => \ALT_INV_B[8]~input_o\,
	combout => \ULA|ula8|SomaSubtrai|saidaXOR_AB~combout\);

\A[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(7),
	o => \A[7]~input_o\);

\B[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(7),
	o => \B[7]~input_o\);

\ULA|ula7|SomaSubtrai|saidaXOR_AB\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|SomaSubtrai|saidaXOR_AB~combout\ = !\A[7]~input_o\ $ (!\B[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[7]~input_o\,
	datab => \ALT_INV_B[7]~input_o\,
	combout => \ULA|ula7|SomaSubtrai|saidaXOR_AB~combout\);

\ULA|ula13|SomaSubtrai|saidaAND_XOR~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|SomaSubtrai|saidaAND_XOR~1_combout\ = ( \ULA|ula8|SomaSubtrai|saidaXOR_AB~combout\ & ( \ULA|ula7|SomaSubtrai|saidaXOR_AB~combout\ & ( (\ULA|ula13|SomaSubtrai|saidaAND_XOR~0_combout\ & (\ULA|ula9|SomaSubtrai|saidaXOR_AB~combout\ & 
-- (!\A[10]~input_o\ $ (!\B[10]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[10]~input_o\,
	datab => \ALT_INV_B[10]~input_o\,
	datac => \ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ULA|ula9|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	datae => \ULA|ula8|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	dataf => \ULA|ula7|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	combout => \ULA|ula13|SomaSubtrai|saidaAND_XOR~1_combout\);

\ULA|ula13|SomaSubtrai|saidaAND_XOR~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|SomaSubtrai|saidaAND_XOR~2_combout\ = (\ULA|ula13|SomaSubtrai|saidaAND_XOR~0_combout\ & (\ULA|ula9|SomaSubtrai|saidaXOR_AB~combout\ & (!\A[10]~input_o\ $ (!\B[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000110000000000000011000000000000001100000000000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[10]~input_o\,
	datab => \ALT_INV_B[10]~input_o\,
	datac => \ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ULA|ula9|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	combout => \ULA|ula13|SomaSubtrai|saidaAND_XOR~2_combout\);

\ULA|ula13|SomaSubtrai|vaiUM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|SomaSubtrai|vaiUM~0_combout\ = ( \A[11]~input_o\ & ( \B[11]~input_o\ & ( (!\A[13]~input_o\ & (\B[13]~input_o\ & ((\B[12]~input_o\) # (\A[12]~input_o\)))) # (\A[13]~input_o\ & (((\B[12]~input_o\) # (\A[12]~input_o\)) # (\B[13]~input_o\))) ) ) ) 
-- # ( !\A[11]~input_o\ & ( \B[11]~input_o\ & ( (!\A[13]~input_o\ & (\B[13]~input_o\ & (\A[12]~input_o\ & \B[12]~input_o\))) # (\A[13]~input_o\ & (((\A[12]~input_o\ & \B[12]~input_o\)) # (\B[13]~input_o\))) ) ) ) # ( \A[11]~input_o\ & ( !\B[11]~input_o\ & ( 
-- (!\A[13]~input_o\ & (\B[13]~input_o\ & (\A[12]~input_o\ & \B[12]~input_o\))) # (\A[13]~input_o\ & (((\A[12]~input_o\ & \B[12]~input_o\)) # (\B[13]~input_o\))) ) ) ) # ( !\A[11]~input_o\ & ( !\B[11]~input_o\ & ( (!\A[13]~input_o\ & (\B[13]~input_o\ & 
-- (\A[12]~input_o\ & \B[12]~input_o\))) # (\A[13]~input_o\ & (((\A[12]~input_o\ & \B[12]~input_o\)) # (\B[13]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010111000100010001011100010001000101110001011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[13]~input_o\,
	datab => \ALT_INV_B[13]~input_o\,
	datac => \ALT_INV_A[12]~input_o\,
	datad => \ALT_INV_B[12]~input_o\,
	datae => \ALT_INV_A[11]~input_o\,
	dataf => \ALT_INV_B[11]~input_o\,
	combout => \ULA|ula13|SomaSubtrai|vaiUM~0_combout\);

\ULA|ula13|SomaSubtrai|vaiUM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|SomaSubtrai|vaiUM~1_combout\ = ( \B[9]~input_o\ & ( !\ULA|ula13|SomaSubtrai|vaiUM~0_combout\ & ( (!\ULA|ula13|SomaSubtrai|saidaAND_XOR~0_combout\) # ((!\A[10]~input_o\ & ((!\B[10]~input_o\) # (!\A[9]~input_o\))) # (\A[10]~input_o\ & 
-- (!\B[10]~input_o\ & !\A[9]~input_o\))) ) ) ) # ( !\B[9]~input_o\ & ( !\ULA|ula13|SomaSubtrai|vaiUM~0_combout\ & ( (!\A[10]~input_o\) # ((!\B[10]~input_o\) # (!\ULA|ula13|SomaSubtrai|saidaAND_XOR~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111011111110111111101111100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[10]~input_o\,
	datab => \ALT_INV_B[10]~input_o\,
	datac => \ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ALT_INV_A[9]~input_o\,
	datae => \ALT_INV_B[9]~input_o\,
	dataf => \ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~0_combout\,
	combout => \ULA|ula13|SomaSubtrai|vaiUM~1_combout\);

\ULA|ula13|SomaSubtrai|vaiUM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|SomaSubtrai|vaiUM~2_combout\ = ( \B[7]~input_o\ & ( \ULA|ula13|SomaSubtrai|vaiUM~1_combout\ & ( (!\ULA|ula13|SomaSubtrai|saidaAND_XOR~2_combout\) # ((!\A[8]~input_o\ & ((!\B[8]~input_o\) # (!\A[7]~input_o\))) # (\A[8]~input_o\ & 
-- (!\B[8]~input_o\ & !\A[7]~input_o\))) ) ) ) # ( !\B[7]~input_o\ & ( \ULA|ula13|SomaSubtrai|vaiUM~1_combout\ & ( (!\A[8]~input_o\) # ((!\B[8]~input_o\) # (!\ULA|ula13|SomaSubtrai|saidaAND_XOR~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111110111111101111111011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[8]~input_o\,
	datab => \ALT_INV_B[8]~input_o\,
	datac => \ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\,
	datad => \ALT_INV_A[7]~input_o\,
	datae => \ALT_INV_B[7]~input_o\,
	dataf => \ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~1_combout\,
	combout => \ULA|ula13|SomaSubtrai|vaiUM~2_combout\);

\ULA|ula20|SomaSubtrai|saidaAND_XOR~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|SomaSubtrai|saidaAND_XOR~2_combout\ = ( \ULA|ula13|SomaSubtrai|saidaAND_XOR~1_combout\ & ( \ULA|ula13|SomaSubtrai|vaiUM~2_combout\ & ( (\ULA|ula20|SomaSubtrai|saidaAND_XOR~1_combout\ & (\ULA|ula14|SomaSubtrai|saidaXOR_AB~combout\ & 
-- ((!\ULA|ula6|SomaSubtrai|vaiUM~2_combout\) # (\ULA|ula6|SomaSubtrai|saidaAND_XOR~2_combout\)))) ) ) ) # ( \ULA|ula13|SomaSubtrai|saidaAND_XOR~1_combout\ & ( !\ULA|ula13|SomaSubtrai|vaiUM~2_combout\ & ( (\ULA|ula20|SomaSubtrai|saidaAND_XOR~1_combout\ & 
-- \ULA|ula14|SomaSubtrai|saidaXOR_AB~combout\) ) ) ) # ( !\ULA|ula13|SomaSubtrai|saidaAND_XOR~1_combout\ & ( !\ULA|ula13|SomaSubtrai|vaiUM~2_combout\ & ( (\ULA|ula20|SomaSubtrai|saidaAND_XOR~1_combout\ & \ULA|ula14|SomaSubtrai|saidaXOR_AB~combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100000000000000000001000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\,
	datab => \ULA|ula14|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	datac => \ULA|ula6|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\,
	datad => \ULA|ula6|SomaSubtrai|ALT_INV_vaiUM~2_combout\,
	datae => \ULA|ula13|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\,
	dataf => \ULA|ula13|SomaSubtrai|ALT_INV_vaiUM~2_combout\,
	combout => \ULA|ula20|SomaSubtrai|saidaAND_XOR~2_combout\);

\ULA|ula20|SomaSubtrai|saidaAND_XOR~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|SomaSubtrai|saidaAND_XOR~3_combout\ = ( \B[16]~input_o\ & ( (\ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\ & (!\A[16]~input_o\ & (!\A[17]~input_o\ $ (!\B[17]~input_o\)))) ) ) # ( !\B[16]~input_o\ & ( 
-- (\ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\ & (\A[16]~input_o\ & (!\A[17]~input_o\ $ (!\B[17]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000110000001100000000000000000000001100000011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[17]~input_o\,
	datab => \ALT_INV_B[17]~input_o\,
	datac => \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ALT_INV_A[16]~input_o\,
	datae => \ALT_INV_B[16]~input_o\,
	combout => \ULA|ula20|SomaSubtrai|saidaAND_XOR~3_combout\);

\ULA|ula20|SomaSubtrai|vaiUM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|SomaSubtrai|vaiUM~0_combout\ = ( \A[18]~input_o\ & ( \B[18]~input_o\ & ( (!\A[20]~input_o\ & (\B[20]~input_o\ & ((\B[19]~input_o\) # (\A[19]~input_o\)))) # (\A[20]~input_o\ & (((\B[19]~input_o\) # (\A[19]~input_o\)) # (\B[20]~input_o\))) ) ) ) 
-- # ( !\A[18]~input_o\ & ( \B[18]~input_o\ & ( (!\A[20]~input_o\ & (\B[20]~input_o\ & (\A[19]~input_o\ & \B[19]~input_o\))) # (\A[20]~input_o\ & (((\A[19]~input_o\ & \B[19]~input_o\)) # (\B[20]~input_o\))) ) ) ) # ( \A[18]~input_o\ & ( !\B[18]~input_o\ & ( 
-- (!\A[20]~input_o\ & (\B[20]~input_o\ & (\A[19]~input_o\ & \B[19]~input_o\))) # (\A[20]~input_o\ & (((\A[19]~input_o\ & \B[19]~input_o\)) # (\B[20]~input_o\))) ) ) ) # ( !\A[18]~input_o\ & ( !\B[18]~input_o\ & ( (!\A[20]~input_o\ & (\B[20]~input_o\ & 
-- (\A[19]~input_o\ & \B[19]~input_o\))) # (\A[20]~input_o\ & (((\A[19]~input_o\ & \B[19]~input_o\)) # (\B[20]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010111000100010001011100010001000101110001011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[20]~input_o\,
	datab => \ALT_INV_B[20]~input_o\,
	datac => \ALT_INV_A[19]~input_o\,
	datad => \ALT_INV_B[19]~input_o\,
	datae => \ALT_INV_A[18]~input_o\,
	dataf => \ALT_INV_B[18]~input_o\,
	combout => \ULA|ula20|SomaSubtrai|vaiUM~0_combout\);

\ULA|ula20|SomaSubtrai|vaiUM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|SomaSubtrai|vaiUM~1_combout\ = ( \B[16]~input_o\ & ( !\ULA|ula20|SomaSubtrai|vaiUM~0_combout\ & ( (!\ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\) # ((!\A[17]~input_o\ & ((!\B[17]~input_o\) # (!\A[16]~input_o\))) # (\A[17]~input_o\ & 
-- (!\B[17]~input_o\ & !\A[16]~input_o\))) ) ) ) # ( !\B[16]~input_o\ & ( !\ULA|ula20|SomaSubtrai|vaiUM~0_combout\ & ( (!\A[17]~input_o\) # ((!\B[17]~input_o\) # (!\ULA|ula20|SomaSubtrai|saidaAND_XOR~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111011111110111111101111100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[17]~input_o\,
	datab => \ALT_INV_B[17]~input_o\,
	datac => \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ALT_INV_A[16]~input_o\,
	datae => \ALT_INV_B[16]~input_o\,
	dataf => \ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~0_combout\,
	combout => \ULA|ula20|SomaSubtrai|vaiUM~1_combout\);

\ULA|ula20|SomaSubtrai|vaiUM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|SomaSubtrai|vaiUM~2_combout\ = ( \B[14]~input_o\ & ( \ULA|ula20|SomaSubtrai|vaiUM~1_combout\ & ( (!\ULA|ula20|SomaSubtrai|saidaAND_XOR~3_combout\) # ((!\A[15]~input_o\ & ((!\B[15]~input_o\) # (!\A[14]~input_o\))) # (\A[15]~input_o\ & 
-- (!\B[15]~input_o\ & !\A[14]~input_o\))) ) ) ) # ( !\B[14]~input_o\ & ( \ULA|ula20|SomaSubtrai|vaiUM~1_combout\ & ( (!\A[15]~input_o\) # ((!\B[15]~input_o\) # (!\ULA|ula20|SomaSubtrai|saidaAND_XOR~3_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111110111111101111111011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[15]~input_o\,
	datab => \ALT_INV_B[15]~input_o\,
	datac => \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~3_combout\,
	datad => \ALT_INV_A[14]~input_o\,
	datae => \ALT_INV_B[14]~input_o\,
	dataf => \ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~1_combout\,
	combout => \ULA|ula20|SomaSubtrai|vaiUM~2_combout\);

\A[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(24),
	o => \A[24]~input_o\);

\B[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(24),
	o => \B[24]~input_o\);

\A[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(27),
	o => \A[27]~input_o\);

\B[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(27),
	o => \B[27]~input_o\);

\A[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(26),
	o => \A[26]~input_o\);

\B[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(26),
	o => \B[26]~input_o\);

\A[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(25),
	o => \A[25]~input_o\);

\B[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(25),
	o => \B[25]~input_o\);

\ULA|ula27|SomaSubtrai|saidaAND_XOR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|SomaSubtrai|saidaAND_XOR~0_combout\ = ( !\A[25]~input_o\ & ( \B[25]~input_o\ & ( (!\A[27]~input_o\ & (\B[27]~input_o\ & (!\A[26]~input_o\ $ (!\B[26]~input_o\)))) # (\A[27]~input_o\ & (!\B[27]~input_o\ & (!\A[26]~input_o\ $ (!\B[26]~input_o\)))) 
-- ) ) ) # ( \A[25]~input_o\ & ( !\B[25]~input_o\ & ( (!\A[27]~input_o\ & (\B[27]~input_o\ & (!\A[26]~input_o\ $ (!\B[26]~input_o\)))) # (\A[27]~input_o\ & (!\B[27]~input_o\ & (!\A[26]~input_o\ $ (!\B[26]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001100110000000000110011000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[27]~input_o\,
	datab => \ALT_INV_B[27]~input_o\,
	datac => \ALT_INV_A[26]~input_o\,
	datad => \ALT_INV_B[26]~input_o\,
	datae => \ALT_INV_A[25]~input_o\,
	dataf => \ALT_INV_B[25]~input_o\,
	combout => \ULA|ula27|SomaSubtrai|saidaAND_XOR~0_combout\);

\A[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(23),
	o => \A[23]~input_o\);

\B[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(23),
	o => \B[23]~input_o\);

\ULA|ula23|SomaSubtrai|saidaXOR_AB\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|SomaSubtrai|saidaXOR_AB~combout\ = !\A[23]~input_o\ $ (!\B[23]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[23]~input_o\,
	datab => \ALT_INV_B[23]~input_o\,
	combout => \ULA|ula23|SomaSubtrai|saidaXOR_AB~combout\);

\A[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(22),
	o => \A[22]~input_o\);

\B[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(22),
	o => \B[22]~input_o\);

\ULA|ula22|SomaSubtrai|saidaXOR_AB\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|SomaSubtrai|saidaXOR_AB~combout\ = !\A[22]~input_o\ $ (!\B[22]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[22]~input_o\,
	datab => \ALT_INV_B[22]~input_o\,
	combout => \ULA|ula22|SomaSubtrai|saidaXOR_AB~combout\);

\A[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(21),
	o => \A[21]~input_o\);

\B[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(21),
	o => \B[21]~input_o\);

\ULA|ula21|SomaSubtrai|saidaXOR_AB\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|SomaSubtrai|saidaXOR_AB~combout\ = !\A[21]~input_o\ $ (!\B[21]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[21]~input_o\,
	datab => \ALT_INV_B[21]~input_o\,
	combout => \ULA|ula21|SomaSubtrai|saidaXOR_AB~combout\);

\ULA|ula27|SomaSubtrai|saidaAND_XOR~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|SomaSubtrai|saidaAND_XOR~1_combout\ = ( \ULA|ula22|SomaSubtrai|saidaXOR_AB~combout\ & ( \ULA|ula21|SomaSubtrai|saidaXOR_AB~combout\ & ( (\ULA|ula27|SomaSubtrai|saidaAND_XOR~0_combout\ & (\ULA|ula23|SomaSubtrai|saidaXOR_AB~combout\ & 
-- (!\A[24]~input_o\ $ (!\B[24]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[24]~input_o\,
	datab => \ALT_INV_B[24]~input_o\,
	datac => \ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ULA|ula23|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	datae => \ULA|ula22|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	dataf => \ULA|ula21|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	combout => \ULA|ula27|SomaSubtrai|saidaAND_XOR~1_combout\);

\ULA|ula27|SomaSubtrai|saidaAND_XOR~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|SomaSubtrai|saidaAND_XOR~2_combout\ = (\ULA|ula27|SomaSubtrai|saidaAND_XOR~0_combout\ & (\ULA|ula23|SomaSubtrai|saidaXOR_AB~combout\ & (!\A[24]~input_o\ $ (!\B[24]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000110000000000000011000000000000001100000000000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[24]~input_o\,
	datab => \ALT_INV_B[24]~input_o\,
	datac => \ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ULA|ula23|SomaSubtrai|ALT_INV_saidaXOR_AB~combout\,
	combout => \ULA|ula27|SomaSubtrai|saidaAND_XOR~2_combout\);

\ULA|ula27|SomaSubtrai|vaiUM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|SomaSubtrai|vaiUM~0_combout\ = ( \A[25]~input_o\ & ( \B[25]~input_o\ & ( (!\A[27]~input_o\ & (\B[27]~input_o\ & ((\B[26]~input_o\) # (\A[26]~input_o\)))) # (\A[27]~input_o\ & (((\B[26]~input_o\) # (\A[26]~input_o\)) # (\B[27]~input_o\))) ) ) ) 
-- # ( !\A[25]~input_o\ & ( \B[25]~input_o\ & ( (!\A[27]~input_o\ & (\B[27]~input_o\ & (\A[26]~input_o\ & \B[26]~input_o\))) # (\A[27]~input_o\ & (((\A[26]~input_o\ & \B[26]~input_o\)) # (\B[27]~input_o\))) ) ) ) # ( \A[25]~input_o\ & ( !\B[25]~input_o\ & ( 
-- (!\A[27]~input_o\ & (\B[27]~input_o\ & (\A[26]~input_o\ & \B[26]~input_o\))) # (\A[27]~input_o\ & (((\A[26]~input_o\ & \B[26]~input_o\)) # (\B[27]~input_o\))) ) ) ) # ( !\A[25]~input_o\ & ( !\B[25]~input_o\ & ( (!\A[27]~input_o\ & (\B[27]~input_o\ & 
-- (\A[26]~input_o\ & \B[26]~input_o\))) # (\A[27]~input_o\ & (((\A[26]~input_o\ & \B[26]~input_o\)) # (\B[27]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010111000100010001011100010001000101110001011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[27]~input_o\,
	datab => \ALT_INV_B[27]~input_o\,
	datac => \ALT_INV_A[26]~input_o\,
	datad => \ALT_INV_B[26]~input_o\,
	datae => \ALT_INV_A[25]~input_o\,
	dataf => \ALT_INV_B[25]~input_o\,
	combout => \ULA|ula27|SomaSubtrai|vaiUM~0_combout\);

\ULA|ula27|SomaSubtrai|vaiUM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|SomaSubtrai|vaiUM~1_combout\ = ( \B[23]~input_o\ & ( !\ULA|ula27|SomaSubtrai|vaiUM~0_combout\ & ( (!\ULA|ula27|SomaSubtrai|saidaAND_XOR~0_combout\) # ((!\A[24]~input_o\ & ((!\B[24]~input_o\) # (!\A[23]~input_o\))) # (\A[24]~input_o\ & 
-- (!\B[24]~input_o\ & !\A[23]~input_o\))) ) ) ) # ( !\B[23]~input_o\ & ( !\ULA|ula27|SomaSubtrai|vaiUM~0_combout\ & ( (!\A[24]~input_o\) # ((!\B[24]~input_o\) # (!\ULA|ula27|SomaSubtrai|saidaAND_XOR~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111011111110111111101111100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[24]~input_o\,
	datab => \ALT_INV_B[24]~input_o\,
	datac => \ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	datad => \ALT_INV_A[23]~input_o\,
	datae => \ALT_INV_B[23]~input_o\,
	dataf => \ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~0_combout\,
	combout => \ULA|ula27|SomaSubtrai|vaiUM~1_combout\);

\ULA|ula27|SomaSubtrai|vaiUM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|SomaSubtrai|vaiUM~2_combout\ = ( \B[21]~input_o\ & ( \ULA|ula27|SomaSubtrai|vaiUM~1_combout\ & ( (!\ULA|ula27|SomaSubtrai|saidaAND_XOR~2_combout\) # ((!\A[22]~input_o\ & ((!\B[22]~input_o\) # (!\A[21]~input_o\))) # (\A[22]~input_o\ & 
-- (!\B[22]~input_o\ & !\A[21]~input_o\))) ) ) ) # ( !\B[21]~input_o\ & ( \ULA|ula27|SomaSubtrai|vaiUM~1_combout\ & ( (!\A[22]~input_o\) # ((!\B[22]~input_o\) # (!\ULA|ula27|SomaSubtrai|saidaAND_XOR~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111110111111101111111011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[22]~input_o\,
	datab => \ALT_INV_B[22]~input_o\,
	datac => \ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\,
	datad => \ALT_INV_A[21]~input_o\,
	datae => \ALT_INV_B[21]~input_o\,
	dataf => \ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~1_combout\,
	combout => \ULA|ula27|SomaSubtrai|vaiUM~2_combout\);

\A[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(30),
	o => \A[30]~input_o\);

\B[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(30),
	o => \B[30]~input_o\);

\A[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(29),
	o => \A[29]~input_o\);

\B[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(29),
	o => \B[29]~input_o\);

\A[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(28),
	o => \A[28]~input_o\);

\B[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(28),
	o => \B[28]~input_o\);

\ULA|ula30|SomaSubtrai|saidaAND_XOR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|SomaSubtrai|saidaAND_XOR~0_combout\ = ( !\A[28]~input_o\ & ( \B[28]~input_o\ & ( (!\A[30]~input_o\ & (\B[30]~input_o\ & (!\A[29]~input_o\ $ (!\B[29]~input_o\)))) # (\A[30]~input_o\ & (!\B[30]~input_o\ & (!\A[29]~input_o\ $ (!\B[29]~input_o\)))) 
-- ) ) ) # ( \A[28]~input_o\ & ( !\B[28]~input_o\ & ( (!\A[30]~input_o\ & (\B[30]~input_o\ & (!\A[29]~input_o\ $ (!\B[29]~input_o\)))) # (\A[30]~input_o\ & (!\B[30]~input_o\ & (!\A[29]~input_o\ $ (!\B[29]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001100110000000000110011000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[30]~input_o\,
	datab => \ALT_INV_B[30]~input_o\,
	datac => \ALT_INV_A[29]~input_o\,
	datad => \ALT_INV_B[29]~input_o\,
	datae => \ALT_INV_A[28]~input_o\,
	dataf => \ALT_INV_B[28]~input_o\,
	combout => \ULA|ula30|SomaSubtrai|saidaAND_XOR~0_combout\);

\ULA|ula30|SomaSubtrai|vaiUM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|SomaSubtrai|vaiUM~0_combout\ = ( \A[28]~input_o\ & ( \B[28]~input_o\ & ( (!\A[30]~input_o\ & (\B[30]~input_o\ & ((\B[29]~input_o\) # (\A[29]~input_o\)))) # (\A[30]~input_o\ & (((\B[29]~input_o\) # (\A[29]~input_o\)) # (\B[30]~input_o\))) ) ) ) 
-- # ( !\A[28]~input_o\ & ( \B[28]~input_o\ & ( (!\A[30]~input_o\ & (\B[30]~input_o\ & (\A[29]~input_o\ & \B[29]~input_o\))) # (\A[30]~input_o\ & (((\A[29]~input_o\ & \B[29]~input_o\)) # (\B[30]~input_o\))) ) ) ) # ( \A[28]~input_o\ & ( !\B[28]~input_o\ & ( 
-- (!\A[30]~input_o\ & (\B[30]~input_o\ & (\A[29]~input_o\ & \B[29]~input_o\))) # (\A[30]~input_o\ & (((\A[29]~input_o\ & \B[29]~input_o\)) # (\B[30]~input_o\))) ) ) ) # ( !\A[28]~input_o\ & ( !\B[28]~input_o\ & ( (!\A[30]~input_o\ & (\B[30]~input_o\ & 
-- (\A[29]~input_o\ & \B[29]~input_o\))) # (\A[30]~input_o\ & (((\A[29]~input_o\ & \B[29]~input_o\)) # (\B[30]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010111000100010001011100010001000101110001011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[30]~input_o\,
	datab => \ALT_INV_B[30]~input_o\,
	datac => \ALT_INV_A[29]~input_o\,
	datad => \ALT_INV_B[29]~input_o\,
	datae => \ALT_INV_A[28]~input_o\,
	dataf => \ALT_INV_B[28]~input_o\,
	combout => \ULA|ula30|SomaSubtrai|vaiUM~0_combout\);

\ULA|ula30|SomaSubtrai|vaiUM\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|SomaSubtrai|vaiUM~combout\ = ( \ULA|ula30|SomaSubtrai|saidaAND_XOR~0_combout\ & ( !\ULA|ula30|SomaSubtrai|vaiUM~0_combout\ & ( (\ULA|ula27|SomaSubtrai|vaiUM~2_combout\ & ((!\ULA|ula27|SomaSubtrai|saidaAND_XOR~1_combout\) # 
-- ((!\ULA|ula20|SomaSubtrai|saidaAND_XOR~2_combout\ & \ULA|ula20|SomaSubtrai|vaiUM~2_combout\)))) ) ) ) # ( !\ULA|ula30|SomaSubtrai|saidaAND_XOR~0_combout\ & ( !\ULA|ula30|SomaSubtrai|vaiUM~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000001111001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ULA|ula20|SomaSubtrai|ALT_INV_saidaAND_XOR~2_combout\,
	datab => \ULA|ula20|SomaSubtrai|ALT_INV_vaiUM~2_combout\,
	datac => \ULA|ula27|SomaSubtrai|ALT_INV_saidaAND_XOR~1_combout\,
	datad => \ULA|ula27|SomaSubtrai|ALT_INV_vaiUM~2_combout\,
	datae => \ULA|ula30|SomaSubtrai|ALT_INV_saidaAND_XOR~0_combout\,
	dataf => \ULA|ula30|SomaSubtrai|ALT_INV_vaiUM~0_combout\,
	combout => \ULA|ula30|SomaSubtrai|vaiUM~combout\);

\A[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(31),
	o => \A[31]~input_o\);

\B[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(31),
	o => \B[31]~input_o\);

\ULA|ula31|SomaSubtrai|soma~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|SomaSubtrai|soma~0_combout\ = !\A[31]~input_o\ $ (!\B[31]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[31]~input_o\,
	datab => \ALT_INV_B[31]~input_o\,
	combout => \ULA|ula31|SomaSubtrai|soma~0_combout\);

\ULA|ula0|muxULA|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula0|muxULA|saida_MUX~1_combout\ = ( \ULA|ula30|SomaSubtrai|vaiUM~combout\ & ( \ULA|ula31|SomaSubtrai|soma~0_combout\ & ( (!\A[0]~input_o\ & (!\ULA|ula0|muxULA|saida_MUX~0_combout\ & ((!\ULA|ula31|muxULA|Equal1~0_combout\) # 
-- (\ULA|ula0|inverteB|saida_MUX~0_combout\)))) # (\A[0]~input_o\ & (((!\ULA|ula0|muxULA|saida_MUX~0_combout\)) # (\ULA|ula0|inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\ULA|ula30|SomaSubtrai|vaiUM~combout\ & ( \ULA|ula31|SomaSubtrai|soma~0_combout\ & ( 
-- (!\ULA|ula0|muxULA|saida_MUX~0_combout\ & (\ULA|ula31|muxULA|Equal1~0_combout\ & ((\ULA|ula0|inverteB|saida_MUX~0_combout\) # (\A[0]~input_o\)))) # (\ULA|ula0|muxULA|saida_MUX~0_combout\ & (\A[0]~input_o\ & (\ULA|ula0|inverteB|saida_MUX~0_combout\))) ) ) 
-- ) # ( \ULA|ula30|SomaSubtrai|vaiUM~combout\ & ( !\ULA|ula31|SomaSubtrai|soma~0_combout\ & ( (!\ULA|ula0|muxULA|saida_MUX~0_combout\ & (\ULA|ula31|muxULA|Equal1~0_combout\ & ((\ULA|ula0|inverteB|saida_MUX~0_combout\) # (\A[0]~input_o\)))) # 
-- (\ULA|ula0|muxULA|saida_MUX~0_combout\ & (\A[0]~input_o\ & (\ULA|ula0|inverteB|saida_MUX~0_combout\))) ) ) ) # ( !\ULA|ula30|SomaSubtrai|vaiUM~combout\ & ( !\ULA|ula31|SomaSubtrai|soma~0_combout\ & ( (!\A[0]~input_o\ & 
-- (!\ULA|ula0|muxULA|saida_MUX~0_combout\ & ((!\ULA|ula31|muxULA|Equal1~0_combout\) # (\ULA|ula0|inverteB|saida_MUX~0_combout\)))) # (\A[0]~input_o\ & (((!\ULA|ula0|muxULA|saida_MUX~0_combout\)) # (\ULA|ula0|inverteB|saida_MUX~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000101110001000000010111000100000001011100011111000101110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ULA|ula0|inverteB|ALT_INV_saida_MUX~0_combout\,
	datac => \ULA|ula0|muxULA|ALT_INV_saida_MUX~0_combout\,
	datad => \ULA|ula31|muxULA|ALT_INV_Equal1~0_combout\,
	datae => \ULA|ula30|SomaSubtrai|ALT_INV_vaiUM~combout\,
	dataf => \ULA|ula31|SomaSubtrai|ALT_INV_soma~0_combout\,
	combout => \ULA|ula0|muxULA|saida_MUX~1_combout\);

\ULA|ula2|muxULA|saida_MUX~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|muxULA|saida_MUX~2_combout\ = ( \ULAop[0]~input_o\ & ( \ULAop[1]~input_o\ & ( (\ucULA|ulaCtrl~0_combout\ & (\funct[1]~input_o\ & (!\funct[2]~input_o\ & !\funct[0]~input_o\))) ) ) ) # ( !\ULAop[0]~input_o\ & ( \ULAop[1]~input_o\ & ( 
-- (\ucULA|ulaCtrl~0_combout\ & (\funct[1]~input_o\ & (!\funct[2]~input_o\ & !\funct[0]~input_o\))) ) ) ) # ( \ULAop[0]~input_o\ & ( !\ULAop[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl~0_combout\,
	datab => \ALT_INV_funct[1]~input_o\,
	datac => \ALT_INV_funct[2]~input_o\,
	datad => \ALT_INV_funct[0]~input_o\,
	datae => \ALT_INV_ULAop[0]~input_o\,
	dataf => \ALT_INV_ULAop[1]~input_o\,
	combout => \ULA|ula2|muxULA|saida_MUX~2_combout\);

\ULA|ula2|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|muxULA|saida_MUX~0_combout\ = ( \ULAop[1]~input_o\ & ( \ucULA|ulaCtrl~0_combout\ & ( (((!\funct[1]~input_o\ & \funct[3]~input_o\)) # (\funct[2]~input_o\)) # (\funct[0]~input_o\) ) ) ) # ( \ULAop[1]~input_o\ & ( !\ucULA|ulaCtrl~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000111011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_funct[0]~input_o\,
	datab => \ALT_INV_funct[2]~input_o\,
	datac => \ALT_INV_funct[1]~input_o\,
	datad => \ALT_INV_funct[3]~input_o\,
	datae => \ALT_INV_ULAop[1]~input_o\,
	dataf => \ucULA|ALT_INV_ulaCtrl~0_combout\,
	combout => \ULA|ula2|muxULA|saida_MUX~0_combout\);

\ULA|ula1|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula1|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[1]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[1]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[1]~input_o\)) # (\A[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[1]~input_o\,
	datac => \ALT_INV_B[1]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula1|muxULA|saida_MUX~0_combout\);

\ULA|ula2|muxULA|saida_MUX~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula2|muxULA|saida_MUX~1_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[2]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[2]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[2]~input_o\)) # (\A[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \ALT_INV_B[2]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula2|muxULA|saida_MUX~1_combout\);

\ULA|ula3|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula3|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[3]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[3]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[3]~input_o\)) # (\A[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[3]~input_o\,
	datac => \ALT_INV_B[3]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula3|muxULA|saida_MUX~0_combout\);

\ULA|ula4|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula4|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[4]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[4]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[4]~input_o\)) # (\A[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[4]~input_o\,
	datac => \ALT_INV_B[4]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula4|muxULA|saida_MUX~0_combout\);

\ULA|ula5|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula5|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[5]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[5]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[5]~input_o\)) # (\A[5]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[5]~input_o\,
	datac => \ALT_INV_B[5]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula5|muxULA|saida_MUX~0_combout\);

\ULA|ula6|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula6|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[6]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[6]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[6]~input_o\)) # (\A[6]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[6]~input_o\,
	datac => \ALT_INV_B[6]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula6|muxULA|saida_MUX~0_combout\);

\ULA|ula7|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula7|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[7]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[7]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[7]~input_o\)) # (\A[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[7]~input_o\,
	datac => \ALT_INV_B[7]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula7|muxULA|saida_MUX~0_combout\);

\ULA|ula8|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula8|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[8]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[8]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[8]~input_o\)) # (\A[8]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[8]~input_o\,
	datac => \ALT_INV_B[8]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula8|muxULA|saida_MUX~0_combout\);

\ULA|ula9|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula9|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[9]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[9]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[9]~input_o\)) # (\A[9]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[9]~input_o\,
	datac => \ALT_INV_B[9]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula9|muxULA|saida_MUX~0_combout\);

\ULA|ula10|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula10|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[10]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[10]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[10]~input_o\)) # (\A[10]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[10]~input_o\,
	datac => \ALT_INV_B[10]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula10|muxULA|saida_MUX~0_combout\);

\ULA|ula11|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula11|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[11]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[11]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[11]~input_o\)) # (\A[11]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[11]~input_o\,
	datac => \ALT_INV_B[11]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula11|muxULA|saida_MUX~0_combout\);

\ULA|ula12|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula12|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[12]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[12]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[12]~input_o\)) # (\A[12]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[12]~input_o\,
	datac => \ALT_INV_B[12]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula12|muxULA|saida_MUX~0_combout\);

\ULA|ula13|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula13|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[13]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[13]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[13]~input_o\)) # (\A[13]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[13]~input_o\,
	datac => \ALT_INV_B[13]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula13|muxULA|saida_MUX~0_combout\);

\ULA|ula14|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula14|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[14]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[14]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[14]~input_o\)) # (\A[14]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[14]~input_o\,
	datac => \ALT_INV_B[14]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula14|muxULA|saida_MUX~0_combout\);

\ULA|ula15|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula15|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[15]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[15]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[15]~input_o\)) # (\A[15]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[15]~input_o\,
	datac => \ALT_INV_B[15]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula15|muxULA|saida_MUX~0_combout\);

\ULA|ula16|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula16|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[16]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[16]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[16]~input_o\)) # (\A[16]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[16]~input_o\,
	datac => \ALT_INV_B[16]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula16|muxULA|saida_MUX~0_combout\);

\ULA|ula17|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula17|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[17]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[17]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[17]~input_o\)) # (\A[17]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[17]~input_o\,
	datac => \ALT_INV_B[17]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula17|muxULA|saida_MUX~0_combout\);

\ULA|ula18|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula18|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[18]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[18]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[18]~input_o\)) # (\A[18]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[18]~input_o\,
	datac => \ALT_INV_B[18]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula18|muxULA|saida_MUX~0_combout\);

\ULA|ula19|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula19|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[19]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[19]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[19]~input_o\)) # (\A[19]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[19]~input_o\,
	datac => \ALT_INV_B[19]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula19|muxULA|saida_MUX~0_combout\);

\ULA|ula20|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula20|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[20]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[20]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[20]~input_o\)) # (\A[20]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[20]~input_o\,
	datac => \ALT_INV_B[20]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula20|muxULA|saida_MUX~0_combout\);

\ULA|ula21|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula21|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[21]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[21]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[21]~input_o\)) # (\A[21]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[21]~input_o\,
	datac => \ALT_INV_B[21]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula21|muxULA|saida_MUX~0_combout\);

\ULA|ula22|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula22|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[22]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[22]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[22]~input_o\)) # (\A[22]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[22]~input_o\,
	datac => \ALT_INV_B[22]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula22|muxULA|saida_MUX~0_combout\);

\ULA|ula23|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula23|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[23]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[23]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[23]~input_o\)) # (\A[23]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[23]~input_o\,
	datac => \ALT_INV_B[23]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula23|muxULA|saida_MUX~0_combout\);

\ULA|ula24|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula24|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[24]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[24]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[24]~input_o\)) # (\A[24]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[24]~input_o\,
	datac => \ALT_INV_B[24]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula24|muxULA|saida_MUX~0_combout\);

\ULA|ula25|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula25|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[25]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[25]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[25]~input_o\)) # (\A[25]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[25]~input_o\,
	datac => \ALT_INV_B[25]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula25|muxULA|saida_MUX~0_combout\);

\ULA|ula26|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula26|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[26]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[26]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[26]~input_o\)) # (\A[26]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[26]~input_o\,
	datac => \ALT_INV_B[26]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula26|muxULA|saida_MUX~0_combout\);

\ULA|ula27|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula27|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[27]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[27]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[27]~input_o\)) # (\A[27]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[27]~input_o\,
	datac => \ALT_INV_B[27]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula27|muxULA|saida_MUX~0_combout\);

\ULA|ula28|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula28|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[28]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[28]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[28]~input_o\)) # (\A[28]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[28]~input_o\,
	datac => \ALT_INV_B[28]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula28|muxULA|saida_MUX~0_combout\);

\ULA|ula29|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula29|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[29]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[29]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[29]~input_o\)) # (\A[29]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[29]~input_o\,
	datac => \ALT_INV_B[29]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula29|muxULA|saida_MUX~0_combout\);

\ULA|ula30|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula30|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[30]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[30]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[30]~input_o\)) # (\A[30]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[30]~input_o\,
	datac => \ALT_INV_B[30]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula30|muxULA|saida_MUX~0_combout\);

\ULA|ula31|muxULA|saida_MUX~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|muxULA|saida_MUX~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (\A[31]~input_o\ & (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & (!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[31]~input_o\)))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & ( 
-- (!\ULA|ula2|muxULA|saida_MUX~2_combout\ & ((!\ucULA|ulaCtrl[0]~1_combout\ $ (!\B[31]~input_o\)) # (\A[31]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000000100100000000001111011000000000001001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[31]~input_o\,
	datac => \ALT_INV_B[31]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula31|muxULA|saida_MUX~0_combout\);

\ULA|ula31|detectaOF|overflow~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ULA|ula31|detectaOF|overflow~0_combout\ = ( \ULA|ula2|muxULA|saida_MUX~0_combout\ & ( (!\A[31]~input_o\) # ((!\B[31]~input_o\) # ((!\ucULA|ulaCtrl[0]~1_combout\ & !\ULA|ula2|muxULA|saida_MUX~2_combout\))) ) ) # ( !\ULA|ula2|muxULA|saida_MUX~0_combout\ & 
-- ( (!\A[31]~input_o\ & ((!\ucULA|ulaCtrl[0]~1_combout\) # ((\ULA|ula2|muxULA|saida_MUX~2_combout\) # (\B[31]~input_o\)))) # (\A[31]~input_o\ & (((!\B[31]~input_o\) # (!\ULA|ula2|muxULA|saida_MUX~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111111111100111111101111110010111111111111001111111011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ucULA|ALT_INV_ulaCtrl[0]~1_combout\,
	datab => \ALT_INV_A[31]~input_o\,
	datac => \ALT_INV_B[31]~input_o\,
	datad => \ULA|ula2|muxULA|ALT_INV_saida_MUX~2_combout\,
	datae => \ULA|ula2|muxULA|ALT_INV_saida_MUX~0_combout\,
	combout => \ULA|ula31|detectaOF|overflow~0_combout\);

ww_resultado(0) <= \resultado[0]~output_o\;

ww_resultado(1) <= \resultado[1]~output_o\;

ww_resultado(2) <= \resultado[2]~output_o\;

ww_resultado(3) <= \resultado[3]~output_o\;

ww_resultado(4) <= \resultado[4]~output_o\;

ww_resultado(5) <= \resultado[5]~output_o\;

ww_resultado(6) <= \resultado[6]~output_o\;

ww_resultado(7) <= \resultado[7]~output_o\;

ww_resultado(8) <= \resultado[8]~output_o\;

ww_resultado(9) <= \resultado[9]~output_o\;

ww_resultado(10) <= \resultado[10]~output_o\;

ww_resultado(11) <= \resultado[11]~output_o\;

ww_resultado(12) <= \resultado[12]~output_o\;

ww_resultado(13) <= \resultado[13]~output_o\;

ww_resultado(14) <= \resultado[14]~output_o\;

ww_resultado(15) <= \resultado[15]~output_o\;

ww_resultado(16) <= \resultado[16]~output_o\;

ww_resultado(17) <= \resultado[17]~output_o\;

ww_resultado(18) <= \resultado[18]~output_o\;

ww_resultado(19) <= \resultado[19]~output_o\;

ww_resultado(20) <= \resultado[20]~output_o\;

ww_resultado(21) <= \resultado[21]~output_o\;

ww_resultado(22) <= \resultado[22]~output_o\;

ww_resultado(23) <= \resultado[23]~output_o\;

ww_resultado(24) <= \resultado[24]~output_o\;

ww_resultado(25) <= \resultado[25]~output_o\;

ww_resultado(26) <= \resultado[26]~output_o\;

ww_resultado(27) <= \resultado[27]~output_o\;

ww_resultado(28) <= \resultado[28]~output_o\;

ww_resultado(29) <= \resultado[29]~output_o\;

ww_resultado(30) <= \resultado[30]~output_o\;

ww_resultado(31) <= \resultado[31]~output_o\;

ww_overflow <= \overflow~output_o\;
END structure;


