`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:14 12/07/2021 
// Design Name: 
// Module Name:    DECSTAGE 
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
`ifndef MUX2TO1BITS5_V
  `include "mux2to1bits5.v"
  `define MUX2TO1BITS5_V
`endif
`ifndef REGISTERFILE_V
  `include "RegisterFile.v"
  `define REGISTERFILE_V
`endif
`ifndef SIGNEXTENSION32BIT_V
  `include "SignExtension32bit.v"
  `define SIGNEXTENSION32BIT_V
`endif
`ifndef ZEROFILL32BIT_V
  `include "ZeroFill32bit.v"
  `define ZEROFILL32BIT_V
`endif
module DECSTAGE(
    input [31:0] Instr,
    input RF_WrEn,//
    input [31:0] ALU_out,
    input [31:0] MEM_out,
    input RF_WrData_sel,
    input RF_B_sel,
    input Clk,
    output [31:0] Immed,
    output [31:0] RF_A,
    output [31:0] RF_B
    );
	 //intetnal variables	 
	wire[4:0] ReadRegister1;
	wire[4:0] WriteRegister;
	wire[4:0] Instrpart;
	wire[5:0] Opcode;
	wire[31:0] SignExtendOut;
	wire[31:0] ZeroFillOut;
	wire[15:0] Immedpart;
	//register to value inside always
	reg[31:0] ImmedRes;
	assign ReadRegister1 = Instr[25:21];
	assign WriteRegister = Instr[20:16];
	assign Instrpart= Instr[15:11];
	assign Opcode = Instr[31:26];
	assign Immedpart = Instr[15:0];
	//assignig ImmedRes to output Immed
	assign Immed  = ImmedRes;	
	 //one 5b'wire to assign the output of the mux for Readr2
	wire[4:0]  ReadRegister2;
	//msaiosd
	//one 32b'wire to assign output of mux for write_data
	wire[31:0] WriteData;
	mux2to1bits5 mux1(Instrpart,WriteRegister,RF_B_sel,ReadRegister2);
	bits32mux2to1 mux2(MEM_out,ALU_out,RF_WrData_sel,WriteData);
	//now create instance of reg file using the previous module
	RegisterFile RF(ReadRegister1,ReadRegister2,WriteRegister,
	RF_A,RF_B,WriteData,RF_WrEn,Clk);
	//Immed ouput 
	//
	//at first create instances for the two modules
	SignExtension32bit sigex(Immedpart,SignExtendOut);
	ZeroFill32bit zerofill(Immedpart,ZeroFillOut);
	always @(*)begin 
		case(Opcode) 
		//cases of using sign extend
		6'b111000,6'b111111,6'b000000,6'b000001,6'b000011,6'b000111,6'b001111,6'b011111,6'b110000 : begin
			ImmedRes <= SignExtendOut;
		end
		//case of using zero fill
		6'b110010,6'b110011,6'b111001: begin 
			ImmedRes <= ZeroFillOut;
		end
		//else zeros
		default :
			ImmedRes <= 32'b0;
		endcase
	end
endmodule
