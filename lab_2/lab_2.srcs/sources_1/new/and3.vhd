----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 00:21:14
-- Design Name: 
-- Module Name: and3 - Structural
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

entity and3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Q : out STD_LOGIC);
end and3;

architecture Structural of and3 is
    component and2_base is
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             Q : out STD_LOGIC);   
    end component;
    
    signal AB: STD_LOGIC;
begin

    U1: and2_base port map (
                            A => A,
                            B => B, 
                            Q => AB);
                         
    U2: and2_base port map (
                            A => AB, 
                            B => C, 
                            Q => Q);

end Structural;