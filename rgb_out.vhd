library ieee;
use ieee.std_logic_1164.all;


library work;
use work.vga_data.all;


entity rgb_out is
	port (
		reset:			in	std_logic;
		point: 			in coordinate;
		point_valid: in boolean;
		

		red:			out	std_logic_vector (3 downto 0);
		green:		out	std_logic_vector (3 downto 0);
		blue:			out	std_logic_vector (3 downto 0)
	);
end entity rgb_out;

architecture gen of rgb_out is

-- any internal signals you may need
begin


color_output: process(reset, point, point_valid)
begin
	if (reset = '0')  or (not point_valid) then
		red <= "0000";
		green <= "0000";
		blue <= "0000";
	else
		red <= "0000";
		green <= "1010";
		blue <= "1111";
	end if;	
		
end process;
	
end architecture gen;