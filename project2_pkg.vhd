-- Project 2 package
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.vga_data.all;
use work.vga_output.all;
use work.ads_complex.all;
use work.ads_fixed.all;

package project2_pkg is
	type rgb_array is array(0 to 39, 0 to 2) of integer range 0 to 255;

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
	
	component vga_output is
		generic (
			vga_res:	vga_timing := vga_res_default
		);
		port (
			clock_in:		in	std_logic; 
			reset:			in	std_logic;
			h_sync: 			out std_logic;
			v_sync:			out std_logic;
			reset_led:  	out std_logic;
			locked_led: 	out std_logic;
			
			red:			out	std_logic_vector (3 downto 0);
			green:		out	std_logic_vector (3 downto 0);
			blue:			out	std_logic_vector (3 downto 0)
		);
	 end component vga_output;
end package project2_pkg;