----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 10:51:55
-- Design Name: 
-- Module Name: demux_b - Behavioral
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

entity demux_b is
    Port ( D : in STD_LOGIC;
           S : in std_logic_vector(1 downto 0);
           Q : out std_logic_vector(3 downto 0));
end demux_b;

architecture Behavioral of demux_b is
begin
     process(D, S)
       begin
           Q <= "0000";
           case S is
               when "00" =>
                   Q(0) <= D;
               when "01" =>
                   Q(1) <= D;
               when "10" =>
                   Q(2) <= D;
               when others => -- "11"
                   Q(3) <= D;
           end case;
     end process;

end Behavioral;
