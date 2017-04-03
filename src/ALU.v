`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:43 08/06/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(clk,in1,in2,out1,flag,opcode);

	input clk;
	input [7:0]in1;
	input [15:0]in2;
	input [2:0]opcode;
	output [15:0]out1;
	reg [15:0]out1;
	output flag;
	reg flag;
	
	parameter ADD  	   = 3'b001;
    parameter SUB      = 3'b010;
    parameter INC      = 3'b011;
    parameter R_SHIFT  = 3'b100;
    parameter L_SHIFT  = 3'b101;

	always @(negedge clk)
	begin
		case (opcode)
			ADD : begin
			     out1 <= in2 + in1;
			     if((in2 + in1) >= 0)
                      flag <= 1'b0;
			end
			SUB : begin
			     out1 <= in2 - in1;
			     if((in2 - in1) == 0)
                      flag <= 1'b1;
                 else
                      flag <= 1'b0;
			end
			INC : begin
			     out1 <= in2 + 16'b0000000000000001;	
                 flag <= 1'b0;
			end
			R_SHIFT : begin
			     out1 <= in2 >> 1;
			     if((in2 >> 1) == 0)
                       flag <= 1'b1;
                 else
                       flag <= 1'b0;
			end
			L_SHIFT : begin
			     out1 <= in2 << 1;
			end
		endcase
	end
	
endmodule