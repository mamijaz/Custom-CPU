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
module RAM(address,datain,dataout,clk,we);
	 input we,clk;
	 input [14:0]address;
	 input [7:0]datain;
	 output [7:0]dataout;
	 reg [7:0] memory [32767:0];
	 wire [7:0]dataout;
	 
	 
	 initial
	 begin
	 memory[0]     =   8'b00000100;
	 memory[1]     =   8'b00000001;
	 memory[2]     =   8'b00000000;
	 memory[3]     =   8'b00001001;
	 memory[4]     =   8'b00000101;
	 memory[5]     =   8'b00000001;
	 memory[6]     =   8'b00000000;
	 memory[7]     =   8'b00001010;
	 memory[8]     =   8'b00000101;
	 memory[9]     =   8'b00000001;
	 memory[10]    =   8'b00000001;
	 end
	 
	 always @(posedge clk)
	 begin
	 if(we)
		memory[address] <= datain;
	 end
	 
     assign dataout = memory[address];
    
endmodule




