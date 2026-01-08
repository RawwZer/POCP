----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2025 09:26:24
-- Design Name: 
-- Module Name: bistable_el - Structural
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

entity bistable_el is
    Port ( 
        nQ, Q : out std_logic
    );
end bistable_el;

architecture Structural of bistable_el is

    component inv_base is
        Port ( A : in STD_LOGIC;
               nA : out STD_LOGIC);
    end component;
    
    signal buf1, buf2: std_logic;
    
     attribute DONT_TOUCH : string;
       
     attribute DONT_TOUCH of buf1 : signal is "true";
     attribute DONT_TOUCH of buf2 : signal is "true";

begin

    nQ <= buf2;
    Q <= buf1;

    INV1: inv_base port map (
                             A => buf1,
                             nA => buf2
                            );
    INV2: inv_base port map (
                              A => buf2,
                              nA => buf1
                             );
                             
end Structural;
