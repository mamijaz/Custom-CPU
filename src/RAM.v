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
	 memory[0]     =   8'b00000100;    //CLAC
	 memory[1]     =   8'b00000001;    //READ
	 memory[2]     =   8'b00000000;    //#A
	 memory[3]     =   8'b00010001;
	 memory[4]     =   8'b00000101;    //ADD
	 memory[5]     =   8'b00000001;    //READ
	 memory[6]     =   8'b00000000;    //#B
	 memory[7]     =   8'b00010010;    
	 memory[8]     =   8'b00000101;    //ADD
	 memory[9]     =   8'b00000110;    //SUB
	 memory[10]    =   8'b00001000;    //INC
	 memory[11]    =   8'b00000111;    //SHIFT
	 
	 memory[17]    =   8'b00001000;    //A
	 memory[18]    =   8'b00000001;    //B
	 end
	 
	 always @(posedge clk)
	 begin
	 if(we)
		memory[address] <= datain;
	 end
	 
     assign dataout = memory[address];
    
endmodule




