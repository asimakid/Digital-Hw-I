`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:58:43 12/15/2021
// Design Name:   ALUSTAGE
// Module Name:   C:/Users/userPc/digitalSytstemsProject/DECSTGE_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DECSTGE_tb;

	// Inputs
	reg [31:0] RF_A;
	reg [31:0] RF_B;
	reg [31:0] Immed;
	reg ALU_Bin_SEL;
	reg [3:0] ALU_func;

	// Outputs
	wire [31:0] ALU_out;
	wire Zero_out;

	// Instantiate the Unit Under Test (UUT)
	ALUSTAGE uut (
		.RF_A(RF_A), 
		.RF_B(RF_B), 
		.Immed(Immed), 
		.ALU_Bin_SEL(ALU_Bin_SEL), 
		.ALU_func(ALU_func), 
		.ALU_out(ALU_out), 
		.Zero_out(Zero_out)
	);

	initial begin
		// Initialize Inputs
		RF_A = 0;
		RF_B = 0;
		Immed = 0;
		ALU_Bin_SEL = 0;
		ALU_func = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

