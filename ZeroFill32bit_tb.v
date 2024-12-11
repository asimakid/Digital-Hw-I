`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:06:33 12/18/2021
// Design Name:   ZeroFill32bit
// Module Name:   C:/Users/userPc/digitalSytstemsProject/ZeroFill32bit_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ZeroFill32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "ZeroFill32bit.v"
module ZeroFill32bit_tb;

	// Inputs
	reg [15:0] In;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	ZeroFill32bit uut (
		.In(In), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		In = 0;

		// Wait 100 ns for global reset to finish
		#10;
		In = 16'hdcab;
		#10;
		In = 16'h0123;
        
		// Add stimulus here

	end
      
endmodule

