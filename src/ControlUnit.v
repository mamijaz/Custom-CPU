`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:53:05 08/08/2016 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(opcode,flag,signals,clk);
	input [3:0]opcode;
	input flag,clk;
	output [16:0]signals;
	reg [16:0]signals;
	reg [4:0]state;
	
	parameter READ 	= 4'b0001;
	parameter WRITE = 4'b0010;
	parameter JPNZ 	= 4'b0011;
	parameter CLAC 	= 4'b0100;
	parameter ADD 	= 4'b0101;
	parameter SUB 	= 4'b0110;
	parameter SHIFT	= 4'b0111;
	parameter INC 	= 4'b1000;


	
	initial
	begin
		state=5'b000001;
		signals=17'b0;
	end
	
	always @(posedge clk)
		begin
		case (state)
			1:begin
				signals <= 17'b00100100000000000;
				state=2;
			end
			2:begin
				signals <= 17'b10000011001000000;
				state=3;
			end
			3:begin
				signals <= 17'b00100100100010000;
				if(opcode==READ || opcode==WRITE)
					state=4;
				else if(opcode==CLAC)
					state=10;
				else if(opcode==ADD)
					state=11;
				else if(opcode==SUB)
					state=12;
				else if(opcode==SHIFT)
					state=13;
				else if(opcode==INC)
					state=14;
				else if(opcode==JPNZ)
					if(flag)
						state=4;
					else
						state=16;
			end
			4:begin
				signals <= 17'b10000011001000000;
				state=5;
			end
			5:begin
				signals <= 17'b00100100010000000;
				state=6;
			end
			6:begin
				signals <= 17'b10000011001000000;
				if(opcode==READ || opcode==WRITE)
					state=7;
				else if(opcode==JPNZ)
					state=15;
			end
			7:begin
				signals <= 17'b00000100100000000;
				if(opcode==READ)
					state=8;
				else if(opcode==WRITE)
					state=9;
			end
			8:begin
				signals <= 17'b00000011001000000;
				state=1;
			end
			9:begin
				signals <= 17'b00001010000100000;
				state=1;
			end
			10:begin
				signals <= 17'b00010000000001000;
				state=1;
			end
			11:begin
				signals <= 17'b00010000000000001;
				state=1;
			end
			12:begin
				signals <= 17'b00010000000000010;
				state=1;
			end
			13:begin
				signals <= 17'b00010000000000100;
				state=1;
			end
			14:begin
				signals <= 17'b00010000000000011;
				state=1;
			end
			15:begin
				signals <= 17'b01000000100000000;
				state=1;
			end
			16:begin
				signals <= 17'b10000000000000000;
				state=17;
			end
			17:begin
				signals <= 17'b10000000000000000;
				state=1;
			end
		endcase
	end
endmodule
