----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 18:57:49
-- Design Name: 
-- Module Name: tb_delays - Behavioral
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

entity tb_delays is
end tb_delays;

architecture testbench of tb_delays is

    constant T_DELAY_VALUE : time := 10 ns;
    constant T_GLITCH      : time := 3 ns;  
    constant T_NORMAL_PULSE: time := 20 ns;


    component rs_latch_parametric is
        generic ( T_DELAY : time );
        port ( S, R : in std_logic; Q, nQ : out std_logic );
    end component;

    component d_latch_parametric is
        generic ( T_DELAY : time );
        port ( D : in std_logic; Q : out std_logic );
    end component;

    component d_latch_gated_parametric is
        generic ( T_DELAY : time );
        port ( D, E : in std_logic; Q : out std_logic );
    end component;
    
    signal s_tb, r_tb, d_tb, e_tb : std_logic;
    
    signal q_rs_inertial, nq_rs_inertial     : std_logic;
    signal q_rs_transport, nq_rs_transport  : std_logic;
    signal q_d_latch_inertial, q_d_latch_transport : std_logic;
    signal q_d_gated_inertial, q_d_gated_transport   : std_logic;

begin

    UUT_RS_Inertial: rs_latch_parametric generic map (T_DELAY => T_DELAY_VALUE)
        port map (S=>s_tb, R=>r_tb, Q=>q_rs_inertial, nQ=>nq_rs_inertial);
        
    UUT_RS_Transport: rs_latch_parametric generic map (T_DELAY => T_DELAY_VALUE)
        port map (S=>s_tb, R=>r_tb, Q=>q_rs_transport, nQ=>nq_rs_transport);
    
    UUT_D_Latch_Inertial: d_latch_parametric generic map (T_DELAY => T_DELAY_VALUE)
        port map (D=>d_tb, Q=>q_d_latch_inertial);

    UUT_D_Latch_Transport: d_latch_parametric generic map (T_DELAY => T_DELAY_VALUE)
        port map (D=>d_tb, Q=>q_d_latch_transport);
        
    UUT_D_Gated_Inertial: d_latch_gated_parametric generic map (T_DELAY => T_DELAY_VALUE)
        port map (D=>d_tb, E=>e_tb, Q=>q_d_gated_inertial);

    UUT_D_Gated_Transport: d_latch_gated_parametric generic map (T_DELAY => T_DELAY_VALUE)
        port map (D=>d_tb, E=>e_tb, Q=>q_d_gated_transport);

    stimulus_process: process
    begin
        s_tb <= '0'; r_tb <= '0'; d_tb <= '0'; e_tb <= '1';
        wait for 20 ns;
        
        -- === Тест 1: Нормальный импульс (длиннее задержки) ===
        s_tb <= '1'; d_tb <= '1';
        wait for T_NORMAL_PULSE;
        s_tb <= '0'; d_tb <= '0';
        wait for 30 ns;
        
        -- === Тест 2: Короткий импульс-глитч (короче задержки) ===
        s_tb <= '1'; d_tb <= '1';
        wait for T_GLITCH;
        s_tb <= '0'; d_tb <= '0';
        wait for 30 ns;
        
        wait;
    end process;
    
end testbench;