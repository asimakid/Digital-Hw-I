`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:26 12/15/2021
// Design Name:   RegisterFile
// Module Name:   C:/Users/userPc/digitalSytstemsProject/RegisterFile_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "RegisterFile.v"
module RegisterFile_tb;

	// Inputs
	reg [4:0] Adr1;
	reg [4:0] Adr2;
	reg [4:0] Awr;
	reg [31:0] Din;
	reg WrEn;
	reg Clk;

	// Outputs
	wire [31:0] Dout1;
	wire [31:0] Dout2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.Adr1(Adr1), 
		.Adr2(Adr2), 
		.Awr(Awr), 
		.Dout1(Dout1), 
		.Dout2(Dout2), 
		.Din(Din), 
		.WrEn(WrEn), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		Adr1 = 0;
		Adr2 = 0;
		Awr = 0;
		Din = 0;
		WrEn = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
		//out reg1 and reg2
		Adr1 =32'h0000;
		Adr2 = 32'h0002;
		//preparing to write din to reg1
		Din = 32'h2232;
		WrEn = 1'b1;
		Awr = 5'b00000;
		//clock to execute the writing to reg 1
		#10; 
		Clk =1'b1;
		#1;
		Clk = 1'b0;
		#10; 
		//preparing to write Din to reg2
		Awr = 5'b00010;
		//clock to exxecute w//riting in reg2
		#10; 
		Clk =1'b1;
		#1;
		Clk = 1'b0;
		WrEn = 1'b0;
		//wren to zero to finish all the writing
		#10; 
		//reading register4
		Adr2 = 32'h0004;
		//preparing to write din to reg4 
		Awr = 32'h0004;
		//clock to excute writing
		//wont happe wren=0
		#10;
		Clk=1'b1;
		#1;
		Clk =1'b0;
		#10;
		//enabling writing
		WrEn = 1'b1;
		//clock pulse to execute wrriting to reg4
		//output should change for dout2
		//pulse to execute writing in register4
		#10;
		Clk=1'b1;
		#1;
		Clk =1'b0;
		
        
		// Add stimulus here

	end
      
endmodule

