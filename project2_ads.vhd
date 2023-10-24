-- top level entity
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- library work;
-- use work.project2_pkg.all;

entity project2_ads is
	-- FIX - just adding something here so Quartus will synthesize
	port (
		clock: in std_logic
		);
end entity project2_ads;

architecture top_arch of project2_ads is
	-- delete:
	signal temp: std_logic := '0';
begin
	-- delete:
	temp <= '1' when rising_edge(clock) else '0';
end architecture top_arch;