-- top level entity
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.project2_pkg.all;
use work.vga_data.all;
use work.ads_complex.all;
use work.ads_fixed.all;

entity project2_ads is
	generic (
		num_iterations: natural := 40;
		horz_pixels: positive := 640;
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
	-- FIX: convert min, max values in fixed type --> complex type
	type rgb_array is array(0 to num_iterations-1, 0 to 2) of natural range 0 to 255;
	
	constant r: natural := 0;
	constant g: natural := 0;
	constant b: natural := 0;
	-- FIX: create color table
	constant color_map: rgb_array := (
													(153, 255, 255),
													(125, 255, 255),
													(102, 255, 255),
													(85, 255, 255),
													(70, 255, 255),
													(51, 255, 255),
													(35, 255, 255),
													(125, 225, 255),
													(100, 225, 255),
													(125, 200, 255),
													
													(100, 200, 255),
													(50, 200, 255),
													(25, 200, 255),
													(0, 200, 255),
													(100, 153, 255),
													(75, 153, 255),
													(51, 153, 255),
													(25, 150, 255),
													(50, 125, 255),
													(25, 125, 255),

													(0, 125, 255),
													(0, 100, 255),
													(0, 75, 255),
													(0, 50, 255),
													(0, 25, 255),
													(0, 0, 255),
													(0, 0, 235),
													(0, 0, 220),
													(0, 0, 204),
													(0, 0, 185),
													
													(0, 0, 170),
													(0, 0, 153),
													(0, 0, 135),
													(0, 0, 119),
													(0, 0, 102),
													(0, 0, 85),
													(0, 0, 70),
													(0, 0, 51),
													(0, 0, 25),
													(0, 0, 0)
												);
	type pipeline_nodes_cmplx is array(0 to num_iterations) of ads_complex;
	type pipeline_nodes_nat is array (0 to num_iterations) of natural;
	
	signal z_nodes: pipeline_nodes_cmplx;
	signal c_nodes: pipeline_nodes_cmplx;
	signal threshold_nodes: pipeline_nodes_cmplx;
	signal index_nodes: pipeline_nodes_nat;
	
begin
	-- FIX: instantiate num_iterations mandelbrot blocks (pipeline)
	pipeline: for num in 0 to num_iterations-1 generate
		p0: mandelbrot_stage
			port map (
				clock => clock,
				threshold_in => threshold_nodes(num),
				threshold_out => threshold_nodes(num+1),
				c_in => c_nodes(num),
				c_out => c_nodes(num+1),
				z_in => z_nodes(num),
				z_out => z_nodes(num+1),
				table_index_in => index_nodes(num),
				table_index_out => index_nodes(num+1)
			);
	end generate pipeline;
	-- FIX: calculate input vector(s) to mandelbrot pipeline
	-- (scale R{c}, I{c} range --> horizontal, vertical pixels)
	
	-- FIX: Iterate over each (scaled) pixed --> input to pipeline
	
	-- FIX: Convert table index output of pipeline --> RBG, drive VGA
	
end architecture top_arch;