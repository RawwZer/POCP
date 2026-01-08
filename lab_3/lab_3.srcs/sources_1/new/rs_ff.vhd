----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2025 18:52:01
-- Design Name: 
-- Module Name: rs_ff - Behavioral
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

entity rs_ff is
    Port (
        S, R, CLK : in  std_logic;
        Q : out std_logic);
end rs_ff;

architecture Behavioral of rs_ff is

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if R = '1' then
                Q <= '0';
            elsif S = '1' then
                Q <= '1';
            end if;
        end if;
    end process;

end Behavioral;
