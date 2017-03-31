`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:41:05 08/07/2016 
// Design Name: 
// Module Name:    MAR 
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
module MAR(in1,in2,out1,clk,re1,re2);
	input clk,re1,re2;
	input [14:0]in1;
	input [14:0]in2;
	output [14:0]out1;
	reg [14:0]out1;
	
	always @(posedge clk)
    begin
		if (re1)
			out1 <= in1; 
		if (re2)
			out1 <= in2;
	end
	
endmodule