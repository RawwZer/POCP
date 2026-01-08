----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2025 18:52:01
-- Design Name: 
-- Module Name: d_latch_gated_with_ares - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d_latch_gated_with_ares is
    Port (
        D, E, R : in  std_logic;
        Q : out std_logic);
end d_latch_gated_with_ares;

architecture Behavioral of d_latch_gated_with_ares is

begin

    process(D, E, R)
    begin
        -- Проверка асинхронного сброса имеет наивысший приоритет
        if R = '1' then
            Q <= '0';
        elsif E = '1' then
            Q <= D;
        end if;
    end process;

end Behavioral;
