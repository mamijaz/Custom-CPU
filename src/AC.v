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
module AC(in1,out1,clk,re,we,clear);
	input clk,re,we,clear;
	input [9:0]in1;
	output [9:0]out1;
	reg [9:0]store;
	reg [9:0]out1;
	
	always @(posedge clk)
   begin
		if (re)
			store <= in1;
		if(we)
			out1 <= store;
		if(clear)
			out1 <= 10'b0;
	end
endmodule
