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
	
	parameter READ 	   = 4'b0001;
	parameter WRITE    = 4'b0010;
	parameter JPNZ 	   = 4'b0011;
	parameter CLAC 	   = 4'b0100;
	parameter ADD 	   = 4'b0101;
	parameter SUB 	   = 4'b0110;
	parameter R_SHIFT  = 4'b0111;
	parameter L_SHIFT  = 4'b1000;
	parameter INC 	   = 4'b1001;
	
	parameter FETCH1 	= 5'b00001;
    parameter FETCH2    = 5'b00010;
    parameter FETCH3    = 5'b00011;
    parameter MEM1      = 5'b00100;
    parameter MEM2      = 5'b00101;
    parameter MEM3      = 5'b00110;
    parameter MEM4      = 5'b00111;
    parameter READ1     = 5'b01000;
    parameter READ2     = 5'b01001;
    parameter WRITE1    = 5'b01010;
    parameter CLAC1     = 5'b01011;
    parameter ADD1      = 5'b01100;
    parameter SUB1      = 5'b01101;
    parameter R_SHIFT1  = 5'b01110;
    parameter L_SHIFT1  = 5'b01111;
    parameter INC1      = 5'b10000;
    parameter JPNZ1     = 5'b10001;
    parameter JPNZ2     = 5'b10010;
    parameter JPNZ3     = 5'b10011;
    	
	initial
	begin
		state <=5'b00001;
		signals <= 14'b00001000000000;
	end
	
	always @(posedge clk)
		begin
		case (state)
			FETCH1 : begin
				signals <= 14'b10000100000000;
				state <= FETCH2;
			end
			FETCH2 : begin
				signals <= 14'b00001000010000;
				state <= FETCH3;
			end
			FETCH3 : begin
				if(opcode == READ || opcode == WRITE)
				begin
				    signals <= 14'b10000100000000;
					state <= MEM1;
				end
				else if(opcode == CLAC)
				begin
				    signals <= 14'b00000000001000;
					state <= CLAC1;
				end
				else if(opcode == ADD)
				begin
				    signals <= 14'b00100000000001;
					state <= ADD1;
				end
				else if(opcode == SUB)
				begin
				    signals <= 14'b00100000000010;
					state <= SUB1;
				end
				else if(opcode == R_SHIFT)
				begin
				    signals <= 14'b00100000000100;
					state <= R_SHIFT1;
				end
				else if(opcode == L_SHIFT)
                begin
                    signals <= 14'b00100000000101;
                    state <= L_SHIFT1;
                end
				else if(opcode == INC)
				begin
				    signals <= 14'b00100000000011;
					state <= INC1;
				end
				else if(opcode == JPNZ)
					if(~flag)
					begin
					    signals <= 14'b10000100000000;
						state <= MEM1;
					end
					else
					begin
					    signals <= 14'b10000000000000;
						state <= JPNZ2;
					end
			end
			MEM1 : begin
			    signals <= 14'b00001010000000;
				state <= MEM2;
			end
			MEM2 : begin
			    signals <= 14'b10000100000000;
				state <= MEM3;
			end
			MEM3 : begin
				if(opcode == READ || opcode == WRITE)
				begin
				    signals <= 14'b00010000000000;
					state <= MEM4;
				end
				else if(opcode == JPNZ)
				begin
				    signals <= 14'b01000000000000;
					state <= JPNZ1;
				end
			end
			MEM4 : begin
				if(opcode == READ)
				begin
				    signals <= 14'b00000100000000;
					state <= READ1;
				end
				else if(opcode == WRITE)
				begin
				    signals <= 14'b00000000100000;
					state <= CLAC1;
				end
			end
			READ1 : begin
				signals <= 14'b00000001000000;
				state <= READ2;
			end
			READ2 : begin
                signals <= 14'b00001000000000;
                state <= FETCH1;
            end
			WRITE1 : begin
				signals <= 14'b00001000000000;
				state <= FETCH1;
			end
			CLAC1 : begin
				signals <= 14'b00001000000000;
				state <= FETCH1;
			end
			ADD1 : begin
				signals <= 14'b00001000000000;
				state <= FETCH1;
			end
			SUB1 : begin
				signals <= 14'b00001000000000;
				state <= FETCH1;
			end
			R_SHIFT1 : begin
				signals <= 14'b00001000000000;
				state <= FETCH1;
			end
			L_SHIFT1 : begin
                signals <= 14'b00001000000000;
                state <= FETCH1;
            end
			INC1 : begin
				signals <= 14'b00001000000000;
				state <= FETCH1;
			end
			JPNZ1 : begin
			    signals <= 14'b00001000000000;
				state <= FETCH1;
			end
			JPNZ2 : begin
				signals <= 14'b10000000000000;
				state <= JPNZ3;
			end
			JPNZ3 : begin
				signals <= 14'b00001000000000;
				state <= FETCH1;
			end
		endcase
	end
endmodule
