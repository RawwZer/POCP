----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 17:51:49
-- Design Name: 
-- Module Name: tb_mux - Behavioral
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

entity tb_mux is
end tb_mux;

architecture Behavioral of tb_mux is

    component mux_structural is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               S : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    component mux_behavioral is
    Port ( 
        in1: in std_logic;
        in2: in std_logic;
        in3: in std_logic;
        Q: out std_logic
    );
    end component;

    signal a_tb, b_tb, s_tb : std_logic; 
    signal q_tb_b, q_tb_s, error: std_logic;
    
     constant T_PERIOD : time := 200 ns;

begin

    error <=  q_tb_b xor q_tb_s;

    UUT_s: mux_structural port map (
                                    A => a_tb,
                                    B => b_tb,
                                    S => s_tb,
                                    Q => q_tb_s);
    
    UUT_b: mux_behavioral port map (
                                    in1 => a_tb,
                                    in2 => b_tb,
                                    in3 => s_tb,
                                    Q  => q_tb_b);
    
    
    stimulus_process: process
    begin        
        -- Тестовый случай 1: 0 + 0 + 0
        a_tb <= '0';
        b_tb <= '0';
        s_tb <= '0';
        wait for T_PERIOD; 

        -- Тестовый случай 2: 1 + 0 + 0
        a_tb <= '1';
        wait for T_PERIOD;

        -- Тестовый случай 3: 1 + 1 + 0
        b_tb <= '1';
        wait for T_PERIOD;

        -- Тестовый случай 4: 1 + 1 + 1
        s_tb <= '1';
        wait for T_PERIOD;

        -- Тестовый случай 5: 0 + 1 + 1
        a_tb <= '0';
        wait for T_PERIOD;

        wait;
        
    end process stimulus_process;
    
end Behavioral;
