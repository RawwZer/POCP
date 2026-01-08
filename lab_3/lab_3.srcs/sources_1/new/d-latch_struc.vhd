----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.10.2025 09:26:24
-- Design Name: 
-- Module Name: d-latch_struc - Structural
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

entity d_latch_struc is
    Port (
        D : in std_logic;
        Q, nQ : out std_logic);
end d_latch_struc;

architecture Structural of d_latch_struc is

    component rs_latch_struc is
        Port (
            S, R : in std_logic;
            Q, nQ : out std_logic);
    end component;
    
    
    component inv_base is
        Port ( A : in STD_LOGIC;
               nA : out STD_LOGIC);
    end component;
    
    signal buf: std_logic;

begin

    INV: inv_base port map (
                             A => D,
                             nA => buf
                            );

    RS_LATCH: rs_latch_struc port map (
                                       S => D,
                                       R => buf,
                                       Q => Q,
                                       nQ => nQ
                                      );

end Structural;
