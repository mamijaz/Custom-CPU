`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2017 08:51:06 AM
// Design Name: 
// Module Name: R
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module R(in1,out1,clk,re);
	input clk,re;
	input [7:0]in1;
	output [7:0]out1;
	reg [7:0]out1;
	
	always @(clk)
    begin
		if (re)
			out1 <= in1;
	end
	
endmodule
