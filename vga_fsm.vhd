library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library vga;
use vga.vga_data.all;


entity vga_fsm is
	generic (
		vga_res:	vga_timing := vga_res_default
	);
	port (
		vga_clock:		in	std_logic;
		reset:			in	std_logic;
		reset_led:  	out std_logic;

		point:			out	coordinate;
		point_valid:	out	boolean;

		h_sync:			out	std_logic;
		v_sync:			out 	std_logic
	);
end entity vga_fsm;

architecture fsm of vga_fsm is

signal vga_point: coordinate := (x=>0,y=>0);
--signal vga_clock: std_logic := '0';
-- any internal signals you may need
begin


--clock_divider: process(clock_in)
--begin
	--if(clock_in'event and clock_in='1') then
		--vga_clock <= not vga_clock;
	--end if;
--end process;

-- updates current pixel on each clock cycle OR when reset
position_counter: process(vga_clock, reset)
begin
	if (reset = '0') then
		vga_point <= make_coordinate(0,0);
		--point <= vga_point;		--   --PA
	elsif (vga_clock'event) and (vga_clock = '1') then
		vga_point <= next_coordinate(vga_point, vga_res);
		--point <= vga_point;		--   --PA
	end if;
		
end process;

hsync: process(vga_clock, reset, vga_point)
begin
	if (vga_res.sync_polarity = active_low and reset = '0') then
		h_sync <= '1';
	elsif (vga_res.sync_polarity = active_high and reset = '0') then
		h_sync <= '0';
	elsif(vga_clock'event and vga_clock = '1') then
		h_sync <= do_horizontal_sync(vga_point, vga_res);
	end if;
	
end process;

vsync: process(vga_clock, reset, vga_point)
begin
	if (vga_res.sync_polarity = active_low and reset = '0') then
		v_sync <= '1';
	elsif (vga_res.sync_polarity = active_high and reset = '0') then
		v_sync <= '0';
	elsif(vga_clock'event and vga_clock = '1') then
		v_sync <= do_vertical_sync(vga_point, vga_res);
	end if;
end process;

is_active: process(vga_clock,vga_point)
begin
	if (vga_clock'event and vga_clock = '1') then
		point_valid <= point_visible(vga_point, vga_res);
		point <= vga_point;
	end if;
end process;

reset_light: process(reset)
	begin
		if (reset = '0') then
			reset_led <= '1';
		else
			reset_led <= '0';
		end if;
	end process reset_light;
	-- implement methodology to drive outputs here
	-- use vga_data functions and types to make your life easier
end architecture fsm;
