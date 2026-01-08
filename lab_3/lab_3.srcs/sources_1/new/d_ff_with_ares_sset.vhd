----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2025 18:52:01
-- Design Name: 
-- Module Name: d_ff_with_ares_sset - Behavioral
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

entity d_ff_with_ares_sset is
    Port (
        D, CLK, RST, PRE : in  std_logic;
        Q : out std_logic);
end d_ff_with_ares_sset;

architecture Behavioral of d_ff_with_ares_sset is

begin

    process(CLK, RST)
    begin
        if RST = '1' then
            Q <= '0';
        elsif rising_edge(CLK) then
            if PRE = '1' then
                Q <= '1';
            else
                Q <= D;
            end if;
        end if;
    end process;

end Behavioral;
