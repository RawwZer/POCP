----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2025 18:22:30
-- Design Name: 
-- Module Name: d_latch_gated_struct - Structural
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

entity d_latch_gated_struct is
    Port (
        D, E : in  std_logic;
        Q : out std_logic);
end d_latch_gated_struct;

architecture Structural of d_latch_gated_struct is

    component rs_latch_struc is
        Port (
            S, R : in std_logic;
            Q, nQ : out std_logic);
    end component;
    
    
    component inv_base is
        Port ( A : in STD_LOGIC;
               nA : out STD_LOGIC);
    end component;
    
    
    component and2_base is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    signal buf, buf_and, buf_and2: std_logic;

begin

    RS_LATCH: rs_latch_struc port map (
                                       S => buf_and,
                                       R => buf_and,
                                       Q => Q,
                                       nQ => nQ
                                      );
                                       
    AND2_1: and2_base port map (
                                A => E,
                                B => D,
                                Q => buf_and
                               );
                               
    AND2_2: and2_base port map (
                                A => E,
                                B => buf,
                                Q => buf_and2
                               );
                               
    INV: inv_base port map (
                            A => D,
                            nA => buf
                           );

end Structural;
