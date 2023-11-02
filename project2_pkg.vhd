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
		port (
		clock: in std_logic;
		
		threshold: in ads_complex;
		curr_c: in ads_complex;
		-- Pass iteration count
		--iteration_in: in natural;
		--iteration_out: out natural;
		
		-- Pass current seed value of mandelbrot set
		z_in: in ads_complex;
		z_out: out ads_complex;
		
		-- Pass color index associated w/ current iteration
		table_index_in: in natural;
		table_index_out: out natural
	);
	end component mandelbrot_stage;
end package project2_pkg;