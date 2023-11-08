library ieee;
use ieee.std_logic_1164.all;

use work.vga_data.all;
use work.ads_fixed.all;
use work.ads_complex.all;

entity pipeline_test is
end entity pipeline_test;

architecture test of pipeline_test is
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
	
	type pipeline_nodes_cmplx is array(0 to num_iterations) of ads_complex;
	type pipeline_nodes_natural is array (0 to num_iterations) of natural;
	type pipeline_nodes_boolean is array (0 to num_iterations) of boolean;
	signal z_nodes: pipeline_nodes_cmplx;
	signal c_nodes: pipeline_nodes_cmplx;
	signal index_nodes: pipeline_nodes_natural;
	signal overflow_nodes: pipeline_nodes_boolean;
	
	signal vga_clock: std_logic := '1';
	signal done: boolean := false;
	
begin

	clock <= not clock after 5 ns when not done else '0';
	z_nodes(0) <= complex_zero;
	index_nodes(0) <= 0;
	overflow_in(0) <= false;

-- for .. generate
pipeline: for num in 0 to num_iterations-1 generate
	p0: mandelbrot
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

	test_fixture: process is
	begin
		for x in -20 to 15 loop
		end loop;
	end process test_fixture;

end architecture test;
