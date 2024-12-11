`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:02:53 12/18/2021
// Design Name:   SignExtension32bit
// Module Name:   C:/Users/userPc/digitalSytstemsProject/Signextension_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtension32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "SignExtension32bit.v"
module Signextension_tb;

	// Inputs
	reg [15:0] In;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	SignExtension32bit uut (
		.In(In), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		In = 0;

		// Wait 100 ns for global reset to finish
		#10;
		In = 16'habcd;
		#10;
		In = 16'h0123;
        
		// Add stimulus here

	end
      
endmodule

