----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.09.2025 19:51:48
-- Design Name: 
-- Module Name: express - Behavioral
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

entity express is
Port ( 
    in1: in std_logic;
    in2: in std_logic;
    in3: in std_logic;
    Q: out std_logic;
    nQ: out std_logic
);
end express;

architecture Behavioral of express is
    signal r_buffer: std_logic;
begin
    
   -- Q=in1*in2+in3*~(in2)
   Q <= r_buffer;
   nQ <=not r_buffer;
   
   r_buffer <= (in1 and in2) or (in3 and (not in2));

end Behavioral;
