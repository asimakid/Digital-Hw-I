`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:42 12/20/2021 
// Design Name: 
// Module Name:    MEMSTAGE 
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
`ifndef BITS32MUX2TO1_V
  `include "bits32mux2to1.v"
  `define BITS32MUX2TO1_V
`endif
//added an ipnut to control byte and full word instructions
module MEMSTAGE(
		input clk,
		input MEM_ByteOp,//zero means full word transfer
		input MEM_WrEn,
		input [31:0] ALU_MEM_Addr,
		input [31:0] MEM_DataIn,
		output [31:0] MEM_DataOut
    );
	 // wires
	wire[9:0] AddressBinary ;
	wire[31:0] FullDataIn;
	wire[31:0] FullDataOut;
	wire[31:0] ByteDataIn;
	wire[31:0] ByteDataOut;
	//output of the muxes will be the whole word or the byte
	wire[31:0] MEM_write;
	// no need to create wire[31:0] MEM_read; we will connect straitght to the output
	assign AddressBinary = ALU_MEM_Addr [11:2];
	integer AddrDecimal;
	reg [31:0] Dout;
	always @(AddressBinary) begin
		AddrDecimal = AddressBinary; //the wire assigned to an integer
	end
	//first eight bits
	assign ByteDataIn= {24'b0,MEM_DataIn[7:0]};
	assign ByteDataOut = {24'b0,Dout[7:0]};
	assign FullDataOut = Dout;
	assign FullDataIn = MEM_DataIn;
	// mux for input data
	bits32mux2to1 datainmux(FullDataIn,ByteDataIn,MEM_ByteOp,MEM_write);
	bits32mux2to1 dataoutmux(FullDataOut,ByteDataOut,MEM_ByteOp,MEM_DataOut);
	//MEM (code from pdf)
	reg [31:0] RAM [1023:0];
	always @(posedge clk)
	begin//
		if(MEM_WrEn ==1'b1)begin
			$display("writed to %d the info %b",AddrDecimal,MEM_write);
			RAM[AddrDecimal] = MEM_write;
		end
		//else can or cannot be uses
		Dout <= RAM[AddrDecimal];
	end

endmodule
