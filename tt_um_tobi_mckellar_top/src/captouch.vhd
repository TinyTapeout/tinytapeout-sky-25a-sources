library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity capacitivetouch is
    port (
        clk       : in  std_logic;  -- System clock
        reset     : in  std_logic;  -- Asynchronous reset
        cap_in    : in std_logic;
        cap_out   : out std_logic;
        cap_oe    : out std_logic;
        btn       : out std_logic   -- btn output
    );
end capacitivetouch;

architecture Behavioral of capacitivetouch is

    type ctrl_state_t is (S_INIT_DISCHARGE, S_INIT_SAMPLE, S_RUN_DISCHARGE, S_RUN_SAMPLE);
    signal state : ctrl_state_t := S_INIT_DISCHARGE;


    -- Signals
    -- Potential Todo : reduce counter size
    signal counter        : integer range 0 to 2**15 - 1; -- Counts clock cycles for rise time measurement
    signal calibration_rise_time      : integer range 0 to 2**15 - 1; -- Recorded rise time in clock cycles
    -- signal rise_time      : integer range 0 to 2**15 - 1; -- Recorded rise time in clock cycles
    signal discharging : std_logic; -- Indicates discharge phase completion
    signal btn_state      : std_logic; -- btn default state
    signal btn_state_debouncer : std_logic_vector(3 downto 0);
    signal debounced_btn_state : std_logic;

    signal sync_ff1 : std_logic;
    signal sync_ff2 : std_logic;
begin

    cap_out <= '0';
    cap_oe <= '1' when discharging = '1' else '0';

    -- Main process
    process(clk, reset)
        variable rise_time_var : integer;
        variable btn_state_var : std_logic;
    begin
        if reset = '0' then
            counter        <= 0;
            -- rise_time_var      <= 0;
            discharging    <= '1';
            btn_state      <= '0';
            sync_ff1       <= '0';
            sync_ff2       <= '0';
            btn_state_debouncer <= "0000";
            debounced_btn_state <= '0';
            rise_time_var := 0;
            state <= S_INIT_DISCHARGE;

        elsif rising_edge(clk) then
            sync_ff1 <= cap_in;
            sync_ff2 <= sync_ff1;

            case state is
                when S_INIT_DISCHARGE =>
                    counter <= counter + 1;
                    discharging <= '1';
                    if counter >= 10 then
                        counter <= 0;
                        state <= S_INIT_SAMPLE;
                        discharging <= '0';
                    end if;

                when S_INIT_SAMPLE =>
                    counter <= counter + 1;
                    if sync_ff2 = '1' then
                        calibration_rise_time <= counter;
                        counter <= 0;
                        state <= S_RUN_DISCHARGE;
                        discharging <= '1';
                    end if;

                when S_RUN_DISCHARGE =>
                    counter <= counter + 1;
                    discharging <= '1';
                    if counter >= 10 then
                        counter <= 0;
                        state <= S_RUN_SAMPLE;
                        discharging <= '0';
                    end if;

                when S_RUN_SAMPLE =>
                counter <= counter + 1;
                    if sync_ff2 = '1' then
                        rise_time_var := counter;
                        counter <= 0;
                        discharging <= '1';

                        if rise_time_var > calibration_rise_time + to_integer(shift_right(to_unsigned(calibration_rise_time, 10), 3)) then
                            btn_state <= '1';
                        else
                            btn_state <= '0';
                        end if;
                        btn_state_debouncer(3 downto 1) <= btn_state_debouncer(2 downto 0);
                        btn_state_debouncer(0) <= btn_state;
                        state <= S_RUN_DISCHARGE;
                        discharging <= '1';
                        counter <= 0;

                        if btn_state_debouncer = "1111" then
                            debounced_btn_state <= '1';
                        elsif btn_state_debouncer = "0000" then
                            debounced_btn_state <= '0';
                        end if;
                    end if;
            end case;
        end if;
    end process;

    btn <= debounced_btn_state;

end Behavioral;
