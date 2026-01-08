----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 10:51:55
-- Design Name: 
-- Module Name: demux_s - Structural
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

entity demux_s is
    Port ( D : in STD_LOGIC;
           S : in std_logic_vector(1 downto 0);
           Q : out std_logic_vector(3 downto 0));
end demux_s;

architecture Structural of demux_s is

    component and3 is
      Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              C: in STD_LOGIC;
              Q : out STD_LOGIC);   
    end component;
    
    component inv_base is
      Port ( A: in STD_LOGIC;
              nA : out STD_LOGIC);   
    end component;
    
    signal nS0, nS1: std_logic;
    
begin
    
    U0: inv_base port map (
                            A => S(0), 
                            nA => nS0);
                            
    U1: inv_base port map (
                            A => S(1), 
                            nA => nS1);

    U2: and3 port map (
                        A => D, 
                        B => nS1, 
                        C => nS0, 
                        Q => Q(0));
                        
    U3: and3 port map (
                        A => D, 
                        B => nS1, 
                        C => S(0), 
                        Q => Q(1));
                        
    U4: and3 port map (
                        A => D, 
                        B => S(1), 
                        C => nS0, 
                        Q => Q(2));
                        
    U5: AND3 port map (
                        A => D, 
                        B => S(1), 
                        C => S(0), 
                        Q => Q(3));

end Structural;
