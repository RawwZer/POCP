----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:02:28
-- Design Name: 
-- Module Name: tb_d_latch - Behavioral
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

entity tb_d_latch is
--  Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is
    
    component d_latch_struc is
        Port (
            D : in std_logic;
            Q, nQ : out std_logic);
    end component;

    signal d_tb, q_tb : std_logic;

begin

    UUT: d_latch_struc port map (D=>d_tb, Q=>q_tb);
 
    process begin
        d_tb <= '0'; wait for 10 ns;
        d_tb <= '1'; wait for 10 ns;
        wait;
 
    end process;
end Behavioral;
