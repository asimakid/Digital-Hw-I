`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:37:15 12/15/2021
// Design Name:   Register
// Module Name:   C:/Users/userPc/digitalSytstemsProject/Register_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "Register.v"
module Register_tb;

	// Inputs
	reg CLK;
	reg [31:0] Data;
	reg WE;

	// Outputs
	wire [31:0] Dout;

	// Instantiate the Unit Under Test (UUT)
	Register uut (
		.CLK(CLK), 
		.Data(Data), 
		.WE(WE), 
		.Dout(Dout)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		Data = 0;
		WE = 0;

		// Wait 100 ns for global reset to finish
		#10;
		WE = 1;
		Data = 32'h5432;
		#5;
		CLK = 1;
		#1;
		CLK = 0;
		#2;
		Data = 32'h1234;
		#5;
		CLK = 1;
		#1;
		CLK = 0;
		#10;
		Data = 32'h2102;
		WE = 0;
		#10;
		CLK = 1; 
		
		
        
		// Add stimulus here

	end
      
endmodule

