`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:14 08/07/2016 
// Design Name: 
// Module Name:    PC 
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
module PC(in1,out1,clk,re,inc);
	input clk,re,inc;
	input [14:0]in1;
	output [14:0]out1;
	reg [14:0]out1;
	
	initial
	begin
	out1 <= 15'b0;
	end
	
	always @(posedge clk)
    begin
		if (re)
			out1 <= in1;
		if (inc)
			out1 <= out1 + 1'b1;
	end
endmodule
