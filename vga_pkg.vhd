-- VGA components package
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.vga_data.all;

package vga_pkg is
		-- Color map
		type rgb_array is array(0 to 39, 0 to 2) of integer range 0 to 255;
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
	
	-- Converts point, index --> RGB value using color map
	component pipeline_rgb_out is
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
			vga_res:	vga_timing := vga_res_default
		);
		port (
			clock_in:		in	std_logic; 
			reset:			in	std_logic;
			h_sync: 			out std_logic;
			v_sync:			out std_logic;
			reset_led:  	out std_logic;
			locked_led: 	out std_logic;
			
			table_index: in natural;
			red:			out	std_logic_vector (3 downto 0);
			green:		out	std_logic_vector (3 downto 0);
			blue:			out	std_logic_vector (3 downto 0)
		);
	 end component vga_output;
 

end package vga_pkg;

package body vga_pkg is
end package body vga_pkg;