`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:44:08 12/21/2021 
// Design Name: 
// Module Name:    PROCESSOR 
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
/////////////////////////////////////////////////////////////////////////////////
`ifndef ALUSTAGE_V
  `include "ALUSTAGE.v"
  `define ALUSTAGE_V
`endif
`ifndef DECSTAGE_V
  `include "DECSTAGE.v"
  `define DECSTAGE_V
`endif
`ifndef IFSTAGE_V
  `include "IFSTAGE.v"
  `define IFSTAGE_V
`endif
`ifndef MEMSTAGE_V
  `include "MEMSTAGE.v"
  `define MEMSTAGE_V
`endif
`ifndef CONTROL_V
  `include "CONTROL.v"
  `define CONTROL_V
`endif
`ifndef CLOCK_V
  `include "CLOCK.v"
  `define CLOCK_V
`endif
////
//create clock//
module PROCESSOR(
  	 input  Reset,
	 input CLK
    );
	 //creating the 4 stages and the controller
	 //declaring wires to connect the stages
	 //outputs of contol//
	 wire pc_sel,pc_lden,pc_reset,rf_b_sel,rf_wrdata_sel,rf_wren,alu_bin_sel,mem_wren,mem_byteop;
	 wire [3:0] alu_func;
	 // outputs of IFTAGE
    wire [31:0] instr;
	 //outputs of Decstage
	 wire [31:0] immed,rf_a,rf_b;
	 //outputs of ALUSTAGE
	 wire [31:0] alu_out;
	 wire  zero_out;
	 //outputs of MEMSTAGE
	 wire [31:0] mem_dataout;
	 assign reset =Reset;
	 //instanciating the modules	 
	 CONTROL control(instr,zero_out,CLK,reset,pc_sel,pc_lden,pc_reset,rf_b_sel,rf_wrdata_sel,rf_wren,alu_bin_sel,alu_func,mem_wren,mem_byteop);
	 IFSTAGE ifstage(immed,pc_sel,pc_lden,pc_reset,CLK,instr);
	 DECSTAGE decstage(instr,rf_wren,alu_out,mem_dataout,rf_wrdata_sel,rf_b_sel,CLK,immed,rf_a,rf_b);
	 ALUSTAGE alustage(rf_a,rf_b,immed,alu_bin_sel,alu_func,alu_out,zero_out);
	 MEMSTAGE memstage(CLK,mem_byteop,mem_wren,alu_out,rf_b,mem_dataout);
endmodule
