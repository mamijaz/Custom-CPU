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
	output [13:0]signals;
	reg [13:0]signals;
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
		state <=5'b00001;
		signals <= 14'b00001000000000;
	end
	
	always @(posedge clk)
		begin
		case (state)
			1:begin
				signals <= 14'b10000100000000;
				state <=2;
			end
			2:begin
				signals <= 14'b00001000010000;
				state <=3;
			end
			3:begin
				if(opcode==READ || opcode==WRITE)
				begin
				    signals <= 14'b10000100000000;
					state <=4;
				end
				else if(opcode==CLAC)
				begin
				    signals <= 14'b00000000001000;
					state <=11;
				end
				else if(opcode==ADD)
				begin
				    signals <= 14'b00100000000001;
					state <=12;
				end
				else if(opcode==SUB)
				begin
				    signals <= 14'b00100000000010;
					state <=13;
				end
				else if(opcode==SHIFT)
				begin
				    signals <= 14'b00100000000100;
					state <=14;
				end
				else if(opcode==INC)
				begin
				    signals <= 14'b00100000000011;
					state <=15;
				end
				else if(opcode==JPNZ)
					if(flag)
					begin
					    signals <= 14'b10000100000000;
						state <=4;
					end
					else
					begin
					    signals <= 14'b10000000000000;
						state <=17;
					end
			end
			4:begin
			    signals <= 14'b00001010000000;
				state <=5;
			end
			5:begin
			    signals <= 14'b10000100000000;
				state <=6;
			end
			6:begin
				if(opcode==READ || opcode==WRITE)
				begin
				    signals <= 14'b00010000000000;
					state <=7;
				end
				else if(opcode==JPNZ)
				begin
				    signals <= 14'b01000000000000;
					state <=16;
				end
			end
			7:begin
				if(opcode==READ)
				begin
				    signals <= 14'b00000100000000;
					state <=8;
				end
				else if(opcode==WRITE)
				begin
				    signals <= 14'b00000000100000;
					state <=10;
				end
			end
			8:begin
				signals <= 14'b00000001000000;
				state <=9;
			end
			9:begin
                signals <= 14'b00001000000000;
                state <=1;
            end
			10:begin
				signals <= 14'b00001000000000;
				state <=1;
			end
			11:begin
				signals <= 14'b00001000000000;
				state <=1;
			end
			12:begin
				signals <= 14'b00001000000000;
				state <=1;
			end
			13:begin
				signals <= 14'b00001000000000;
				state <=1;
			end
			14:begin
				signals <= 14'b00001000000000;
				state <=1;
			end
			15:begin
				signals <= 14'b00001000000000;
				state <=1;
			end
			16:begin
			    signals <= 14'b00001000000000;
				state <=1;
			end
			17:begin
				signals <= 14'b10000000000000;
				state <=17;
			end
			18:begin
				signals <= 14'b00001000000000;
				state <=1;
			end
		endcase
	end
endmodule
