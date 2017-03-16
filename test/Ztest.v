`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:23:08 08/07/2016
// Design Name:   Z
// Module Name:   D:/Custom_CPU/Ztest.v
// Project Name:  Custom_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Z
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ztest;

	// Inputs
	reg in1;
	reg clk;
	reg clear;

	// Outputs
	wire out1;

	// Instantiate the Unit Under Test (UUT)
	Z uut (
		.in1(in1), 
		.out1(out1), 
		.clk(clk), 
		.clear(clear)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		clk = 0;
		clear = 0;

		// Wait 100 ns for global reset to finish
		#100
		in1= 1'b1;
		clk=1;
		
		#100
		clk=0;
		
		#100
		clk=1;
		clear=1;
        
		// Add stimulus here

	end
      
endmodule

