library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tt_um_spi2ws2811x16 is
	port(
		clk		: in 	std_logic;
		rst_n	: in 	std_logic;
		ena		: in 	std_logic;
		ui_in   : in 	std_logic_vector(7 downto 0);
		uio_in  : in 	std_logic_vector(7 downto 0);
		uio_oe	: out   std_logic_vector(7 downto 0);
		uo_out	: out   std_logic_vector(7 downto 0);
		uio_out	: out   std_logic_vector(7 downto 0)
	);
end entity tt_um_spi2ws2811x16;

architecture rtl of tt_um_spi2ws2811x16 is
	constant n_strips : integer := 8;

	signal rst 		     : std_logic;
	signal led_rst	     : std_logic;

	signal command       : std_logic_vector(7 downto 0);
	signal command_ready : std_logic;
	signal word          : std_logic_vector(7 downto 0);
	signal word_ready    : std_logic;

	signal strip_trigger : std_logic_vector(n_strips - 1 downto 0);
	signal strip_counter : integer range 0 to n_strips - 1 := 0;
begin
	rst <= not rst_n;
	led_rst <= not (rst_n and ui_in(0));
	uio_oe <= (others => '0');
	uio_out <= (others => '0');

	spi_controller : entity work.spi
	port map(
		i_clock => clk,
		i_reset => rst,

		i_cs => ui_in(0),
		i_copi => ui_in(1),

		o_word => word,
		o_word_ready => word_ready
	);

	-- Instanciate 8 LED controllers
	led_o:
	for i in 0 to 7 generate
		led: entity work.ws2811
		port map(
			i_clock => clk,
			i_reset => led_rst,

			i_trigger => strip_trigger(i),
			i_pixel_data => word,
			
			o_data => uo_out(i)
		);
	end generate led_o;

	process(clk, rst, word_ready)
	begin
		if rst = '1' then
			strip_counter <= 0;
		elsif falling_edge(word_ready) then
			if strip_counter < n_strips - 1 then
				strip_counter <= strip_counter + 1;
			else
				strip_counter <= 0;
			end if;
		end if;
	end process;

	gen_strip_trigger: for i in 0 to n_strips - 1 generate
		strip_trigger(i) <= '1' when (word_ready = '1' and strip_counter = i) else '0';
	end generate gen_strip_trigger;

end architecture rtl;