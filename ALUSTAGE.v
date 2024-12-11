`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:53 12/14/2021 
// Design Name: 
// Module Name:    ALUSTAGE 
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
`ifndef ALU_V
  `include "Alu.v"
  `define ALU_V
`endif
//what about zero output of the alu
module ALUSTAGE(
    input [31:0] RF_A,
    input [31:0] RF_B,
    input [31:0] Immed,
    input  ALU_Bin_SEL,
    input [3:0] ALU_func,
    output [31:0] ALU_out,
	 output Zero_out
    );//
	 //ALU_Bin_SEL = 0 MEANS RF_B  = 1 MEANS IMMED
	 //creating a wire to put the output of the mux
	 wire [31:0] muxout;
	 //creating the instance of the mux 
	 bits32mux2to1 mux1(RF_B,Immed,ALU_Bin_SEL,muxout);
	 //creating the alu
	 ALU alu1(RF_A,muxout,ALU_func,ALU_out,Zero_out);
	 


endmodule
