-- top level entity
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.project2_pkg.all;

entity project2_ads is
	generic (
		num_iterations: natural := 40;
		hori_pixels: positive := 640;
		vert_pixels: positive := 480;
		
		-- FIX: convert to fixed type ?
		min_real: real := -2.2;
		min_im: real := -1.2;
		max_real: real := 1.0;
		max_im: real := 1.2
	);
	-- FIX - just adding something here so Quartus will synthesize
	port (
		clock: in std_logic
		);
end entity project2_ads;

architecture top_arch of project2_ads is
	-- delete:
	signal temp: std_logic := '0';
	
	-- FIX: convert min, max values in fixed type --> complex type
	
	-- FIX: create color table
begin
	-- delete:
	temp <= '1' when rising_edge(clock) else '0';
	
	-- FIX: instantiate num_iterations mandelbrot blocks (pipeline)
	
	-- FIX: calculate input vector(s) to mandelbrot pipeline
	-- (scale R{c}, I{c} range --> horizontal, vertical pixels)
	
	-- FIX: Iterate over each (scaled) pixed --> input to pipeline
	
	-- FIX: Convert table index output of pipeline --> RBG, drive VGA
	
end architecture top_arch;