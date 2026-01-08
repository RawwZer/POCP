----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2025 18:13:35
-- Design Name: 
-- Module Name: mux_d - Behavioral
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

entity mux_d is
generic(AMOUNT_GROUP:integer:=2);
Port (group_1 : in std_logic_vector(AMOUNT_GROUP - 1 downto 0);
      group_2: in std_logic_vector(AMOUNT_GROUP - 1 downto 0);
      E: in std_logic;
      res: out std_logic_vector(AMOUNT_GROUP - 1 downto 0)     
      );
end mux_d;

architecture Behavioral of mux_d is
begin

res <= group_1 when E='0' else group_2;

end Behavioral;
