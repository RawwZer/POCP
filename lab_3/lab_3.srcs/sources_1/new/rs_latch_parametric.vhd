----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:29:51
-- Design Name: 
-- Module Name: rs_latch_parametric - Behavioral
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

entity rs_latch_parametric is
    generic (
        T_DELAY : time := 10 ns -- Параметр для задержки
    );
    port (
        S, R : in  std_logic;
        Q, nQ : out std_logic
    );
end rs_latch_parametric;

architecture inertial_delay of rs_latch_parametric is

    signal q_internal : std_logic := '0'; 

begin

    Q <= q_internal;
    nQ <= not q_internal;
    
    process(S, R)
    begin
        -- наивысший приоритет
        if R = '1' then
            q_internal <= '0' after T_DELAY;
        elsif S = '1' then
            q_internal <= '1' after T_DELAY;
        end if;
    end process;
end inertial_delay;

architecture transport_delay of rs_latch_parametric is

    signal q_internal : std_logic := '0'; 

begin

    Q <= q_internal;
    nQ <= not q_internal;
    
    process(S, R)
    begin
        -- наивысший приоритет
        if R = '1' then
            q_internal <= transport '0' after T_DELAY;
        elsif S = '1' then
            q_internal <= transport '1' after T_DELAY;
        end if;
    end process;
    
end transport_delay;