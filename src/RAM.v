`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:23 08/08/2016 
// Design Name: 
// Module Name:    RAM 
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
module RAM(address,datain,dataout,clk,we,re);
	 input we,re,clk;
	 input [14:0]address;
	 input [7:0]datain;
	 output [7:0]dataout;
	 reg [7:0] memory [32767:0];
	 reg [7:0]dataout;
	 
	 
	 initial
	 begin
	 memory[0]=8'b00000001;
	 end
	 
	 always @(posedge clk)
	 begin
	 if(re)
		dataout <= memory[address];
	 if(we)
		memory[address] <= datain;
	 end
 
endmodule




