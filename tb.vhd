-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE Behavioral OF tb IS

COMPONENT top_rs232 IS
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           RXD_i : in STD_LOGIC;
           TXD_o : out STD_LOGIC);
END COMPONENT top_rs232;

signal clk_i : STD_LOGIC := '0';
signal rst_i : STD_LOGIC := '0';
signal RXD_i : STD_LOGIC := '1';
signal TXD_o : STD_LOGIC;
constant PERIOD : TIME := 10 ns; -- 100 MHz  
   
BEGIN

uut: top_rs232 
    PORT MAP ( clk_i => clk_i,
               rst_i => rst_i,
               RXD_i => RXD_i,
               TXD_o => TXD_o);
        
clk_i <= NOT clk_i AFTER PERIOD/2; -- realizacja prostego zegara

tb:PROCESS
   BEGIN
   WAIT FOR 100ns;
   -- przyklad nominalna predkosc I raz
    RXD_i <= '0'; -- START
   WAIT FOR 104.166666us;
    RXD_i <= '1'; -- D0
   WAIT FOR 104.166666us;
    RXD_i <= '1'; -- D1
   WAIT FOR 104.166666us;
    RXD_i <= '0'; -- D2
   WAIT FOR 104.166666us;
    RXD_i <= '0'; -- D3
   WAIT FOR 104.166666us;
    RXD_i <= '1'; -- D4
   WAIT FOR 104.166666us;
    RXD_i <= '0'; -- D5
   WAIT FOR 104.166666us;
    RXD_i <= '1'; -- D6 
   WAIT FOR 104.166666us;
    RXD_i <= '0'; -- D7
   WAIT FOR 104.166666us;
    RXD_i <= '1'; -- STOP
   
   WAIT FOR 2ms;
   
   -- przyklad 4% mniej od nominalna predkosc II raz
    RXD_i <= '0'; -- START
   WAIT FOR 100us;
    RXD_i <= '1'; -- D0
   WAIT FOR 100us;
    RXD_i <= '1'; -- D1
   WAIT FOR 100us;
    RXD_i <= '0'; -- D2
   WAIT FOR 100us;
    RXD_i <= '0'; -- D3
   WAIT FOR 100us;
    RXD_i <= '1'; -- D4
   WAIT FOR 100us;
    RXD_i <= '0'; -- D5
   WAIT FOR 100us;
    RXD_i <= '1'; -- D6
   WAIT FOR 100us;
    RXD_i <= '0'; -- D7
   WAIT FOR 100us;
    RXD_i <= '1'; -- STOP
   
   WAIT FOR 2ms;
   
   -- przyklad 4% wiecej od nominalna predkosc III raz 
    RXD_i <= '0'; -- START
   WAIT FOR 108.333333us;
    RXD_i <= '1'; -- D0
   WAIT FOR 108.333333us;
    RXD_i <= '1'; -- D1
   WAIT FOR 108.333333us;
    RXD_i <= '0'; -- D2
   WAIT FOR 108.333333us;
    RXD_i <= '0'; -- D3
   WAIT FOR 108.333333us;
    RXD_i <= '1'; -- D4
   WAIT FOR 108.333333us;
    RXD_i <= '0'; -- D5
   WAIT FOR 108.333333us;
    RXD_i <= '1'; -- D6
   WAIT FOR 108.333333us;
    RXD_i <= '0'; -- D7
   WAIT FOR 108.333333us;
    RXD_i <= '1'; -- STOP
    
   WAIT FOR 2ms;
   
    END PROCESS;
END Behavioral;