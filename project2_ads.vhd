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
		horz_pixels: natural := 640;
		vert_pixels: natural := 480;
		
		thres_real: ads_sfixed := to_ads_sfixed(2.0);
		thres_im: ads_sfixed := to_ads_sfixed(2.0);
		
		min_real: ads_sfixed := to_ads_sfixed(-2.2);
		max_real: ads_sfixed := to_ads_sfixed(1.0);
		
		min_im: ads_sfixed := to_ads_sfixed(-1.2); 
		max_im: ads_sfixed := to_ads_sfixed(1.2)
		--min: ads_complex := ads_cmplx(to_ads_sfixed(-2.2), to_ads_sfixed(-1.2));
		--max: ads_complex := ads_cmplx(to_ads_sfixed(1.0), to_ads_sfixed(1.2));
	);
	port (
		-- FIX - assign to sys. clock
		clock: in std_logic
	);
end entity project2_ads;

architecture top_arch of project2_ads is
	type rgb_val is array(0 to 2) of natural range 0 to 255;
	type rgb_array is array(0 to num_iterations-1, 0 to 2) of natural range 0 to 255;

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
	signal index_nodes: pipeline_nodes_nat;
	
	constant threshold: ads_complex := ads_cmplx(thres_real, thres_im);
	signal curr_rgb: rgb_val;
	signal curr_h: natural := 0;
	signal curr_v: natural := 0;
begin
	curr_rgb <=
		(color_map(num_iterations-1, 0),
		 color_map(num_iterations-1, 1),
		 color_map(num_iterations-1, 2));
		
	-- instantiate num_iterations mandelbrot blocks (pipeline)
	z_nodes(0) <= ads_cmplx(to_ads_sfixed(0), to_ads_sfixed(0));
	index_nodes(0) <= 0;
	pipeline: for num in 0 to num_iterations-1 generate
		p0: mandelbrot_stage
			generic map (
				threshold => threshold
			)
			port map (
				clock => clock,
				c_in => c_nodes(num),
				c_out => c_nodes(num+1),
				z_in => z_nodes(num),
				z_out => z_nodes(num+1),
				table_index_in => index_nodes(num),
				table_index_out => index_nodes(num+1)
			);
	end generate pipeline;
	
	-- FIX: drive mandelbrot pipeline
	-- (scale R{c}, I{c} range <-- horizontal, vertical pixels)
	-- Iterate over each (scaled) pixed --> input to pipeline
	display: process (clock) is
		variable re_in: ads_sfixed;
		variable im_in: ads_sfixed;
		variable index_out: natural;
	begin
		if rising_edge(clock) then
			-- calculate seed = c_in
			re_in := ((max_real - min_real)*(to_ads_sfixed(curr_h/horz_pixels))) + min_real;
			im_in := ((max_im - min_im)*(to_ads_sfixed(curr_v/vert_pixels))) + min_im;
			
			-- input c_in to pipeline
			c_nodes(0) <= ads_cmplx(re_in, im_in);
			
			-- read index and get rgb val from color map
			index_out := index_nodes(num_iterations);
			curr_rgb <=
				(color_map(index_out, 0), color_map(index_out, 1), color_map(index_out, 2));
			
			-- FIX - drive vga from (maybe?) curr_rgb, curr_h, curr_v
			
			-- update pixel positions
			if curr_h < (horz_pixels-1) then
					curr_h <= curr_h + 1;
			else
				curr_h <= 0;
			end if;
			
			if curr_v < (vert_pixels-1) then
				curr_v <= curr_v +1;
			else
				curr_v <= 0;
			end if;
			
		end if;
	end process display;

end architecture top_arch;