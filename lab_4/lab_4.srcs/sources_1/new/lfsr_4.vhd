----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2025 18:01:14
-- Design Name: 
-- Module Name: lfsr_4 - Behavioral
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

entity lfsr_4 is
    port (CLK   : in  std_logic;
          RESET : in  std_logic; -- Асинхронный сброс
          Q_OUT : out std_logic_vector(3 downto 0)
    );
end lfsr_4;

library ieee;
use ieee.std_logic_1164.all;

architecture moore_fsm of lfsr_4 is

    type lfsr_state_type is (
        STATE_0001, STATE_0011, STATE_0111, STATE_1111, STATE_1110,
        STATE_1101, STATE_1010, STATE_0101, STATE_1011, STATE_0110,
        STATE_1100, STATE_1001, STATE_0010, STATE_0100, STATE_1000
    );

    -- Сигналы для хранения текущего и следующего состояний
    signal current_state, next_state : lfsr_state_type;

begin

    -- БЛОК 1: РЕГИСТР СОСТОЯНИЙ
    -- Это "переход в следующее состояние на следующий такт".
    state_register_proc : process(CLK, RESET)
    begin
        if RESET = '1' then
            current_state <= STATE_0001;
        elsif rising_edge(CLK) then
            current_state <= next_state;
        end if;
    end process;

    -- БЛОК 2: ЛОГИКА СЛЕДУЮЩИХ СОСТОЯНИЙ
    next_state_logic_proc : process(current_state)
    begin
        case current_state is
            when STATE_0001 => next_state <= STATE_0011; 
            when STATE_0011 => next_state <= STATE_0111; 
            when STATE_0111 => next_state <= STATE_1111; 
            when STATE_1111 => next_state <= STATE_1110;
            when STATE_1110 => next_state <= STATE_1101;
            when STATE_1101 => next_state <= STATE_1010;
            when STATE_1010 => next_state <= STATE_0101;
            when STATE_0101 => next_state <= STATE_1011;
            when STATE_1011 => next_state <= STATE_0110;
            when STATE_0110 => next_state <= STATE_1100;
            when STATE_1100 => next_state <= STATE_1001;
            when STATE_1001 => next_state <= STATE_0010;
            when STATE_0010 => next_state <= STATE_0100;
            when STATE_0100 => next_state <= STATE_1000;
            when STATE_1000 => next_state <= STATE_0001; 
        end case;
    end process;

    -- БЛОК 3: ЛОГИКА ВЫХОДОВ (Выходы автомата Мура)
    -- Для автомата Мура выход зависит ТОЛЬКО от ТЕКУЩЕГО состояния.
    output_logic_proc : process(current_state)
    begin
        case current_state is
            when STATE_0001 => Q_OUT <= "0001";
            when STATE_0011 => Q_OUT <= "0011";
            when STATE_0111 => Q_OUT <= "0111";
            when STATE_1111 => Q_OUT <= "1111";
            when STATE_1110 => Q_OUT <= "1110";
            when STATE_1101 => Q_OUT <= "1101";
            when STATE_1010 => Q_OUT <= "1010";
            when STATE_0101 => Q_OUT <= "0101";
            when STATE_1011 => Q_OUT <= "1011";
            when STATE_0110 => Q_OUT <= "0110";
            when STATE_1100 => Q_OUT <= "1100";
            when STATE_1001 => Q_OUT <= "1001";
            when STATE_0010 => Q_OUT <= "0010";
            when STATE_0100 => Q_OUT <= "0100";
            when STATE_1000 => Q_OUT <= "1000";
        end case;
    end process;

end moore_fsm;
