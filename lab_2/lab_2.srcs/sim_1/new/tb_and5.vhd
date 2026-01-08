----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 17:51:49
-- Design Name: 
-- Module Name: tb_and5 - Behavioral
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

entity tb_and5 is
end tb_and5;

architecture Behavioral of tb_and5 is

    component and5_b is
    Port ( A : in std_logic_vector(4 downto 0);
           Q : out STD_LOGIC);
    end component;
    
    component and5_s is
    Port ( A : in std_logic_vector(4 downto 0);
           Q : out STD_LOGIC);
    end component;
    
    signal a_tb: std_logic_vector(4 downto 0):= (others => '0');
    signal q_tb_s, q_tb_b, error: std_logic;
    
    constant T_PERIOD : time := 10 ns;
    
begin

    error <=  q_tb_b xor q_tb_s;

    UUT_s: and5_s port map (
                            A => a_tb,
                            Q => q_tb_s);
    
    UUT_b: and5_b port map (
                            A => a_tb,
                            Q  => q_tb_b);


    stimulate : process
    begin
    
       for i in 0 to 31 loop
          a_tb <= std_logic_vector(to_unsigned(i, 5));
          wait for T_PERIOD;
       end loop;
       
       wait; 
    
    end process stimulate;
    
end Behavioral;
