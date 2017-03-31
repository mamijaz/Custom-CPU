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
module Processor(clk,ACOUT,RAMOUTBUS,ADDBUS,CONTROL);
	input clk;
	input [7:0]RAMOUTBUS;
	output [9:0]ACOUT;
	output [14:0]ADDBUS;
	output [13:0]CONTROL;
	wire FLAGIN,FLAGOUT;
	wire [2:0]ALUI;
	wire [14:0]MDRMAR;
	wire [7:0]MDRR;
	wire [7:0]RALU;
	wire [14:0]MDRPC;
	wire [3:0]MDRIR;
	wire [3:0]IRBUS;
	wire [14:0]PCMAR;
	wire [9:0]ALUOUT;
	wire [13:0]CONTROL;

	ControlUnit controlunit(IRBUS,FLAGOUT,CONTROL,clk);
	ALU alu(clk,RALU,ACOUT,ALUOUT,FLAGIN,CONTROL[2:0]);
	AC ac(ALUOUT,ACOUT,clk,CONTROL[11],CONTROL[3]);
	Z z(FLAGIN,FLAGOUT,clk,CONTROL[3]);
	R r(MDRR,RALU,clk,CONTROL[6]);
	PC pc(MDRPC,PCMAR,clk,CONTROL[12],CONTROL[13]);
	IR ir(MDRIR,IRBUS,clk,CONTROL[4]);
	MAR mar(MDRMAR,PCMAR,ADDBUS,clk,CONTROL[10],CONTROL[9]);
	MDR mdr(RAMOUTBUS,MDRMAR,MDRR,MDRPC,MDRIR,clk,CONTROL[8],CONTROL[7]);

endmodule
