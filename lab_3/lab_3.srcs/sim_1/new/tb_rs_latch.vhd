----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:02:28
-- Design Name: 
-- Module Name: tb_rs_latch - Behavioral
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

entity tb_rs_latch is
--  Port ( );
end tb_rs_latch;

architecture Behavioral of tb_rs_latch is

    component rs_latch_struc is
    Port (
        S, R : in std_logic;
        Q, nQ : out std_logic);
    end component;


    signal s_tb, r_tb, q_tb, nq_tb : std_logic;
    
    constant T : time := 10 ns;
    
begin
    UUT: rs_latch_struc port map (S=>s_tb, R=>r_tb, Q=>q_tb, nQ=>nq_tb);

    process begin
        -- Хранение
        s_tb <= '0'; r_tb <= '0'; wait for T;
        -- Установка
        s_tb <= '1'; r_tb <= '0'; wait for T;
        -- Хранение после установки
        s_tb <= '0'; r_tb <= '0'; wait for T;
        -- Сброс
        s_tb <= '0'; r_tb <= '1'; wait for T;
        -- Хранение после сброса
        s_tb <= '0'; r_tb <= '0'; wait for T;
        -- Запрещенное состояние
        s_tb <= '1'; r_tb <= '1'; wait for T;
        wait;
    end process;

end Behavioral;
