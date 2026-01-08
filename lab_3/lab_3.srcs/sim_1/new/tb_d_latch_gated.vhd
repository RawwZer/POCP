----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:02:28
-- Design Name: 
-- Module Name: tb_d_latch_gated - Behavioral
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

entity tb_d_latch_gated is
--  Port ( );
end tb_d_latch_gated;

architecture Behavioral of tb_d_latch_gated is

    component d_latch_gated_struct is
        Port (
            D, E : in  std_logic;
            Q : out std_logic);
    end component;
    
    signal d_tb, e_tb, q_tb : std_logic;
    
    constant T : time := 10 ns;

begin

    UUT: d_latch_gated_struct port map (D=>d_tb, E=>e_tb, Q=>q_tb);

    process begin
        report "Testing Gated D-Latch...";
        -- –ежим хранени€ 
        e_tb <= '0'; d_tb <= '0'; wait for T;
        d_tb <= '1'; wait for T; -- Q не должен изменитьс€
        
        -- –ежим прозрачности 
        e_tb <= '1'; wait for T; -- Q должен стать '1'
        d_tb <= '0'; wait for T; -- Q должен стать '0'
        d_tb <= '1'; wait for T; -- Q должен стать '1'
        
        -- «акрытие защелки
        e_tb <= '0'; wait for T; -- Q должен сохранить '1'
        d_tb <= '0'; wait for T; -- Q не должен изменитьс€
        wait;
    end process;

end Behavioral;
