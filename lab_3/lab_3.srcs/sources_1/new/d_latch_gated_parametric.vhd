----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:29:51
-- Design Name: 
-- Module Name: d_latch_gated_parametric - Behavioral
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

entity d_latch_gated_parametric is
    generic ( T_DELAY : time := 10 ns );
    port ( D, E : in std_logic; Q : out std_logic );
end d_latch_gated_parametric;

architecture inertial_delay of d_latch_gated_parametric is
begin
    process(D, E)
    begin
        if E = '1' then
            Q <= D after T_DELAY;
        end if;
    end process;
end inertial_delay;

architecture transport_delay of d_latch_gated_parametric is
begin
    process(D, E)
    begin
        if E = '1' then
            Q <= transport D after T_DELAY;
        end if;
    end process;
end transport_delay;