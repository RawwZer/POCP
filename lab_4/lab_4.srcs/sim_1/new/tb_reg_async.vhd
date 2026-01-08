----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2025 16:44:36
-- Design Name: 
-- Module Name: tb_reg_async - Behavioral
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

entity tb_reg_async is
--  Port ( );
end tb_reg_async;

architecture test of tb_reg_async is

    constant N_BITS : integer := 4;
    constant T_WAIT : time := 10 ns;

    component reg_async is
        generic(N: integer);
        
        port (En: in std_logic; 
              Din: in std_logic_vector(N-1 downto 0); 
              Dout: out std_logic_vector(N-1 downto 0));
    end component;

    signal en_tb   : std_logic;
    signal din_tb  : std_logic_vector(N_BITS-1 downto 0);
    signal dout_tb : std_logic_vector(N_BITS-1 downto 0);

begin
    UUT: reg_async generic map (N => N_BITS) port map (En=>en_tb, 
                                                       Din=>din_tb, 
                                                       Dout=>dout_tb);

    stim_proc: process
    begin
        -- Тест 1: Прозрачный режим (En=1)
        en_tb <= '1';
        din_tb <= "1010";
        wait for T_WAIT; -- Dout должен стать "1010"
        din_tb <= "1111";
        wait for T_WAIT; -- Dout должен стать "1111"

        -- Тест 2: Режим хранения (En=0)
        en_tb <= '0';
        din_tb <= "0000"; -- Это значение не должно пройти
        wait for T_WAIT * 2;

    end process;
    
end test;