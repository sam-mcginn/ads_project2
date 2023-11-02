library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

library work;
use work.vga_data.all;

entity vga_test is
end entity vga_test;

architecture test_fixture of vga_test is

	-- dut related
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
			v_sync:			out std_logic
		);
	end component vga_fsm;

	signal point:		coordinate;
	signal point_valid:	boolean;

	signal vga_clock: 	std_logic	:= '0';
	signal reset:		std_logic	:= '1';
	signal h_sync:		std_logic;
	signal v_sync:		std_logic;

	signal finished:	boolean		:= false;

	constant vga_res:	vga_timing	:= vga_res_default;

	-- testbench related
	constant horizontal_timing:	timing_data := vga_res.horizontal;
	constant vertical_timing:	timing_data := vga_res.vertical;
	constant point_total:		natural :=
			(horizontal_timing.active + horizontal_timing.front_porch
				+ horizontal_timing.sync_width + horizontal_timing.back_porch)
			* (vertical_timing.active + vertical_timing.front_porch
				+ vertical_timing.sync_width + vertical_timing.back_porch);

	function point_index (
			pnt:		in coordinate
		) return natural is
	begin
		return pnt.x + pnt.y * vga_res.horizontal.active;
	end function point_index;

	function point_count (
			pnt:		in coordinate
		) return natural is
	begin
		return pnt.x
				+ pnt.y * (horizontal_timing.active + horizontal_timing.front_porch
					+ horizontal_timing.sync_width + horizontal_timing.back_porch);
	end function point_count;


begin

	vga_clock <= not vga_clock after 1 ps when not finished else '0';

	dut: vga_fsm
		generic map (
			vga_res		=> vga_res
		)
		port map (
			vga_clock	=> vga_clock,
			reset		=> reset,
			point		=> point,
			point_valid	=> point_valid,
			h_sync		=> h_sync,
			v_sync		=> v_sync
		);

	emulate_screen: process
		variable output_line: line;
		-- variable idx: natural;
		variable red, green, blue: natural range 0 to 15;
		variable idx: unsigned(31 downto 0);
	begin
		-- header information
		write(output_line, string'("P3"));
		writeline(output, output_line);
		-- resolution
		write(output_line,
				integer'image(vga_res.horizontal.active)
					& string'(" ")
					& integer'image(vga_res.vertical.active));
		writeline(output, output_line);
		-- maximum value
		write(output_line, integer'image(15));
		writeline(output, output_line);

		-- reset dut
		reset <= '0';
		wait until rising_edge(vga_clock);
		reset <= '1';

		-- make image
		--while point.y < vga_res.vertical.active loop
		while point.y < (vertical_timing.active + vertical_timing.front_porch
				+ vertical_timing.sync_width + vertical_timing.back_porch -1) loop
			wait until rising_edge(vga_clock);
			if point_valid then
				idx := to_unsigned(point.x + point.y, 32);
				red := to_integer(idx(3 downto 0));
				green := to_integer(idx(7 downto 4));
				blue := to_integer(idx(11 downto 8));
				
				--write(output_line, integer'image(point.y) & string'(" ") & std_logic'image(v_sync));
				write(output_line,
						integer'image(red) & string'(" ")
							& integer'image(green) & string'(" ")
							& integer'image(blue) & string'(" "));
				writeline(output, output_line);
			end if;
		end loop;	

		-- all done
		finished <= true;
		wait;
	end process emulate_screen;

end architecture test_fixture;
