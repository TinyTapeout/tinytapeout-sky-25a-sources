library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ws2811 is
	generic(
		n_bits : natural := 8  -- Number of bits per pixel channel
	);
	port(
		-- Global Signals
		i_clock         : in  std_logic;
		i_reset         : in  std_logic;
		-- Hardware Connection
		i_trigger       : in  std_logic;
		o_data          : out std_logic;
		-- Data Link
		i_pixel_data    : in  std_logic_vector(n_bits - 1 downto 0)
	);
end entity ws2811;

architecture rtl of ws2811 is
	constant CYC_HIGH  : natural := 5;
	constant CYC_LOW   : natural := 3;
	constant CYC_LEN   : natural := CYC_HIGH + CYC_LOW;

	signal cyc_count   : integer range 0 to CYC_LEN;
	signal bit_count   : integer range 0 to n_bits;
	signal bit_data_in : std_logic := '0';

	signal rgb         : std_logic_vector(n_bits - 1 downto 0) := (others => '0');

	signal running     : std_logic := '0';

	signal debug : std_logic := '0';
begin
	process(i_reset, i_clock) is
	begin
		if i_reset = '1' then
			o_data <= '0';
		elsif rising_edge(i_clock) then
			if i_reset = '1' then
				cyc_count   <= 0;
				bit_count   <= 0;
				running     <= '0';
				bit_data_in <= '0';
				rgb  <= (others => '0');
				
				o_data <= '0';
			else
				if running = '0' and i_trigger = '1' then
					running <= '1';
					rgb <= i_pixel_data;
					bit_data_in <= i_pixel_data(n_bits - 1);
					cyc_count <= 1;
					
					o_data <= '1';
				end if;
				if running = '1' then
					if cyc_count < CYC_LEN - 1 then
						cyc_count <= cyc_count + 1;
						if (bit_data_in = '1' and cyc_count = CYC_HIGH) or (bit_data_in = '0' and cyc_count = CYC_LOW) then
							o_data <= '0';
						end if;
					else
						cyc_count <= 0;
						if bit_count < n_bits - 1 then
							bit_count <= bit_count + 1;
							bit_data_in <= rgb(n_bits - 1 - bit_count - 1);

							o_data <= '1';
						else 
							bit_count <= 0;
							running <= '0';

							o_data <= '0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
end architecture rtl;
