`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:13 12/18/2021 
// Design Name: 
// Module Name:    IMEM 
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

module IMEM(
	input Clk,
	input [9:0] AddressBinary,
	output reg [31:0] DataOut
    );	 
	reg [31:0] ROM [1023:0];
	//reating the rom.data File
	initial	begin
		$readmemb("rom.data", ROM);
	end
	//integer address index  for ROM array must be integer type
	//conversion to decimal is done automatically in verilog
	integer AddrDecimal;
	always @(AddressBinary) begin
		AddrDecimal = AddressBinary; //the wire assigned to an integer
	end
	always @(posedge Clk)begin
		DataOut <= ROM[AddrDecimal];
	end
endmodule
