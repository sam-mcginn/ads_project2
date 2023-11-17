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
		num_iterations: 	natural := 40
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
	type rgb_array is array(0 to 39, 0 to 2) of integer range 0 to 255;
	constant color_map: rgb_array := (
(   9,  15,  15 ),
													( 7, 15, 15),
													( 6,  15,  15 ),
													( 5,  15,  15 ),
													( 4,  15,  15 ),
													( 3,  15,  15 ),
													( 2,  15,  15 ),
													( 7,  14,  15 ),
													( 6,  14,  15 ),
													( 7,  12,  15 ),
													( 6,  12,  15 ),
													( 3,  12,  15 ),
													( 1,  12,  15 ),
													(   0,  12,  15 ),
													(   6,   9,  15 ),
													(   4,   9,  15 ),
													(   3,   9,  15 ),
													(   1,   9,  15 ),
													(   3,   7,  15 ),
													(   1,   7,  15 ),
													(   0,   7,  15 ),
													(   0,   6,  15 ),
													(   0,   4,  15 ),
													(   0,   3,  15 ),
													(   0,   1,  15 ),
													(   0,   0,  15 ),
													(   0,   0,  14 ),
													(   0,   0,  13 ),
													(   0,   0,  12 ),
													(   0,   0,  11 ),
													(   0,   0,  10 ),
													(   0,   0,   9 ),
													(   0,   0,   8 ),
													(   0,   0,   7 ),
													(   0,   0,   6 ),
													(   0,   0,   5 ),
													(   0,   0,   4 ),
													(   0,   0,   3 ),
													(   0,   0,   1 ),
													(   0,   0,   0 )
												);
begin
	color_output: process(reset, point_valid, table_index)
		begin
			if (reset = '0')  or (not point_valid) then
				red <= "0000";
				green <= "0000";
				blue <= "0000";
			else
				red <= std_logic_vector(to_unsigned(color_map(table_index, 0), 4));
				green <= std_logic_vector(to_unsigned(color_map(table_index, 1), 4));
				blue <= std_logic_vector(to_unsigned(color_map(table_index, 2), 4));
			end if;			
	end process;
	
end architecture gen;