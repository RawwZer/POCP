----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.09.2025 23:59:47
-- Design Name: 
-- Module Name: mux4_structural - Structural
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

entity mux4_structural is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           S : in STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2: out STD_LOGIC);
end mux4_structural;

architecture Structural of mux4_structural is
    component mux_structural is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component;
    
begin
    
    U1: mux_structural port map(
                                A => A,
                                B => B,
                                S => S,
                                Q => Q1);
                                
    U2: mux_structural port map(
                                A => C,
                                B => D,
                                S => S,
                                Q => Q2);
end Structural;
