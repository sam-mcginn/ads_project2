-- VGA components package
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.vga_data.all;

package vga_pkg is
	-- Converts point, index --> RGB value using color map
	component pipeline_rgb_out is
		generic (
			num_iterations: 	natural := 40
		);
		port (
			reset:			in	std_logic;
			point: 			in coordinate;
			point_valid: 	in boolean;
			table_index:	in natural;
			

			red:			out	std_logic_vector (3 downto 0);
			green:		out	std_logic_vector (3 downto 0);
			blue:			out	std_logic_vector (3 downto 0)
		);
	end component pipeline_rgb_out;

	-- Converts point, index --> constant RGB value
	component rgb_out is
		port (
			reset:			in	std_logic;
			point: 			in coordinate;
			point_valid: in boolean;
			

			red:			out	std_logic_vector (3 downto 0);
			green:		out	std_logic_vector (3 downto 0);
			blue:			out	std_logic_vector (3 downto 0)
		);
	end component rgb_out;
	
	-- Controls sync signals and point count for VGA
	component vga_fsm is
		generic (
			vga_res:	vga_timing := vga_res_default
		);
		port (
			vga_clock:		in	std_logic;
			reset:			in	std_logic;

			point:			out	coordinate;
			point_valid:	out	boolean;

			h_sync:			out	std_logic;
			v_sync:			out 	std_logic
		);
	end component vga_fsm;
	
	-- Converts system clock to pixel clock frequency needed
	component clock_25 is
		port (
			inclk0: 			IN STD_LOGIC  := '0';
			c0: 				OUT STD_LOGIC ;
			locked: 			OUT STD_LOGIC 
		);
	end component clock_25;
	
	-- Complete VGA driver
	component vga_output is
		generic (
			num_iterations: 	natural := 40;
			vga_res:	vga_timing := vga_res_default
		);
		port (
			clock_in:		in	std_logic; 
			reset:			in	std_logic;
			h_sync: 			out std_logic;
			v_sync:			out std_logic;
			reset_led:  	out std_logic;
			
			table_index: in natural;
			red:			out	std_logic_vector (3 downto 0);
			green:		out	std_logic_vector (3 downto 0);
			blue:			out	std_logic_vector (3 downto 0)
		);
	 end component vga_output;
 

end package vga_pkg;

package body vga_pkg is
end package body vga_pkg;