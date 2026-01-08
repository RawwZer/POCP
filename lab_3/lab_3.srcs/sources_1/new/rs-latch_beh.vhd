----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2025 09:26:24
-- Design Name: 
-- Module Name: rs-latch_beh - Behavioral
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

entity rs_latch_beh is
    port (
    S, R : in  std_logic;
    Q, nQ : out std_logic);
end rs_latch_beh;

architecture Behavioral of rs_latch_beh is

    signal q_internal : std_logic := '0'; 

begin

    Q <= q_internal;
    nQ <= not q_internal;
    
    process(S, R)
    begin
        -- наивысший приоритет
        if R = '1' then
            q_internal <= '0';
        elsif S = '1' then
            q_internal <= '1';
        end if;
    end process;

end Behavioral;
