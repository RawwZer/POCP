----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2025 16:46:37
-- Design Name: 
-- Module Name: tb_gen_m_seq - Behavioral
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

entity tb_gen_m_seq is
--  Port ( );
end tb_gen_m_seq;

architecture test of tb_gen_m_seq is

    constant N_BITS : integer := 10;
    constant T_CLK  : time := 10 ns;

    component gen_m_seq is
        generic(N: integer);
        
        port (Clk: in std_logic; 
              Rst: in std_logic; 
              ShiftEn: in std_logic; 
              Dout: out std_logic_vector(N-1 downto 0));
    end component;

    signal clk_tb     : std_logic := '0';
    signal rst_tb     : std_logic;
    signal shift_en_tb: std_logic;
    signal dout_tb    : std_logic_vector(N_BITS-1 downto 0);

begin
    UUT: gen_m_seq generic map (N => N_BITS) port map (Clk=>clk_tb, 
                                                       Rst=>rst_tb, 
                                                       ShiftEn=>shift_en_tb, 
                                                       Dout=>dout_tb);

    clk_tb <= not clk_tb after T_CLK/2;

    stim_proc: process
    begin
        rst_tb <= '1'; shift_en_tb <= '0';
        wait for T_CLK * 2;
        rst_tb <= '0';
        wait for T_CLK;

        shift_en_tb <= '1';
        wait for T_CLK * 20;

    end process;
    
end test;
