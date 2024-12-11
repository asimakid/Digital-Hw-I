`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:29 12/14/2021 
// Design Name: 
// Module Name:    IFSTAGE 
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

`ifndef REGISTER2_V
  `include "register2.v"
  `define REGISTER2_V
`endif
`ifndef BITS32MUX2TO1_V
  `include "bits32mux2to1.v"
  `define BITS32MUX2TO1_V
`endif
`ifndef IMEM_V
  `include "IMEM.v"
  `define IMEM_V
`endif

module IFSTAGE(
	 input [31:0] PC_Immed,
	 input PC_sel,
	 input PC_LdEn,
	 input Reset,
	 input Clk,
	 output [31:0] Instr
    );
	 
	 //internal wires
	 wire [31:0] PcPlus4; //PC plus 4
	 wire [31:0] PcPlus4PlusImmed; //PC plus immediate plus 4
	wire [31:0] Mux_out; //selection of mux
	 wire [31:0] PC_out;
	 wire [9:0] address;	//rom address
	// wire [31:0] memout; //output of rom
	 
	 //assigning address
	 //assign address = PC_out[11:2];
	 //assign output
	 //assign memout = Instr;	
	//assign pl4 and immpl4;
	 assign PcPlus4 = PC_out + 32'h00000004;
	 assign PcPlus4PlusImmed = PC_out + 4 * PC_Immed + 32'h00000004;
	 //creating parts
	 register2 PC(Clk, Mux_out, PC_LdEn, Reset, PC_out);
	 bits32mux2to1 mux(PcPlus4 , PcPlus4PlusImmed, PC_sel, Mux_out);	
    IMEM memory(Clk, PC_out[11:2], Instr);
	

endmodule
