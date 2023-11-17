-- rgb out for pipeline
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.project2_pkg.all;

library vga;
use vga.vga_data.all;
use vga.vga_pkg.all;

entity pipeline_rgb_out is
	generic (
		num_iterations: 	natural := 15
	);
	port (
		reset:			in	std_logic;
		--point: 			in coordinate;
		point_valid: 	in boolean;
		table_index:	in natural;
		

		red:			out	std_logic_vector (3 downto 0);
		green:		out	std_logic_vector (3 downto 0);
		blue:			out	std_logic_vector (3 downto 0)
	);
end entity pipeline_rgb_out;

-- For Project 2 - change color map and red, green, blue assignments

architecture gen of pipeline_rgb_out is
	-- Color map
	type rgb_array is array(0 to 19, 0 to 2) of integer range 0 to 255;
	constant color_map20: rgb_array := (
													(0, 0, 3),
													(0, 0, 6),
													(0, 0, 9),
													(0, 0, 12),
													(0, 6, 12),
													(3, 9, 15),
													(6, 10, 15),
													(6, 15, 15),
													(9, 15, 15),
													(12, 15, 15),
													(13, 15, 15),
													(14, 15, 15),
													
													(15, 10, 15),
													(15, 8, 12),
													(15, 6, 10),
													(12, 0, 6),
													(9, 0, 4),
													(6, 0, 3),
													(3, 0, 1),
													(0, 0, 0)													
												);
	constant color_map15: rgb_array := (
													(0, 0, 3),
													(0, 0, 6),
													(6, 15, 15),
													(9, 15, 15),
													(12, 15, 15),
													(13, 15, 15),
													(14, 15, 15),
													
													(15, 10, 15),
													(15, 8, 12),
													(15, 6, 10),
													(12, 0, 6),
													(9, 0, 4),
													(6, 0, 3),
													(3, 0, 1),
													(0, 0, 0),
													
													(0, 0, 0),
													(0, 0, 0),
													(0, 0, 0),
													(0, 0, 0),
													(0, 0, 0)
												);									
	
begin
	color_output: process(reset, point_valid, table_index)
		begin
			if (reset = '0')  or (not point_valid) then
				red <= "0000";
				green <= "0000";
				blue <= "0000";
			elsif num_iterations = 15 then
				red <= std_logic_vector(to_unsigned(color_map15(table_index, 0), 4));
				green <= std_logic_vector(to_unsigned(color_map15(table_index, 1), 4));
				blue <= std_logic_vector(to_unsigned(color_map15(table_index, 2), 4));
			else
				red <= std_logic_vector(to_unsigned(color_map20(table_index, 0), 4));
				green <= std_logic_vector(to_unsigned(color_map20(table_index, 1), 4));
				blue <= std_logic_vector(to_unsigned(color_map20(table_index, 2), 4));
			end if;			
	end process;
	
end architecture gen;