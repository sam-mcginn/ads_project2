-- Project 2 package

component mandelbrot_stage is
	generic (
		num_iterations := 40
	)
	port (
		clock: in std_logic;
		
		-- Pass iteration count
		iteration_in: in natural;
		iteration_out: out natural;
		
		-- Pass color associated w/ current iteration
		table_index_in: in natural;
		table_index_out: out natural;
		
		-- Pass current seed value of mandelbrot set
		c_in: in ads_complex;
		c_out: out ads_complex
	);
end component mandelbrot_stage;