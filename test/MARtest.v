`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:51:16 08/15/2016
// Design Name:   MAR
// Module Name:   D:/Custom_CPU/MARtest.v
// Project Name:  Custom_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MAR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MARtest;

	// Inputs
	reg [14:0] in1;
	reg [14:0] in2;
	reg clk;
	reg re;
	reg we;

	// Outputs
	wire [14:0] out1;

	// Instantiate the Unit Under Test (UUT)
	MAR uut (
		.in1(in1), 
		.in2(in2), 
		.out1(out1), 
		.clk(clk), 
		.re(re), 
		.we(we)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		clk = 0;
		re = 0;
		we = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

