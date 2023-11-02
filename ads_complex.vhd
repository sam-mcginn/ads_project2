-- this file is part of the ADS library

library work;
use work.ads_fixed.all;

package ads_complex is
	-- complex number in rectangular form
	type ads_complex is
	record
		re: ads_sfixed;
		im: ads_sfixed;
	end record ads_complex;

	---- functions

	-- make a complex number
	function ads_cmplx (
			re, im: in ads_sfixed
		) return ads_complex;

	-- returns l + r
	function "+" (
			l, r: in ads_complex
		) return ads_complex;

	-- returns l - r
	function "-" (
			l, r: in ads_complex
		) return ads_complex;

	-- returns l * r
	function "*" (
			l, r: in ads_complex
		) return ads_complex;

	-- returns the complex conjugate of arg
	function conj (
			arg: in ads_complex
		) return ads_complex;

	-- returns || arg || ** 2
	function abs2 (
			arg: in ads_complex
		) return ads_sfixed;
		
	-- returns ads_square 
	function ads_square (
			arg: in ads_complex
		) return ads_complex;

	-- constants
	constant complex_zero: ads_complex :=
					ads_cmplx(to_ads_sfixed(0), to_ads_sfixed(0));
	
		
end package ads_complex;

package body ads_complex is

	-- function implementations
	-- make a complex number
	function ads_cmplx (
			re, im: in ads_sfixed
		) return ads_complex
	is
		variable complex_num: ads_complex;
	begin
		complex_num.re := re;
		complex_num.im := im;
		return complex_num;
	end function ads_cmplx;
	
	function "+" (
			l, r: in ads_complex
		) return ads_complex
	is
		variable ret: ads_complex;
	begin
		ret.re := l.re + r.re;
		ret.im := l.im + r.im;
		return ret;
	end function "+";

	-- implement all other functions here
	function "-" (
			l, r: in ads_complex
		) return ads_complex
	is
		variable ret: ads_complex;
	begin
		ret.re := l.re - r.re;
		ret.im := l.im - r.im;
		return ret;
	end function "-";

	function "*" (
			l, r: in ads_complex
		) return ads_complex
	is
		variable ret: ads_complex;
	begin
		ret.re := l.re * r.re - (l.im * r.im);
		ret.im := l.re * r.im + r.re * l.im;
		return ret;
	end function "*";

	
	function conj (
			arg: in ads_complex
		) return ads_complex
	is
		variable ret: ads_complex;
	begin
		ret.re := arg.re;
		ret.im := -arg.im;
		return ret;
	end function conj;
	
	function abs2 (
			arg: in ads_complex
		) return ads_sfixed
	is
		variable ret: ads_sfixed;
	begin
	   ret := arg.re * arg.re + arg.im * arg.im;
		return ret;
	end function abs2;
	
	function ads_square (
			arg: in ads_complex
		) return ads_complex
	is
		variable ret: ads_complex;
	begin
		ret.re:= arg.re * arg.re;
		ret.im:= arg.im * arg.im;
		return ret;
	end function ads_square;
		
end package body ads_complex;