----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:02:28
-- Design Name: 
-- Module Name: tb_d_ff_master_slave - Behavioral
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

entity tb_d_ff_master_slave is
--  Port ( );
end tb_d_ff_master_slave;

architecture Behavioral of tb_d_ff_master_slave is

    component d_ff_master_slave is
        Port (
            D, CLK : in  std_logic;
            Q : out std_logic);
    end component;

    signal d_tb, clk_tb, q_tb : std_logic := '0';

begin

    UUT: d_ff_master_slave port map (D=>d_tb, CLK=>clk_tb, Q=>q_tb);

    clk_tb <= not clk_tb after 5 ns;

    process begin
        d_tb <= '1'; wait for 10 ns; -- Q станет '1' на фронте
        d_tb <= '0'; wait for 10 ns; -- Q станет '0' на фронте
        d_tb <= '1'; wait for 3 ns; 
        wait for 7 ns;             -- На следующем фронте Q все равно станет '1'
        wait;
    end process;
    
end Behavioral;
