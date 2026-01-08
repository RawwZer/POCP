----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:02:28
-- Design Name: 
-- Module Name: tb_rs_ff - Behavioral
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

entity tb_rs_ff is
--  Port ( );
end tb_rs_ff;

architecture Behavioral of tb_rs_ff is

    component rs_ff is
        Port (
            S, R, CLK : in  std_logic;
            Q : out std_logic);
    end component;

    signal s_tb, r_tb, clk_tb, q_tb : std_logic := '0';

begin

    UUT: rs_ff port map (S=>s_tb, R=>r_tb, CLK=>clk_tb, Q=>q_tb);

    clk_tb <= not clk_tb after 5 ns;

    process begin
        -- Хранение
        s_tb <= '0'; r_tb <= '0'; wait for 10 ns;
        -- Установка
        s_tb <= '1'; r_tb <= '0'; wait for 10 ns; -- Q станет '1' на фронте
        -- Хранение
        s_tb <= '0'; r_tb <= '0'; wait for 10 ns; -- Q останется '1'
        -- Сброс
        s_tb <= '0'; r_tb <= '1'; wait for 10 ns; -- Q станет '0' на фронте
        wait;
    end process;
    
end Behavioral;
