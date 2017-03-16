`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:43 08/06/2016 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(clk,in1,in2,out1,flag,opcode);

	input clk;
	input [7:0]in1;
	input [9:0]in2;
	input [2:0]opcode;
	output [9:0]out1;
	reg [9:0]out1;
	output flag;
	reg flag;

	always @(posedge clk)
	begin
		case (opcode)
			3'b001 : out1 <= in2 + in1;
			3'b010 : out1 <= in2 - in1;
			3'b011 : out1 <= in2 + 1'b1;
			3'b100 : out1 <= in2 >> 2;
		endcase
		if(out1)
			flag <= 1'b1;
		else
			flag <= 1'b0;
	end
	
endmodule