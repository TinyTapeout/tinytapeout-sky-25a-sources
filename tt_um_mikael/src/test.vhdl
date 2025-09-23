library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is
    port(
        clk     : in std_logic;
        rst_n   : in std_logic;
        ena     : in std_logic;

        ui_in   : in std_logic_vector(7 downto 0);
        uo_out  : out std_logic_vector(7 downto 0);
        uio_in  : in std_logic_vector(7 downto 0);
        uio_out : out std_logic_vector(7 downto 0);
        uio_oe  : out std_logic_vector(7 downto 0)
    );
end entity;


architecture behaviour of test is
    signal num : signed(7 downto 0);
    signal den : signed(7 downto 0);
begin

    -- Fixed-point numerator
    num(7 downto 4) <= signed(ui_in(7 downto 4));
    num(3 downto 0) <= (others => '0');

    -- Fixed-point denominator
    den(3 downto 0) <= signed(ui_in(3 downto 0));
    den(7 downto 4) <= ui_in(3) & ui_in(3) & ui_in(3) & ui_in(3);

    process(clk) begin
        if rising_edge(clk) then
            if rst_n = '0' then
                uo_out <= (others => '0');
            else
                uo_out <= std_logic_vector(num / den);
            end if;
        end if;
    end process;

end architecture;
