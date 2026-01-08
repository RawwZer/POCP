----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 11:26:29
-- Design Name: 
-- Module Name: full_adder_s - Structural
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

entity full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end full_adder;

architecture Structural of full_adder is

    component half_adder is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Sum : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
    signal carry_1, carry_2, sum_w: std_logic;

begin

    U0: half_adder port map (
                             A => A,
                             B => B, 
                             Sum => sum_w,
                             Cout => carry_1);
                             
    U1: half_adder port map (
                             A => Cin,
                             B => sum_w,                          
                             Sum => Sum, 
                             Cout => carry_2);
                             
    Cout <= carry_1 or carry_2;          

end Structural;
