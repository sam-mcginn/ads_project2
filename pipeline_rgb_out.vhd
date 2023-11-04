-- rgb out for pipeline
library ieee;
use ieee.std_logic_1164.all;


library work;
use work.vga_data.all;


entity rgb_out is
	port (
		reset:			in	std_logic;
		point: 			in coordinate;
		point_valid: 	in boolean;
		table_index:	in natural;
		

		red:			out	std_logic_vector (3 downto 0);
		green:		out	std_logic_vector (3 downto 0);
		blue:			out	std_logic_vector (3 downto 0)
	);
end entity rgb_out;

architecture gen of rgb_out is
	-- FIX: 24 bit RGB values, need 12 bit values and --> std logic vector
	type rgb_array is array(0 to num_iterations-1, 0 to 2) of unsigned range 0 to 255;
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

-- any internal signals you may need
begin


color_output: process(reset, point, point_valid, table_index)
begin
	if (reset = '0')  or (not point_valid) then
		red <= "0000";
		green <= "0000";
		blue <= "0000";
	else
		red <= )(color_map(table_index, 0));
		green <= (color_map(table_index, 1));
		blue <= (color_map(table_index, 2));
	end if;	
		
end process;
	
end architecture gen;