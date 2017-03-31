`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:59:54 08/09/2016
// Design Name:   AC
// Module Name:   D:/Custom_CPU/ACtest.v
// Project Name:  Custom_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ACtest;

	// Inputs
	reg [9:0] in1;
	reg clk;
	reg re;
	reg clear;

	// Outputs
	wire [9:0] out1;

	// Instantiate the Unit Under Test (UUT)
	AC uut (
		.in1(in1), 
		.out1(out1), 
		.clk(clk), 
		.re(re), 
		.clear(clear)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		clk = 0;
		re = 0;
		clear = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

