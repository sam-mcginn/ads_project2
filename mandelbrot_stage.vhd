library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.project2_pkg.all;
use work.vga_data.all;
use work.ads_complex.all;
use work.ads_fixed.all;

entity mandelbrot_stage is
	generic (
		threshold: ads_complex
	);
	port (
		clock: in std_logic;
		-- Threshold
		--threshold_in: in ads_complex;
		--threshold_out: out ads_complex;
		
		-- Initial seed value
		c_in: in ads_complex;
		c_out: out ads_complex;
		
		-- Pass current seed value of mandelbrot set
		z_in: in ads_complex;
		z_out: out ads_complex;
		
		-- Pass color index associated w/ current iteration
		table_index_in: in natural;
		table_index_out: out natural
	);
end entity mandelbrot_stage;

architecture behavior of mandelbrot_stage is
	signal z_curr: ads_complex := z_in;
begin
	-- start with c=c_in, z=0; compute fc(z) = z^2 + c
	stage: process (clock) is
	begin
		if rising_edge(clock) then
			-- FIX - need ads_square fn. in ads_complex
			z_curr <= ads_square(z_curr) + c_in;
			
			if (abs2(threshold) > abs2(z_curr)) then
				table_index_out <= (table_index_in + 1);
			else
				table_index_out <= table_index_in;
			end if;
			
			z_out <= z_curr;
			c_out <= c_in;
			--threshold_out <= threshold_in;
		end if;
	end process stage;
		
	
end architecture behavior;