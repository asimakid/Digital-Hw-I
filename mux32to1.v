`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:25 12/04/2021 
// Design Name: 
// Module Name:    mux32to1 
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

`ifndef BITS32MUX4TO1_V
  `include "bits32mux4to1.v"
  `define BITS32MUX4TO1_V
`endif
`ifndef BITS32MUX2TO1_V
  `include "bits32mux2to1.v"
  `define BITS32MUX2TO1_V
`endif
module mux32to1(
    input [4:0] Select,
    input [31:0] Input0,
	 input [31:0] Input1,
	 input [31:0] Input2,
	 input [31:0] Input3,
	 input [31:0] Input4,
	 input [31:0] Input5,
	 input [31:0] Input6,
	 input [31:0] Input7,
	 input [31:0] Input8,
	 input [31:0] Input9,
	 input [31:0] Input10,
	 input [31:0] Input11,
	 input [31:0] Input12,
	 input [31:0] Input13,
	 input [31:0] Input14,
	 input [31:0] Input15,
	 input [31:0] Input16,
	 input [31:0] Input17,
	 input [31:0] Input18,
	 input [31:0] Input19,
	 input [31:0] Input20,
	 input [31:0] Input21,
	 input [31:0] Input22,
	 input [31:0] Input23,
	 input [31:0] Input24,
	 input [31:0] Input25,
	 input [31:0] Input26,
	 input [31:0] Input27,
	 input [31:0] Input28,
	 input [31:0] Input29,
	 input [31:0] Input30,
	 input [31:0] Input31,	 
    output [31:0] Out
    );
	 wire [31:0] w[9:0];
	// for 32 to 1 will need 10 muxes 4x1 an 1 mux 2x1
	bits32mux4to1 mux0(Input0,Input1,Input2,Input3,Select[1:0],w[0]);
	bits32mux4to1 mux1(Input4,Input5,Input6,Input7,Select[1:0],w[1]);
	bits32mux4to1 mux2(Input8,Input9,Input10,Input11,Select[1:0],w[2]);
	bits32mux4to1 mux3(Input12,Input13,Input14,Input15,Select[1:0],w[3]);
	bits32mux4to1 mux4(Input16,Input17,Input18,Input19,Select[1:0],w[4]);
	bits32mux4to1 mux5(Input20,Input21,Input22,Input23,Select[1:0],w[5]);
	bits32mux4to1 mux6(Input24,Input25,Input26,Input27,Select[1:0],w[6]);
	bits32mux4to1 mux7(Input28,Input29,Input30,Input31,Select[1:0],w[7]);
	bits32mux4to1 mux8(w[0],w[1],w[2],w[3],Select[3:2],w[8]);
	bits32mux4to1 mux9(w[4],w[5],w[6],w[7],Select[3:2],w[9]);
	bits32mux2to1 mux10(w[8],w[9],Select[4],Out);

endmodule
