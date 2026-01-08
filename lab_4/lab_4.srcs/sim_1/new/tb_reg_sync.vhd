----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2025 16:44:36
-- Design Name: 
-- Module Name: tb_reg_sync - Behavioral
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

entity tb_reg_sync is
--  Port ( );
end tb_reg_sync;

architecture test of tb_reg_sync is
    constant N_BITS : integer := 4;
    constant T_CLK  : time := 10 ns;

    component reg_sync is
        generic(N: integer);
        port (En: in std_logic; 
              Clk: in std_logic; 
              Din: in std_logic_vector(N-1 downto 0); 
              Dout: out std_logic_vector(N-1 downto 0));
    end component;

    signal clk_tb  : std_logic := '0';
    signal en_tb   : std_logic;
    signal din_tb  : std_logic_vector(N_BITS-1 downto 0);
    signal dout_tb : std_logic_vector(N_BITS-1 downto 0);

begin
    UUT: reg_sync generic map (N => N_BITS) port map (Clk=>clk_tb, 
                                                      En=>en_tb, 
                                                      Din=>din_tb, 
                                                      Dout=>dout_tb);
    
    clk_tb <= not clk_tb after T_CLK/2;

    stim_proc: process
    begin
        -- Тест 1: Загрузка данных (En=1)
        en_tb <= '1';
        din_tb <= "1010";
        wait for T_CLK; -- Ждем такт
        din_tb <= "1111";
        wait for T_CLK;

        -- Тест 2: Хранение данных (En=0)
        en_tb <= '0';
        din_tb <= "0000"; -- Это значение не должно записаться
        wait for T_CLK * 2;
    end process;
    
end test;
