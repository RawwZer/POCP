----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.09.2025 23:59:47
-- Design Name: 
-- Module Name: mux_structural - Structural
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

entity mux_structural is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : in STD_LOGIC;
           Q : out STD_LOGIC);
end mux_structural;

architecture Structural of mux_structural is

    component and2_base is
      Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              Q : out STD_LOGIC);   
    end component;
    
    component or2_base is
      Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              Q : out STD_LOGIC);   
    end component;
    
    component inv_base is
      Port ( A: in STD_LOGIC;
              nA : out STD_LOGIC);   
    end component;
    
    signal nS,nSA,SB: std_logic;

begin
    U1: inv_base port map (
                            A => S,
                            nA => nS);
                            
    U2: and2_base port map (
                            A => A,
                            B => nS,
                            Q => nSA);
    U3: and2_base port map (
                            A => B,
                            B => S,
                            Q => SB);
    U4: or2_base port map (
                            A => nSA,
                            B => SB,
                            Q => Q);
end Structural;
