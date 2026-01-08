----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 17:51:49
-- Design Name: 
-- Module Name: tb_demux - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_demux is
end tb_demux;

architecture Behavioral of tb_demux is

    component demux_b is
        Port ( D : in STD_LOGIC;
               S : in std_logic_vector(1 downto 0);
               Q : out std_logic_vector(3 downto 0));
    end component;

    component demux_s is
        Port ( D : in STD_LOGIC;
               S : in std_logic_vector(1 downto 0);
               Q : out std_logic_vector(3 downto 0));
    end component;

    signal d_tb, error : std_logic := '0';
    signal s_tb : std_logic_vector(1 downto 0) := "00";
    signal q_tb_b, q_tb_s : std_logic_vector(3 downto 0);
    
    constant T_PERIOD : time := 100 ns;

begin

    error <= '1' when q_tb_b /= q_tb_s else '0';

    UUT_s: demux_s port map (
                             D => d_tb,
                             S => s_tb,
                             Q => q_tb_s);
    
    UUT_b: demux_b port map (
                             D => d_tb,
                             S => s_tb,
                             Q => q_tb_b);


    stimulus_process: process
    begin
        d_tb <= '0';
        
        for j in 0 to 3 loop
            s_tb <= std_logic_vector(to_unsigned(j, 2));
            wait for T_PERIOD;
        end loop;
        
        wait for T_PERIOD * 2;
        
        d_tb <= '1';
        
        for j in 0 to 3 loop
            s_tb <= std_logic_vector(to_unsigned(j, 2));
            wait for T_PERIOD;
        end loop;

        wait;
        
    end process stimulus_process;
    
end Behavioral;
