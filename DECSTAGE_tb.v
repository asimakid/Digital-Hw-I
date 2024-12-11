`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:59:32 12/15/2021
// Design Name:   DECSTAGE
// Module Name:   C:/Users/userPc/digitalSytstemsProject/DECSTAGE_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DECSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DECSTAGE_tb;

	// Inputs
	reg [31:0] Instr;
	reg RF_WrEn;
	reg [31:0] ALU_out;
	reg [31:0] MEM_out;
	reg RF_WrData_sel;
	reg RF_B_sel;
	reg Clk;

	// Outputs
	wire [31:0] Immed;
	wire [31:0] RF_A;
	wire [31:0] RF_B;

	// Instantiate the Unit Under Test (UUT)
	DECSTAGE uut (
		.Instr(Instr), 
		.RF_WrEn(RF_WrEn), 
		.ALU_out(ALU_out), 
		.MEM_out(MEM_out), 
		.RF_WrData_sel(RF_WrData_sel), 
		.RF_B_sel(RF_B_sel), 
		.Clk(Clk), 
		.Immed(Immed), 
		.RF_A(RF_A), 
		.RF_B(RF_B)
	);

	initial begin
		// Initialize Inputs
		Instr = 0;
		RF_WrEn = 0;
		ALU_out = 0;
		MEM_out = 0;
		RF_WrData_sel = 0;
		RF_B_sel = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

