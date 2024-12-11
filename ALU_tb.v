`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:35:09 12/03/2021
// Design Name:   ALU
// Module Name:   C:/Users/userPc/digitalSytstemsProject/ALU_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "Alu.v"
module ALU_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] Op;

	// Outputs
	wire [31:0] Out;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.Op(Op), 
		.Out(Out), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Op = 0;

		// Wait 100 ns for global reset to finish
		#10;
		A = 32'h9876;
		B = 32'h1234;        
		// Add stimulus here
		#10;
		Op = 4'b0000;
		#10;
		Op = 4'b0001;
		#10;
		Op = 4'b0011;
		#10;
		Op = 4'b0100;
		#10;
		Op = 4'b1000;
		#10;
		Op = 4'b1010;
		#10;
		Op = 4'b1001;
		#10;
		Op = 4'b1100;
		#10;
		Op = 4'b1101;













	end
      
endmodule

