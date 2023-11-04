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
		threshold: ads_complex
	);
	port (
		clock: in std_logic;
		-- Threshold
		--threshold_in: in ads_complex;
		--threshold_out: out ads_complex;
		
		-- Initial seed value
		c_in: in ads_complex;
		c_out: out ads_complex;
		
		-- Pass current seed value of mandelbrot set
		z_in: in ads_complex;
		z_out: out ads_complex;
		
		-- Pass color index associated w/ current iteration
		table_index_in: in natural;
		table_index_out: out natural
	);
	end component mandelbrot_stage;
end package project2_pkg;