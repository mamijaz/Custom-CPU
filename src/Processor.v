`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:13 08/06/2016 
// Design Name: 
// Module Name:    Processor 
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
module Processor(clk);
	input clk;
	wire FLAGIN,FLAGOUT;
	wire [2:0]ALUI;
	wire [9:0] ACOUT;
	wire [14:0] MDRMAR;
	wire [7:0] MDRALU;
	wire [14:0] MDRPC;
	wire [3:0] MDRIR;
	wire [3:0] IRBUS;
	wire [14:0] PCMAR;
	wire [9:0] ALUOUT;
	wire [14:0] ADDBUS;
	wire [7:0] RAMOUTBUS;
	wire [16:0] CONTROL;

	
	ControlUnit controlunit(IRBUS,FLAGOUT,CONTROL,clk);
	ALU alu(clk,MDRALU,ACOUT,ALUOUT,FLAGIN,CONTROL[2:0]);
	AC ac(ALUOUT,ACOUT,clk,CONTROL[13],CONTROL[12],CONTROL[3]);
	Z z(FLAGIN,FLAGOUT,clk,CONTROL[3]);
	PC pc(MDRPC,PCMAR,clk,CONTROL[15],CONTROL[14],CONTROL[16]);
	IR ir(MDRIR,IRBUS,clk,CONTROL[4]);
	MAR mar(MDRMAR,PCMAR,ADDBUS,clk,CONTROL[11],CONTROL[10]);
	MDR mdr(RAMOUTBUS,MDRMAR,MDRALU,MDRPC,MDRIR,clk,CONTROL[9],CONTROL[8],CONTROL[7]);
	RAM ram(ADDBUS,ACOUT[7:0],RAMOUTBUS,clk,CONTROL[5],CONTROL[6]);

endmodule
