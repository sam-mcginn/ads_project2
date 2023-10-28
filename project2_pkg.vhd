-- Project 2 package
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.vga_data.all;
use work.ads_complex.all;
use work.ads_fixed.all;

package project2_pkg is
	component mandelbrot_stage is
		generic (
			num_iterations: positive := 40
		);
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
	end component mandelbrot_stage;
end package project2_pkg;