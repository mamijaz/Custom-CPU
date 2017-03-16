`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:53:45 08/06/2016 
// Design Name: 
// Module Name:    MDR 
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
module MDR(in1,out1,out2,out3,out4,clk,re,we,shift);
	input clk,re,we,shift;
	input [7:0]in1;
	output [14:0]out1;
	output [7:0]out2;
	output [14:0]out3;
	output [3:0]out4;
	reg [14:0]store;
	reg [14:0]out1;
	reg [7:0]out2;
	reg [14:0]out3;
	reg [3:0]out4;
	
	always @(posedge clk)
   begin
		if (re)
			store[7:0] <= in1;
		else if (shift)
			store <= store<<8;
		else if(we)
			out1 <= store;
			out2 <= store[7:0];
			out3 <= store;
			out4 <= store[3:0];
	end
endmodule