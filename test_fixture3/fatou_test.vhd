-- top level entity
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

library work;
use work.project2_pkg.all;
library vga;
use vga.vga_data.all;
use vga.vga_pkg.all;
library ads;
use ads.ads_complex_pkg.all;
use ads.ads_fixed.all;

entity fatou_test is
	generic (
		threshold: ads_sfixed := to_ads_sfixed(2);
		num_iterations: natural := 27;
		horz_pixels: 		natural := 800;
		vert_pixels: 		natural := 600;
		h_pixels_inv: ads_sfixed := to_ads_sfixed(0.00125);
		v_pixels_inv: ads_sfixed := to_ads_sfixed(0.001667);
		
		thres_re: ads_sfixed := to_ads_sfixed(2.0);
		thres_im: ads_sfixed := to_ads_sfixed(2.0);
		
		min_real: ads_sfixed := to_ads_sfixed(-2.2);
		max_real: ads_sfixed := to_ads_sfixed(1.0);
		
		min_im: ads_sfixed := to_ads_sfixed(-1.2); 
		max_im: ads_sfixed := to_ads_sfixed(1.2)
	);
end entity fatou_test;

architecture test of fatou_test is
	-- pipeline nodes
	--remember to make hsync, vsync, and leds gonzo
	
	type pipeline_nodes_cmplx is array(0 to num_iterations) of ads_complex;
	type pipeline_nodes_natural is array (0 to num_iterations) of natural;
	type pipeline_nodes_boolean is array (0 to num_iterations) of boolean;
	
	signal vga_clock: 	std_logic	:= '0';
	signal reset:		std_logic;
	signal r_out:		std_logic_vector (3 downto 0);
	signal g_out:		std_logic_vector (3 downto 0);
	signal b_out:		std_logic_vector (3 downto 0);
		
	signal z_nodes: pipeline_nodes_cmplx;
	signal c_nodes: pipeline_nodes_cmplx;
	signal index_nodes: pipeline_nodes_natural;
	signal overflow_nodes: pipeline_nodes_boolean;
	constant vga_res:	vga_timing	:= vga_res_default;
	signal finished:	boolean		:= false;
	
	-- Current point
	signal curr_point: coordinate;
	signal point_valid: boolean;
	--signal curr_h: natural;
	--signal curr_v: natural;
	 
	-- VGA signals
	type boolean_array is array(0 to num_iterations) of boolean;
	signal point_valid_array: boolean_array;
	
	-- create seed point
	function make_seed_point (
			point: coordinate
		) return ads_complex
	is
		variable ret: ads_complex;
	begin
			ret.re := ((max_real - min_real)*(to_ads_sfixed(point.x)*h_pixels_inv)) + min_real;
			ret.im := ((max_im - min_im)*(to_ads_sfixed(point.y)*v_pixels_inv)) + min_im;
			return ret;
	end function make_seed_point;
		
begin

	vga_clock <= not vga_clock after 1 ps when not finished else '0';
	
	-- Controls sync signals and point count for VGA
	fsm: vga_fsm
		generic map (
			vga_res => vga_res_800x600
		)
		port map (
			vga_clock => vga_clock,
			reset => reset,
			reset_led => open,

			point => curr_point,
			point_valid => point_valid,

			h_sync => open,
			v_sync => open
		);		
		
	sync_regs: process(vga_clock, reset) is
	begin
		if reset = '0' then
			point_valid_array <= (others => false);
		elsif rising_edge(vga_clock) then
			point_valid_array <= point_valid & point_valid_array(0 to num_iterations - 1);
		end if;
	end process sync_regs;

	c_nodes(0) <= ads_cmplx(to_ads_sfixed(-0.8), to_ads_sfixed(0.2));
	index_nodes(0) <= 0;
	overflow_nodes(0) <= false;

	pipeline: for num in 0 to num_iterations-1 generate
		p0: mandelbrot_stage
			generic map (
				threshold => threshold,
				stage_number => num
			)
			port map (
				clock => vga_clock,
				reset => reset,
				c_in => c_nodes(num),
				c_out => c_nodes(num+1),
				z_in => z_nodes(num),
				z_out => z_nodes(num+1),
				table_index_in => index_nodes(num),
				table_index_out => index_nodes(num+1),
				overflow_in => overflow_nodes(num),
				overflow_out => overflow_nodes(num+1)
			);
	end generate pipeline;
		
	rgbout: pipeline_rgb_out
		generic map (
			num_iterations => num_iterations
		)
		port map (
			reset => reset,
			point_valid => point_valid_array(num_iterations),
			table_index => index_nodes(num_iterations),
			red => r_out,
			green => g_out,
			blue => b_out
		);	
		
	display_sim: process (vga_clock) is
		variable re_in: ads_sfixed;
		variable im_in: ads_sfixed;
		--variable index_out: natural;
	begin
		if rising_edge(vga_clock) then
			z_nodes(0) <= make_seed_point(curr_point);
		end if;
	end process display_sim;
	
	make_image: process
		variable output_line: line;
		
		begin
		-- header information
		write(output_line, string'("P3"));
		writeline(output, output_line);
		-- resolution
		write(output_line,
				integer'image(vga_res.horizontal.active)
					& string'(" ")
					& integer'image(vga_res.vertical.active));
		writeline(output, output_line);
		-- maximum value
		write(output_line, integer'image(15));
		writeline(output, output_line);

		-- reset dut
		reset <= '0';
		wait until rising_edge(vga_clock);
		reset <= '1';

		wait until point_valid_array(num_iterations);
		while curr_point.y < (vga_res.vertical.active + num_iterations) loop
			wait until rising_edge(vga_clock);
			if point_valid_array(num_iterations) then			
				--write(output_line, integer'image(curr_point.x) & string'(" ") & integer'image(to_integer(unsigned(r_out))));
				--writeline(output, output_line);
				write(output_line,
						integer'image(to_integer(unsigned(r_out))) & string'(" ")
							& integer'image(to_integer(unsigned(g_out))) & string'(" ")
							& integer'image(to_integer(unsigned(b_out))) & string'(" "));
				writeline(output, output_line);
			end if;
		end loop;	

		-- all done
		finished <= true;
		wait;
		
	end process make_image;

end architecture test;