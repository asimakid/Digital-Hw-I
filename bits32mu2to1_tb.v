`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:31:12 12/14/2021
// Design Name:   bits32mux2to1
// Module Name:   C:/Users/userPc/digitalSytstemsProject/bits32mu2to1_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bits32mux2to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// //
////////////////////////////////////////////////////////////////////////////////
`include "bits32mux2to1.v"
module bits32mu2to1_tb;

	// Inputs
	reg [31:0] Input0;
	reg [31:0] Input1;
	reg Select;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	bits32mux2to1 bits32mu2to1_tb(
		.Input0(Input0), 
		.Input1(Input1), 
		.Select(Select), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		Input0 = 0;
		Input1 = 0;
		Select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here//
		Input0 = 0;
		Input1 = 1;
		Select = 1; 
		#10
		Input0 = 0;
		Input1 = 1;
		Select = 0;

	end
      
endmodule

