----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2025 18:52:01
-- Design Name: 
-- Module Name: d_ff_master_slave - Structural
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

entity d_ff_master_slave is
    Port (
        D, CLK : in  std_logic;
        Q : out std_logic);
end d_ff_master_slave;

architecture Structural of d_ff_master_slave is

    component d_latch_gated_struct is
    Port (
        D, E : in  std_logic;
        Q, nQ : out std_logic);
    end component;
    
    signal clk_n, master_q : std_logic; 
    
begin

    clk_n <= not CLK;

    MASTER: d_latch_gated_struct port map (
        D => D,
        E => clk_n,
        Q => master_q
    );
    
    SLAVE: d_latch_gated_struct port map (
        D => master_q,
        E => CLK,
        Q => Q
    );

end Structural;
