LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity divisorGenerico_e_Interface is
   port(clk      :   in std_logic;
      habilitaLeitura : in std_logic;
      limpaLeitura : in std_logic;
      leituraUmSegundo :   out std_logic_vector(7 downto 0);
		seletorMux : in std_logic
   );
end entity;

architecture interface of divisorGenerico_e_Interface is
  signal sinalUmSegundo : std_logic;
  signal saidaclk_reg1seg : std_logic;
  signal saidaclk_rapido : std_logic;
  signal clkFlipFlop : std_logic;
begin

baseTempo: entity work.divisorGenerico
           generic map (divisor => 25000000)   -- divide por 25.000.000 para passar 1 sec.
           port map (clk => clk, saida_clk => saidaclk_reg1seg);
			  
baseTempoRapida: entity work.divisorGenerico
           generic map (divisor => 25000)   -- divide por menos para passar 1 sec mais rapido.
           port map (clk => clk, saida_clk => saidaclk_rapido);
			  
muxSeletorBaseTempo : entity work.mux1Bit
			  port map( entradaA_MUX => saidaclk_reg1seg,
                 entradaB_MUX =>  saidaclk_rapido,
                 seletor_MUX => seletorMux,
                 saida_MUX => clkFlipFlop);

registraUmSegundo: entity work.flipflop
   port map (DIN => '1', DOUT => sinalUmSegundo,
         ENABLE => '1', CLK => clkFlipFlop,
         RST => limpaLeitura);

-- Faz o tristate de saida:
leituraUmSegundo <= "0000000" & sinalUmSegundo when habilitaLeitura = '1' else (others => 'Z');

end architecture interface;