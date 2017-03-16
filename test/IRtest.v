`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:44 08/07/2016
// Design Name:   IR
// Module Name:   D:/Custom_CPU/IRtest.v
// Project Name:  Custom_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IRtest;

	// Inputs
	reg [3:0] in1;
	reg clk;
	reg re;

	// Outputs
	wire [3:0] out1;

	// Instantiate the Unit Under Test (UUT)
	IR uut (
		.in1(in1), 
		.out1(out1), 
		.clk(clk), 
		.re(re)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		clk = 0;
		re = 0;

		// Wait 100 ns for global reset to finish
		#100;
		in1=7;
		clk=1;
		
		#100
		clk=0;
		
		#100
		clk=1;
		re=1;
        
		// Add stimulus here

	end
      
endmodule

