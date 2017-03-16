`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:51:49 08/15/2016
// Design Name:   MDR
// Module Name:   D:/Custom_CPU/MDRtest.v
// Project Name:  Custom_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MDR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MDRtest;

	// Inputs
	reg [7:0] in1;
	reg clk;
	reg re;
	reg we;
	reg shift;

	// Outputs
	wire [14:0] out1;
	wire [7:0] out2;
	wire [14:0] out3;
	wire [3:0] out4;

	// Instantiate the Unit Under Test (UUT)
	MDR uut (
		.in1(in1), 
		.out1(out1), 
		.out2(out2), 
		.out3(out3), 
		.out4(out4), 
		.clk(clk), 
		.re(re), 
		.we(we), 
		.shift(shift)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		clk = 0;
		re = 0;
		we = 0;
		shift = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

