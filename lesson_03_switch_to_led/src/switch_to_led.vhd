--------------------------------------------------------------------------------
-- Module      : switch_to_led
-- Target      : ZedBoard (xc7z020clg484-1)
-- Tool        : Vivado 2023.2
-- Description : Registers the eight user switches on the rising edge of the
--               100 MHz clock and drives the eight user LEDs with the result.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity switch_to_led is
    port (
        clk   : in  std_logic;
        sw_i  : in  std_logic_vector(7 downto 0);
        led_o : out std_logic_vector(7 downto 0)
    );
end switch_to_led;

architecture Behavioral of switch_to_led is
begin

    process (clk)
    begin
        if rising_edge(clk) then
            led_o <= sw_i;
        end if;
    end process;

end Behavioral;
