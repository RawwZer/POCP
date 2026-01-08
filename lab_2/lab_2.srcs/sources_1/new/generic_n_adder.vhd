----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.09.2025 11:26:29
-- Design Name: 
-- Module Name: generic_n_adder - Structural
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

entity generic_n_adder is
    generic (
        WIDTH : positive := 8 
    );
    Port ( A : in std_logic_vector(WIDTH - 1 downto 0);
           B : in std_logic_vector(WIDTH - 1 downto 0);
           Sum : out std_logic_vector(WIDTH downto 0));
end generic_n_adder;

architecture Structural of generic_n_adder is

    component full_adder is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Cin : in STD_LOGIC;
               Sum : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
    signal carry_chain: std_logic_vector (WIDTH+1 downto 0);

begin

    carry_chain(0) <= '0';

    G: for i in 0 to WIDTH - 1 generate
    
        U: full_adder port map (
                                           A => A(i),
                                           B => B(i),
                                           Cin => carry_chain(i),       
                                           Sum => Sum(i),
                                           Cout => carry_chain(i + 1));          
        
    end generate G;

    Sum(WIDTH) <= carry_chain(WIDTH);

end Structural;
