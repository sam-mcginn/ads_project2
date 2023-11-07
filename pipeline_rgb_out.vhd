-- rgb out for pipeline
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.vga_data.all;
use work.project2_pkg.all;
use work.vga_pkg.all;

entity pipeline_rgb_out is
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
end entity pipeline_rgb_out;

architecture gen of pipeline_rgb_out is
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
begin
	color_output: process(reset, point, point_valid, table_index)
		begin
			if (reset = '0')  or (not point_valid) then
				red <= "0000";
				green <= "0000";
				blue <= "0000";
			else
				red <= std_logic_vector(to_unsigned((color_map(table_index, 0)/17), red'length));
				green <= std_logic_vector(to_unsigned((color_map(table_index, 1)/17), green'length));
				blue <= std_logic_vector(to_unsigned((color_map(table_index, 2)/17), blue'length));
			end if;			
	end process;
	
end architecture gen;