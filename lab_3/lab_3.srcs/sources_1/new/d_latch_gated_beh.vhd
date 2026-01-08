----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2025 18:22:30
-- Design Name: 
-- Module Name: d_latch_gated_beh - Behavioral
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

entity d_latch_gated_beh is
    Port (
        D, E : in  std_logic;
        Q, nQ : out std_logic);
end d_latch_gated_beh;

architecture Behavioral of d_latch_gated_beh is

begin
    
    nQ <= not Q;

    process(D, E)
    begin
        if E = '1' then
            Q <= D;
        end if;
    end process;

end Behavioral;
