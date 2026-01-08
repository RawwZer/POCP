----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:02:28
-- Design Name: 
-- Module Name: tb_d_ff_with_aset - Behavioral
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

entity tb_d_ff_with_aset is
--  Port ( );
end tb_d_ff_with_aset;

architecture Behavioral of tb_d_ff_with_aset is

    component d_ff_with_aset is
        Port (
            D, CLK, PRE : in  std_logic;
            Q : out std_logic);
    end component;

    signal d_tb, clk_tb, pre_tb, q_tb : std_logic := '0';

begin

    UUT: d_ff_with_aset port map (D=>d_tb, CLK=>clk_tb, PRE=>pre_tb, Q=>q_tb);

    clk_tb <= not clk_tb after 5 ns;

    process begin
        -- PRE (без тактов)
        pre_tb <= '1'; wait for 10 ns; -- Q должен стать '1'
        pre_tb <= '0'; wait for 1 ns; 

        -- Нормальная работа
        d_tb <= '0'; wait for 10 ns; -- На фронте Q станет '0'
        d_tb <= '1'; wait for 10 ns; -- На фронте Q станет '1'
        
        -- PRE
        pre_tb <= '1'; wait for 3 ns; -- Q должен немедленно стать '1'
        wait;
    end process;

end Behavioral;
