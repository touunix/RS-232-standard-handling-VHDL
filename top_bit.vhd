-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.STANDARD.ALL;

ENTITY top_bit IS
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;   
           bit_o : out STD_LOGIC := '1');
END top_bit;

ARCHITECTURE Behavioral OF top_bit IS

signal bit_a: STD_LOGIC_VECTOR (7 downto 0) := "11111111";

BEGIN
PROCESS(clk_i, rst_i)
BEGIN
    if (rst_i = '1') then
        bit_a <= "11111111";
    END if;
    if (rising_edge(clk_i)) then
        bit_a(7 downto 1) <= bit_a (6 downto 0);
        bit_a(0) <= RXD_i;
        if (bit_a = "00000000") then
            bit_o <= '0';
        END if;
        if (bit_a = "11111111") then
            bit_o <= '1';
        END if;
    END if;
END PROCESS;
END Behavioral;