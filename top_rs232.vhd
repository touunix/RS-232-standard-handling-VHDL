-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.STANDARD.ALL;

ENTITY top_rs232 IS
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           TXD_o : out STD_LOGIC := '1');
END top_rs232;

ARCHITECTURE Behavioral OF top_rs232 IS

COMPONENT top_bit IS
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           bit_o : out STD_LOGIC := '1');
END COMPONENT top_bit;

constant clk_i_bit: INTEGER := 10416;
signal buffer_i: STD_LOGIC_VECTOR(7 downto 0) := "11111111";
signal buffer_o: STD_LOGIC_VECTOR(7 downto 0) := "11111111";
signal reset: STD_LOGIC := '0';
signal bit_i: STD_LOGIC := '1';
signal in_start: STD_LOGIC := '0';
signal out_start: STD_LOGIC := '0';
signal counter_in : INTEGER := 0;
signal counter_out : INTEGER := 0;

BEGIN
bits: top_bit
    PORT MAP ( clk_i => clk_i,
               rst_i => rst_i,
               RXD_i => RXD_i,
               bit_o => bit_i);
               
PROCESS(rst_i, clk_i)
BEGIN
    if (rst_i = '1') then
        reset <= '1';
    END if;
    if (rising_edge(clk_i)) then
      if (bit_i = '0' and counter_in = 0) then
        in_start <= '1';
        counter_in <= 1;
      elsif (in_start = '1') then
        counter_in <= counter_in + 1;
      END if;
      -- odbior danych 
         if (counter_in = (clk_i_bit*1+(clk_i_bit/2))and reset /= '1') then buffer_i(0) <= bit_i;
      elsif (counter_in = (clk_i_bit*2+(clk_i_bit/2))and reset /= '1') then buffer_i(1) <= bit_i;
      elsif (counter_in = (clk_i_bit*3+(clk_i_bit/2))and reset /= '1') then buffer_i(2) <= bit_i;
      elsif (counter_in = (clk_i_bit*4+(clk_i_bit/2))and reset /= '1') then buffer_i(3) <= bit_i;
      elsif (counter_in = (clk_i_bit*5+(clk_i_bit/2))and reset /= '1') then buffer_i(4) <= bit_i;
      elsif (counter_in = (clk_i_bit*6+(clk_i_bit/2))and reset /= '1') then buffer_i(5) <= bit_i;
      elsif (counter_in = (clk_i_bit*7+(clk_i_bit/2))and reset /= '1') then buffer_i(6) <= bit_i;
      elsif (counter_in = (clk_i_bit*8+(clk_i_bit/2))and reset /= '1') then buffer_i(7) <= bit_i;
      elsif (counter_in = (clk_i_bit*9+(clk_i_bit/2))and reset /= '1') then
        buffer_o <= buffer_i + x"20"; -- mala litera
        counter_in <= 0;
        in_start <= '0';
        out_start <= '1';
      END if;
   
      if(out_start = '1') then
        counter_out <= counter_out + 1;
      END if;
      -- transmisja danych
         if (counter_out = 1 and reset /= '1') then  TXD_o <= '0';
      elsif (counter_out = 1*clk_i_bit and reset /= '1') then TXD_o <= buffer_o(0);
      elsif (counter_out = 2*clk_i_bit and reset /= '1') then TXD_o <= buffer_o(1);
      elsif (counter_out = 3*clk_i_bit and reset /= '1') then TXD_o <= buffer_o(2);
      elsif (counter_out = 4*clk_i_bit and reset /= '1') then TXD_o <= buffer_o(3);
      elsif (counter_out = 5*clk_i_bit and reset /= '1') then TXD_o <= buffer_o(4);
      elsif (counter_out = 6*clk_i_bit and reset /= '1') then TXD_o <= buffer_o(5);
      elsif (counter_out = 7*clk_i_bit and reset /= '1') then TXD_o <= buffer_o(6);
      elsif (counter_out = 8*clk_i_bit and reset /= '1') then TXD_o <= buffer_o(7);
      elsif (counter_out = 9*clk_i_bit and reset /= '1') then
        TXD_o <= '1';
        reset <= '0';
        counter_out <= 0;
        out_start <= '0';
      END if;
    END if;
END PROCESS;
END Behavioral;