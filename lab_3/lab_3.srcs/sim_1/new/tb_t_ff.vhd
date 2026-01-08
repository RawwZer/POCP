----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:02:28
-- Design Name: 
-- Module Name: tb_t_ff - Behavioral
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

entity tb_t_ff is
--  Port ( );
end tb_t_ff;

architecture Behavioral of tb_t_ff is

    component t_ff is
        Port (
            T, CLK : in  std_logic;
            Q : out std_logic);
    end component;
    
    signal t_tb, clk_tb, q_tb : std_logic := '0';
  
begin
    
    UUT: t_ff port map (T=>t_tb, CLK=>clk_tb, Q=>q_tb);
    
    clk_tb <= not clk_tb after 5 ns;
    
    process begin
        -- Режим хранения (T=0)
        t_tb <= '0'; wait for 20 ns; -- Q не должен меняться
            
        -- Режим переключения (T=1)
        t_tb <= '1'; wait for 40 ns; -- Q должен инвертироваться каждый такт
            
        -- Снова хранение
        t_tb <= '0'; wait for 20 ns; -- Q должен замереть
        wait;
    end process;

end Behavioral;
