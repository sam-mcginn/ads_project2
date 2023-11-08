-- Project 2 package
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library vga;
use vga.vga_data.all;
use vga.vga_pkg.all;
library ads;
use ads.ads_complex_pkg.all;
use ads.ads_fixed.all;

package project2_pkg is

	component mandelbrot_stage is
		generic (
			threshold: ads_sfixed;
			stage_number: natural
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
			
			-- overflow flags
			overflow_in:	in boolean;
			overflow_out:	out	boolean;
			
			-- Pass color index associated w/ current iteration
			table_index_in: in natural;
			table_index_out: out natural
		);
	end component mandelbrot_stage;
end package project2_pkg;