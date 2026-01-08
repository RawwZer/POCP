----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.09.2025 23:59:47
-- Design Name: 
-- Module Name: comb_dev - Structural
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

entity comb_dev is
    Port ( W : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Z : in STD_LOGIC;
           Q : out STD_LOGIC);
end comb_dev;

architecture Structural of comb_dev is
    
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
    
    component and3 is
      Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              C : in STD_LOGIC;
              Q : out STD_LOGIC);   
    end component;    
    
    signal WXY,YZ: std_logic;
begin

    U1: and3 port map (
                       A => W, 
                       B => X, 
                       C => Y,
                       Q => WXY);
                            
    U2: and2_base port map (
                            A => Y, 
                            B => Z,
                            Q => YZ); 
   
    U3: or2_base port map (
                            A => WXY, 
                            B => YZ, 
                            Q => Q);
end Structural;
