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
		threshold: ads_sfixed;
		stage_number: natural
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
		
		-- overflow flags
		overflow_in:	in boolean;
		overflow_out:	out	boolean;
		
		-- Pass color index associated w/ current iteration
		table_index_in: in natural;
		table_index_out: out natural
	);
end entity mandelbrot_stage;

architecture behavior of mandelbrot_stage is
	--signal z_curr: ads_complex := z_in;
begin
	-- start with c=c_in, z=0; compute fc(z) = z^2 + c
	stage: process (clock) is
		variable z_curr: ads_complex;
		variable re_square: ads_sfixed;
		variable im_square: ads_sfixed;
		variable ab_term: ads_sfixed;
	begin
		if rising_edge(clock) then
			-- square = a^2 + 2abi - b^2
			-- absolute value = a^2 + b^2
			re_square := z_in.re * z_in.re;
			im_square := z_in.im * z_in.im;
			ab_term := z_in.re * z_in.im; -- * to_ads_sfixed(2);
			--z_curr := ads_cmplx(re_square - im_square, ab_term);
			
			--if (threshold > (re_square + im_square)) then
			--	table_index_out <= stage_number;
			--else
			--	table_index_out <= table_index_in;
			--end if;
			
			if (threshold > (re_square + im_square)) or overflow_in then
				overflow_out <= true;
			else
				overflow_out <= false;
			end if;
			
			if overflow_in then
				table_index_out <= table_index_in;
			else
				table_index_out <= stage_number;
			end if;
			
			--z_out <= z_curr;
			z_out.re <= re_square - im_square + c_in.re;
			z_out.im <= ab_term + ab_term + c_in.im;
			c_out <= c_in;
		end if;
	end process stage;
		
	
end architecture behavior;