`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:09:50 08/09/2016
// Design Name:   ALU
// Module Name:   D:/Custom_CPU/ALUtest.v
// Project Name:  Custom_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUtest;

	// Inputs
	reg clk;
	reg [7:0] in1;
	reg [15:0] in2;
	reg [2:0] opcode;

	// Outputs
	wire [15:0] out1;
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.clk(clk), 
		.in1(in1), 
		.in2(in2), 
		.out1(out1), 
		.flag(flag), 
		.opcode(opcode)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		in1 = 0;
		in2 = 0;
		opcode = 0;

		// Wait 100 ns for global reset to finish
		#100
		
		clk=1;
		in1=1;
		in2=5;
		opcode=1;
		
		
		#100
		clk=0;
		
		#100
		clk=1;
		opcode=2;
		
		
		#100
		clk=0;
		
		#100
		clk=1;
		opcode=3;
		
		#100
		clk=0;
		
		#100
		clk=1;
		opcode=4;
		
		#100
		clk=0;
		
		#100
		clk=1;
		opcode=0;
        
		// Add stimulus here

	end
      
endmodule

