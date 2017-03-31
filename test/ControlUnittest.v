`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:58:02 08/09/2016
// Design Name:   ControlUnit
// Module Name:   D:/Custom_CPU/ControlUnittest.v
// Project Name:  Custom_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControlUnittest;

	// Inputs
	reg [3:0] opcode;
	reg flag;
	reg clk;

	// Outputs
	wire [11:0] signals;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.opcode(opcode), 
		.flag(flag), 
		.signals(signals), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		flag = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100
		opcode=8;
		
	
		repeat (300)
		begin
		#10 clk = ~clk; //alternate clock signal
		end
        
		// Add stimulus here

	end
      
endmodule

