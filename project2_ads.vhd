-- top level entity
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.project2_pkg.all;
use work.vga_data.all;
use work.vga_pkg.all;
use work.ads_complex.all;
use work.ads_fixed.all;

entity project2_ads is
	generic (
		num_iterations: 	natural := 10;
		horz_pixels: 		natural := 800;
		vert_pixels: 		natural := 600;
		
		thres_re: ads_sfixed := to_ads_sfixed(2.0);
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
		clock: in std_logic;
		reset: in std_logic;
		
		-- VGA outputs
		horz_sync: 		out std_logic;
		vert_sync:		out std_logic;
		r_out:			out	std_logic_vector (3 downto 0);
		g_out:			out	std_logic_vector (3 downto 0);
		b_out:			out	std_logic_vector (3 downto 0);
		
		-- PLL indicators
		reset_led:  	out std_logic;
		locked_led: 	out std_logic
	);
end entity project2_ads;

architecture top_arch of project2_ads is
	-- pipeline nodes
	type pipeline_nodes_cmplx is array(0 to num_iterations) of ads_complex;
	type pipeline_nodes_natural is array (0 to num_iterations) of natural;
	type pipeline_nodes_boolean is array (0 to num_iterations) of boolean;
	signal z_nodes: pipeline_nodes_cmplx;
	signal c_nodes: pipeline_nodes_cmplx;
	signal index_nodes: pipeline_nodes_natural;
	signal overflow_nodes: pipeline_nodes_boolean;
	
	-- Convert threshold to complex format
	constant threshold: ads_sfixed := (thres_im*thres_im) + (thres_re*thres_re);
	
	-- Current point
	signal curr_point: coordinate;
	signal point_valid: boolean;
	signal curr_h: natural;
	signal curr_v: natural;
	
	-- VGA signals
	signal hsync_reg: std_logic_vector(0 to num_iterations-1);
	signal hsync_in: std_logic;
	signal vsync_reg: std_logic_vector(0 to num_iterations-1);
	signal vsync_in: std_logic;
	signal vga_clock: std_logic;
	
	-- create seed point
	function make_seed_point (
			point: coordinate
		) return ads_complex
	is
		variable ret: ads_complex;
	begin
			ret.re := ((max_real - min_real)*(to_ads_sfixed(point.x/horz_pixels))) + min_real;
			ret.im := ((max_im - min_im)*(to_ads_sfixed(point.y/vert_pixels))) + min_im;
			return ret;
	end function make_seed_point;
		
begin
	-- Controls sync signals and point count for VGA
	fsm: vga_fsm
		generic map (
			vga_res => vga_res_default
		)
		port map (
			vga_clock => vga_clock,
			reset => reset,
			reset_led => reset_led,

			point => curr_point,
			point_valid => point_valid,

			h_sync => hsync_in,
			v_sync => vsync_in
		);
		
	-- VGA clock
		clk: clock_25
		port map (
			inclk0 => clock,
			c0 => vga_clock,
			locked => locked_led
		);
		
	-- shift register for sync signals to match pipeline delay
	sync_regs: process(vga_clock, reset) is
	begin
		if rising_edge(vga_clock) then
			hsync_reg <= hsync_in & hsync_reg(0 to num_iterations - 2);
			vsync_reg <= vsync_in & vsync_reg(0 to num_iterations - 2);
		end if;
	end process sync_regs;
	
	-- Use output of 'shift reg' to drive sync outputs
	horz_sync <= hsync_reg(num_iterations-1);
	vert_sync <= vsync_reg(num_iterations-1);
		
	-- z, index should both start at 0
	z_nodes(0) <= ads_cmplx(to_ads_sfixed(0), to_ads_sfixed(0));
	index_nodes(0) <= 0;
	overflow_nodes(0) <= false;
	c_nodes(0) <= make_seed_point(curr_point);

	-- instantiate num_iterations mandelbrot blocks (pipeline)
	pipeline: for num in 0 to num_iterations-1 generate
		p0: mandelbrot_stage
			generic map (
				threshold => threshold,
				stage_number => num
			)
			port map (
				clock => vga_clock,
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
		
	-- Decompose curr_point into real/horz and im/vert:
	--curr_h <= curr_point.x;
	--curr_v <= curr_point.y;
	
	-- Drive mandelbrot pipeline
	--display: process (vga_clock) is
	--	variable re_in: ads_sfixed;
	--	variable im_in: ads_sfixed;
		--variable index_out: natural;
	--begin
	--	if rising_edge(vga_clock) then
			-- calculate seed = c_in from current point
			-- (scale R{c}, I{c} range <-- horizontal, vertical pixels)

			
			-- input c_in to pipeline
		--c_nodes(0) <= ads_cmplx(re_in, im_in);
			
			-- read index from output
			--index_out := index_nodes(num_iterations);
	--	end if;
	--end process display;
	
	-- Drive VGA output from color map:
	output: pipeline_rgb_out
		generic map (
			num_iterations => num_iterations
		)
		port map (
			reset => reset,
			point_valid => point_valid,
			table_index => index_nodes(num_iterations),
			red => r_out,
			green => g_out,
			blue => b_out
		);	

end architecture top_arch;