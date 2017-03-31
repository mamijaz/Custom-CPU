`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:18 08/07/2016 
// Design Name: 
// Module Name:    IR 
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
module IR(in1,out1,clk,re);
	input clk,re;
	input [3:0]in1;
	output [3:0]out1;
	reg [3:0]out1;
	
	always @(clk)
    begin
		if (re)
			out1 <= in1;
	end
	
endmodule