----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 11:07:23
-- Design Name: 
-- Module Name: and5_s - Structural
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

entity and5_s is
    Port ( A : in std_logic_vector(4 downto 0);
           Q : out STD_LOGIC);
end and5_s;

architecture Structural of and5_s is

    component and2_base is
      Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              Q : out STD_LOGIC);   
    end component;
    
    signal buffer_w: std_logic_vector(2 downto 0);

begin

    U0: and2_base port map (
                            A => A(0), 
                            B => A(1), 
                            Q => buffer_w(0));

    G: for i in 0 to 2 generate
    
        U_last: if i = 2 generate
        
            U: and2_base port map (
                                        A => buffer_w(i), 
                                        B => A(i + 2), 
                                        Q => Q);
        end generate U_last;
        
        U_middle: if i < 2 generate
        
            U: and2_base port map (
                                        A => buffer_w(i), 
                                        B => A(i + 2), 
                                        Q => buffer_w(i + 1));
        end generate U_middle;
        
    end generate G;

end Structural;
