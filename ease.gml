/// @description ease(type,timer,start_pos,end_pos,duration);
/// @param type
/// @param curr_time
/// @param start_pos
/// @param end_pos
/// @param end_time
enum ez {
	linear,
	in_quad,
	out_quad,
	in_out_quad,
	in_cubic,
	out_cubic,
	in_out_cubic,
	in_quart,
	out_quart,
	in_out_quart,
	in_quint,
	out_quint,
	in_out_quint,
	in_sine,
	out_sine,
	in_out_sine,
	in_circ,
	out_circ,
	in_out_circ,
	in_expo,
	out_expo,
	in_out_expo,
	in_elastic,
	out_elastic,
	in_out_elastic,
	in_back,
	out_back,
	in_out_back,
	in_bounce,
	out_bounce,
	in_out_bounce
}

function ease() {

	var type			= argument[0]
	var curr_time		= argument[1]
	var start_pos		= argument[2]
	var end_pos			= argument[3]
	var end_time		= argument[4]
	var output			= undefined
	var reversed		= false
	var range_shift		= 0

	// if start position is higher than end position,
	// reverse them and remember that we did so.
	//
	// for example:
	//		start_pos = 30
	//		end_pos = 5
	// becomes:
	//		start_pos = 5
	//		end_pos = 30
	//		reversed = true
	//
	if end_pos < start_pos {
		var end_og		= end_pos
		var start_og	= start_pos
		start_pos		= end_og
		end_pos			= start_og
		reversed		= true
	}

	// if range doesn't begin at zero, slide it over to do so.
	// save this shift in range_shift.
	//
	// for example:
	//		start_pos = 10
	//		end_pos = 25
	// becomes:
	//		start_pos = 0
	//		end_pos = 15
	//		range_shift = -10
	//
	if start_pos != 0 {
		range_shift		= start_pos
		end_pos			-= start_pos
		start_pos		= 0
	}

	// if, for some reason, you've coded things in such a way
	// that the current time has exceed the end time, fear not.
	//
	if curr_time > end_time {
		curr_time = end_time
	}

	switch type {
	
		case ez.linear:
			output = end_pos * curr_time / end_time + start_pos
			break
		
		case ez.in_quad:
			curr_time /= end_time;
			output = end_pos * curr_time * curr_time + start_pos
			break
		
		case ez.out_quad:
			curr_time /= end_time;
			output = -end_pos * curr_time * (curr_time - 2) + start_pos
			break
		
		case ez.in_out_quad:
			curr_time /= end_time * 0.5;
			if (curr_time < 1) {
				output = end_pos * 0.5 * curr_time * curr_time + start_pos
			}
			else {
				output = end_pos * -0.5 * (--curr_time * (curr_time - 2) - 1) + start_pos
			}
			break
		
		case ez.in_cubic:
			output = end_pos * power(curr_time/end_time, 3) + start_pos
			break
		
		case ez.out_cubic:
			output = end_pos * (power(curr_time/end_time - 1, 3) + 1) + start_pos
			break
		
		case ez.in_out_cubic:
			curr_time /= end_time * 0.5
			if (curr_time < 1) {
				output = end_pos * 0.5 * power(curr_time, 3) + start_pos
			}
			else {
				output = end_pos * 0.5 * (power(curr_time - 2, 3) + 2) + start_pos
			}
			break
		
		case ez.in_quart:
			output = end_pos * power(curr_time / end_time, 4) + start_pos
			break
		
		case ez.out_quart:
			output = -end_pos * (power(curr_time / end_time - 1, 4) - 1) + start_pos
			break
		
		case ez.in_out_quart:
			curr_time /= end_time * 0.5
			if (curr_time < 1) {
				output = end_pos * 0.5 * power(curr_time, 4) + start_pos
			}
			else {
				output = end_pos * -0.5 * (power(curr_time - 2, 4) - 2) + start_pos
			}
			break
		
		case ez.in_quint:
			output = end_pos * power(curr_time / end_time, 5) + start_pos
			break
		
		case ez.out_quint:
			output = end_pos * (power(curr_time / end_time - 1, 5) + 1) + start_pos
			break
		
		case ez.in_out_quint:
			curr_time /= end_time * 0.5;
			if (curr_time < 1) {
				output = end_pos * 0.5 * power(curr_time, 5) + start_pos
			}
			else {
				output = end_pos * 0.5 * (power(curr_time - 2, 5) + 2) + start_pos
			}
			break
		
		case ez.in_sine:
			output = end_pos * (1 - cos(curr_time / end_time * (pi / 2))) + start_pos
			break
		
		case ez.out_sine:
			output = end_pos * sin(curr_time / end_time * (pi / 2)) + start_pos
			break
		
		case ez.in_out_sine:
			output = end_pos * 0.5 * (1 - cos(pi * curr_time / end_time)) + start_pos
			break
	
		case ez.in_circ:
			curr_time /= end_time;
			output = end_pos * (1 - sqrt(1 - curr_time * curr_time)) + start_pos
			break
	
		case ez.out_circ:
			curr_time = curr_time / end_time - 1;
			output = end_pos * sqrt(1 - curr_time * curr_time) + start_pos
			break
	
		case ez.in_out_circ:
			curr_time /= end_time * 0.5
			if (curr_time < 1) {
				output = end_pos * 0.5 * (1 - sqrt(1 - curr_time * curr_time)) + start_pos
			}
			else {	
				curr_time -= 2;
				output = end_pos * 0.5 * (sqrt(1 - curr_time * curr_time) + 1) + start_pos
			}
			break
	
		case ez.in_expo:
			output = end_pos * power(2, 10 * (curr_time / end_time - 1)) + start_pos
			break
	
		case ez.out_expo:
			output = end_pos * (-power(2, -10 * curr_time / end_time) + 1) + start_pos
			break
	
		case ez.in_out_expo:
			curr_time /= end_time * 0.5
			if (curr_time < 1) {
				output = end_pos * 0.5 * power(2, 10 * --curr_time) + start_pos
			}
			else {
				output = end_pos * 0.5 * (-power(2, -10 * --curr_time) + 2) + start_pos
			}
			break
	
		case ez.in_elastic:
			var _s = 1.70158
			var _p = 0
			var _a = end_pos
			if (curr_time == 0 || _a == 0) {
				output = start_pos
			}
			curr_time /= end_time
			if (curr_time == 1) {
				output = start_pos+end_pos
			}
			if (_p == 0) {
				_p = end_time*0.3;
			}	
			if (_a < abs(end_pos)) { 
				_a = end_pos
				_s = _p*0.25
			}
			else {
				_s = _p / (2 * pi) * arcsin (end_pos / _a)
			}
			output = -(_a * power(2,10 * (--curr_time)) * sin((curr_time * end_time - _s) * (2 * pi) / _p)) + start_pos
			break
		
		case ez.out_elastic:
			var _s = 1.70158
			var _p = 0
			var _a = end_pos;
			if (curr_time == 0 || _a == 0) {
				output = start_pos
			}
			curr_time /= end_time
			if (curr_time == 1) {
				output = start_pos + end_pos
			}
			if (_p == 0) {
				_p = end_time * 0.3
			}
			if (_a < abs(end_pos)) { 
				_a = end_pos
				_s = _p * 0.25
			}
			else {
				_s = _p / (2 * pi) * arcsin (end_pos / _a)
			}
			output = _a * power(2, -10 * curr_time) * sin((curr_time * end_time - _s) * (2 * pi) / _p ) + end_pos + start_pos
			break
	
		case ez.in_out_elastic:
			var _s = 1.70158
			var _p = 0
			var _a = end_pos;
			if (curr_time == 0 || _a == 0) {
				output = start_pos
			}
			curr_time /= end_time*0.5
			if (curr_time == 2) {
				output = start_pos+end_pos;
			}
		
			if (_p == 0) {
				_p = end_time * (0.3 * 1.5)
			}
		
			if (_a < abs(end_pos)) { 
				_a = end_pos; 
				_s = _p * 0.25
			}
			else {
				_s = _p / (2 * pi) * arcsin (end_pos / _a)
			}
		
			if (curr_time < 1) {
				output = -0.5 * (_a * power(2, 10 * (--curr_time)) * sin((curr_time * end_time - _s) * (2 * pi) / _p)) + start_pos
			}
			output = _a * power(2, -10 * (--curr_time)) * sin((curr_time * end_time - _s) * (2 * pi) / _p) * 0.5 + end_pos + start_pos
			break
		
		case ez.in_back:
			var _s = 1.70158
			curr_time /= end_time
			output = end_pos * curr_time * curr_time * ((_s + 1) * curr_time - _s) + start_pos
			break
		
		case ez.out_back:
			var _s = 1.70158
			curr_time = curr_time/end_time - 1
			output = end_pos * (curr_time * curr_time * ((_s + 1) * curr_time + _s) + 1) + start_pos
			break
	
		case ez.in_out_back:
			var _s = 1.70158;
			curr_time = curr_time/end_time*2
			if (curr_time < 1) {
				_s *= 1.525
				output = end_pos * 0.5 * (curr_time * curr_time * ((_s + 1) * curr_time - _s)) + start_pos
			}
			else {
				curr_time -= 2
				_s *= 1.525
				output = end_pos * 0.5 * (curr_time * curr_time * ((_s + 1) * curr_time + _s) + 2) + start_pos
			}
			break
	
		case ez.in_bounce:
			output = end_pos - ease(ez.out_bounce, end_time - curr_time, 0, end_pos, end_time) + start_pos
			break
	
		case ez.out_bounce:
			curr_time /= end_time;
			if (curr_time < 1/2.75) {
				output = end_pos * 7.5625 * curr_time * curr_time + start_pos
			}
			else if (curr_time < 2/2.75)	{
				curr_time -= 1.5/2.75;
				output = end_pos * (7.5625 * curr_time * curr_time + 0.75) + start_pos
			}
			else if (curr_time < 2.5/2.75) {
				curr_time -= 2.25/2.75;
				output = end_pos * (7.5625 * curr_time * curr_time + 0.9375) + start_pos
			}
			else {
				curr_time -= 2.625/2.75;
				output = end_pos * (7.5625 * curr_time * curr_time + 0.984375) + start_pos
			}
			break
	
		case ez.in_out_bounce:
			if (curr_time < end_time*0.5) {
				output = (ease(ez.in_bounce, curr_time*2, 0, end_pos, end_time)*0.5 + start_pos)
			}
			else {
				output = (ease(ez.out_bounce, curr_time*2 - end_time, 0, end_pos, end_time)*0.5 + end_pos*0.5 + start_pos)
			}
			break
	}

	// un-reverse
	if reversed {
		var range_output_to_end = end_pos - output
		output = end_og + range_output_to_end - range_shift
	}

	// un-shift
	output += range_shift

	// ezpz
	return output

	//
	//
	// TERMS OF USE - EASING EQUATIONS
	// 
	// Open source under the BSD License. 
	// 
	// Copyright © 2001 Robert Penner
	// All rights reserved.
	// 
	// Redistribution and use in source and binary forms, with or without modification, 
	// are permitted provided that the following conditions are met:
	// 
	// Redistributions of source code must retain the above copyright notice, this list of 
	// conditions and the following disclaimer.
	// Redistributions in binary form must reproduce the above copyright notice, this list 
	// of conditions and the following disclaimer in the documentation and/or other materials 
	// provided with the distribution.
	// 
	// Neither the name of the author nor the names of contributors may be used to endorse 
	// or promote products derived from this software without specific prior written permission.
	// 
	// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ez.AS ISez. AND ANY 
	// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
	// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
	//  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	//  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
	//  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
	// AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
	//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
	// OF THE POSSIBILITY OF SUCH DAMAGE. 
	//
	//
}
