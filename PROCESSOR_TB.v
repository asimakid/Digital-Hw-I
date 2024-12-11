`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:34 01/12/2022
// Design Name:   PROCESSOR
// Module Name:   C:/Users/userPc/digitalSytstemsProject/PROCESSOR_TB.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSOR_TB;

	// Inputs
	reg Reset;
	reg CLK;
	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.Reset(Reset),
		.CLK(CLK)
	);
	initial begin
		Reset = 0;
		#5
		CLK = 0;
		forever
         #10 CLK = ~CLK;
	end
      
endmodule

