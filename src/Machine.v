`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2017 08:03:19 PM
// Design Name: 
// Module Name: Machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Machine(clk,ACOUT);
    input clk;
	output [7:0]ACOUT;
	wire [14:0]ADDBUS;
	wire [5:6]CONTROL;
	wire [7:0]RAMOUTBUS;
	
    Processor processor(clk,ACOUT,RAMOUTBUS,ADDBUS,CONTROL);
    RAM ram(ADDBUS,ACOUT[7:0],RAMOUTBUS,clk,CONTROL[5],CONTROL[6]);
    
endmodule
