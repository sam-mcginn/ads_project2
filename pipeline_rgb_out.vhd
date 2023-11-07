-- rgb out for pipeline
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.vga_data.all;
use work.project2_pkg.all;
use work.vga_pkg.all;

entity pipeline_rgb_out is
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