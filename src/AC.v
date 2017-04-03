`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:06 08/08/2016 
// Design Name: 
// Module Name:    AC 
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
module AC(in1,out1,clk,re,clear);
	input clk,re,clear;
	input [15:0]in1;
	output [15:0]out1;
	reg [15:0]out1;
	
	always @(posedge clk)
    begin
		if (re)
			out1 <= in1;
		if(clear)
			out1 <= 16'b0000000000000000;
	end
	
endmodule
