----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2025 18:52:01
-- Design Name: 
-- Module Name: t_ff - Behavioral
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

entity t_ff is
    Port (
        T, CLK : in  std_logic;
        Q : out std_logic);
end t_ff;

architecture Behavioral of t_ff is

     signal q_internal : std_logic := '0';

begin

    Q <= q_internal;

    process(CLK)
    begin
        if rising_edge(CLK) then
            if T = '1' then
                q_internal <= not q_internal;
            end if;
        end if;
    end process;

end Behavioral;
