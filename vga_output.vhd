--Top level file
library ieee;
use ieee.std_logic_1164.all;
library vga;
use vga.vga_data.all;

entity vga_output is
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
		
		red:			out	std_logic_vector (3 downto 0);
		green:		out	std_logic_vector (3 downto 0);
		blue:			out	std_logic_vector (3 downto 0)
	);
 end entity vga_output;
 
 architecture top of vga_output is
	--components 
		component vga_fsm is
			generic (
				vga_res:	vga_timing := vga_res_default
			);
			port (
				vga_clock:		in	std_logic; --25Mhz
				reset:			in	std_logic;

				point:			out	coordinate;
				point_valid:	out	boolean;

				h_sync:			out	std_logic;
				v_sync:			out 	std_logic
			);
		end component vga_fsm;
		
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
		
		component clock_25 is
			port (
				inclk0: 			IN STD_LOGIC  := '0';
				c0: 				OUT STD_LOGIC ;
				locked: 			OUT STD_LOGIC 
			);
		end component clock_25;
		

  --any signal declarations you may need
  signal point: coordinate;
  signal vga_clock: std_logic;
  signal point_valid: boolean;

 begin
	driver: vga_fsm
		generic map (
			vga_res => vga_res_default			
		)
		port map (
			vga_clock => vga_clock,
			reset => reset,
			point => point,
			point_valid => point_valid,
			h_sync => h_sync,
			v_sync => v_sync
		);


	output: rgb_out
		port map (
			reset => reset,
			point => point,
			point_valid => point_valid,
			red => red,
			green => green,
			blue => blue
		);
		
	clk: clock_25
		port map (
			inclk0 => clock_in,
			c0 => vga_clock,
			locked => locked_led
		);
			
			
	reset_light: process(reset)
	begin
		if (reset = '0') then
			reset_led <= '1';
		else
			reset_led <= '0';
		end if;
	end process;
		-- make instance of ro_puf



end architecture top;