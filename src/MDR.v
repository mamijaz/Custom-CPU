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
module MDR(in1,out1,out2,out3,out4,clk,re,shift);
	input clk,re,shift;
	input [7:0]in1;
	output [14:0]out1;
	output [7:0]out2;
	output [14:0]out3;
	output [3:0]out4;
	reg [14:0]store;
	wire [14:0]out1;
	wire [7:0]out2;
	wire [14:0]out3;
	wire [3:0]out4;
	
	always @(posedge clk)
    begin
		if (re)
			store[7:0] <= in1;
		else if (shift)
			store <= store<<8;
	end
	
	assign out1 = store;
    assign out2 = store[7:0];
    assign out3 = store;
    assign out4 = store[3:0];
    
endmodule