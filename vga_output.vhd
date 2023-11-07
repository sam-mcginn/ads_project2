--Top level file
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.vga_data.all;
use work.vga_pkg.all;

entity vga_output is
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
 end entity vga_output;
 
 architecture top of vga_output is
  --any signal declarations you may need
  signal point: coordinate;
  --signal vga_clock: std_logic;
  signal point_valid: boolean;

 begin
	driver: vga_fsm
		generic map (
			vga_res => vga_res_default			
		)
		port map (
			vga_clock => clock_in,
			reset => reset,
			point => point,
			point_valid => point_valid,
			h_sync => h_sync,
			v_sync => v_sync
		);


	output: pipeline_rgb_out
		generic map (
			num_iterations => num_iterations
		)
		port map (
			reset => reset,
			point => point,
			point_valid => point_valid,
			table_index => table_index,
			red => red,
			green => green,
			blue => blue
		);		
			
	reset_light: process(reset)
	begin
		if (reset = '0') then
			reset_led <= '1';
		else
			reset_led <= '0';
		end if;
	end process reset_light;

end architecture top;