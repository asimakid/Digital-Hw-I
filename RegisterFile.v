`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:33 12/04/2021 
// Design Name: 
// Module Name:    RegisterFile 
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
`ifndef MUX32TO1_V
  `include "mux32to1.v"
  `define MUX32TO1_V
`endif
`ifndef REGISTER_V
  `include "Register.v"
  `define REGISTER_V
`endif
`ifndef DECODE5TO32_V
  `include "decode5to32.v"
  `define DECODE5TO32_V
`endif
module RegisterFile(
    input [4:0] Adr1,
    input [4:0] Adr2,
    input [4:0] Awr,
    output [31:0] Dout1,
    output [31:0] Dout2,
    input [31:0] Din,
    input WrEn,
    input Clk
    );	
	 //creating the registers matrix using the previous module;
	wire[31:0] dataout[0:31];
	wire [31:0] decoderout;
	wire [31:0] andout;
	decode5to32 Decoder(Awr,decoderout);
	//decoderout at position 0 will always be zero since we dont want//
	generate
		genvar i;
			for (i=0;i<32;i=i+1) begin : loop				
				if(i==0)begin
					assign andout[i] = 1'b0;
					end
				else begin
					assign andout[i] = WrEn & decoderout[i];					
					end	
				   (* keep_hierarchy = "yes" *)Register registers(Clk,Din,andout[i],dataout[i]);					
			end
	endgenerate////
	mux32to1 mux1(Adr1,dataout[0],dataout[1],dataout[2],
	dataout[3],dataout[4],dataout[5],dataout[6],dataout[7],dataout[8],dataout[9],dataout[10],dataout[11],dataout[12],dataout[13],
	dataout[14],dataout[15],dataout[16],dataout[17],dataout[18],dataout[19],dataout[20],dataout[21],dataout[22],dataout[23],dataout[24],
	dataout[25],dataout[26],dataout[27],dataout[28],dataout[29],dataout[30],dataout[31],Dout1);
	
	mux32to1 mux2(Adr2,dataout[0],dataout[1],dataout[2],
	dataout[3],dataout[4],dataout[5],dataout[6],dataout[7],dataout[8],dataout[9],dataout[10],dataout[11],dataout[12],dataout[13],
	dataout[14],dataout[15],dataout[16],dataout[17],dataout[18],dataout[19],dataout[20],dataout[21],dataout[22],dataout[23],dataout[24],
	dataout[25],dataout[26],dataout[27],dataout[28],dataout[29],dataout[30],dataout[31],Dout2);
	
endmodule
