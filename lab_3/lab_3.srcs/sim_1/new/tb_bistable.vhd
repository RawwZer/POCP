----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2025 17:02:28
-- Design Name: 
-- Module Name: tb_bistable - Behavioral
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

entity tb_bistable is
--  Port ( );
end tb_bistable;

architecture Behavioral of tb_bistable is

    component bistable_el is
        port ( nQ, Q : out std_logic );
    end component;

    signal q_tb, nq_tb : std_logic;
    
begin

    UUT: bistable_el port map ( Q => q_tb, nQ => nq_tb );

    stimulus_process: process
    begin
        report "Testing bistable element. No inputs to stimulate.";
        wait; -- Просто ждем вечно
    end process;
    
end Behavioral;
