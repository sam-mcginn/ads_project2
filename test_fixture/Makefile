.PHONY: all project-tgt ads-tgt mandelbrot-tgt vga-tgt

all: mandelbrot-tgt
	ghdl analyze pipeline_testa.vhd
	ghdl elaborate pipeline_test

project-tgt: vga-tgt
	ghdl analyze ../project2_pkg.vhd

ads-tgt:
	ghdl analyze --work=ads ../ads_fixed.vhd
	ghdl analyze --work=ads ../ads_complex.vhd

mandelbrot-tgt: ads-tgt vga-tgt project-tgt
	ghdl analyze ../mandelbrot_stage.vhd

vga-tgt:
	ghdl analyze --work=vga ../vga_data.vhd
	ghdl analyze --work=vga ../vga_fsm.vhd
	ghdl analyze --work=vga ../vga_pkg.vhd
