library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.project2_pkg.all;

entity mandelbrot_stage is
	generic (
		num_iterations := 40
	)
	port (
		clock: in std_logic;
		
		-- Pass iteration count
		iteration_in: in natural;
		iteration_out: out natural;
		
		-- Pass color associated w/ current iteration
		table_index_in: in natural;
		table_index_out: out natural;
		
		-- Pass current seed value of mandelbrot set
		c_in: in ads_complex;
		c_out: out ads_complex
	);
end entity mandelbrot_stage;

architecture behavior of mandelbrot_stage is
begin
end architecture behavior;