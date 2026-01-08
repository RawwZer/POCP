----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2025 09:26:24
-- Design Name: 
-- Module Name: rs-latch_struc - Structural
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

entity rs_latch_struc is
    Port (
        S, R : in std_logic;
        Q, nQ : out std_logic);
end rs_latch_struc;

architecture Structural of rs_latch_struc is

    component nor2_base is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    signal buf1, buf2: std_logic;

begin

    Q <= buf1;
    nQ <= buf2;

    NOR_1: nor2_base port map (
                               A => S,
                               B => buf1,
                               Q => buf2
                              );
                              
    NOR_2: nor2_base port map (
                               A => R,
                               B => buf2,
                               Q => buf1
                              );


end Structural;
