`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:42:32 08/07/2016
// Design Name:   PC
// Module Name:   D:/Custom_CPU/PCtest.v
// Project Name:  Custom_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCtest;

	// Inputs
	reg [14:0] in1;
	reg clk;
	reg re;
	reg inc;

	// Outputs
	wire [14:0] out1;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.in1(in1), 
		.out1(out1), 
		.clk(clk), 
		.re(re), 
		.inc(inc)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		clk = 0;
		re = 0;
		inc = 0;

		// Wait 100 ns for global reset to finish
		#100
		clk=1;
		in1=5;
		re=1;
		
		#100
		clk=0;
		re=0;
		
		#100
		clk=1;
		
		#100
		clk=0;
		
		#100
		clk=1;
		inc=1;
		
		#100
		clk=0;
		inc=0;
		
		#100
		clk=1;
		
        
		// Add stimulus here

	end
      
endmodule

