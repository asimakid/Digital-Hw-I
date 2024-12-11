`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:39:58 12/14/2021
// Design Name:   mux32to1
// Module Name:   C:/Users/userPc/digitalSytstemsProject/mu32to1_tb.v
// Project Name:  digitalSytstemsProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux32to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:////
// 
////////////////////////////////////////////////////////////////////////////////
`include "mux32to1.v"
module mu32to1_tb;

	// Inputs
	reg [4:0] Select;
	reg [31:0] Input0;
	reg [31:0] Input1;
	reg [31:0] Input2;
	reg [31:0] Input3;
	reg [31:0] Input4;
	reg [31:0] Input5;
	reg [31:0] Input6;
	reg [31:0] Input7;
	reg [31:0] Input8;
	reg [31:0] Input9;
	reg [31:0] Input10;
	reg [31:0] Input11;
	reg [31:0] Input12;
	reg [31:0] Input13;
	reg [31:0] Input14;
	reg [31:0] Input15;
	reg [31:0] Input16;
	reg [31:0] Input17;
	reg [31:0] Input18;
	reg [31:0] Input19;
	reg [31:0] Input20;
	reg [31:0] Input21;
	reg [31:0] Input22;
	reg [31:0] Input23;
	reg [31:0] Input24;
	reg [31:0] Input25;
	reg [31:0] Input26;
	reg [31:0] Input27;
	reg [31:0] Input28;
	reg [31:0] Input29;
	reg [31:0] Input30;
	reg [31:0] Input31;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	mux32to1 uut (
		.Select(Select), 
		.Input0(Input0), 
		.Input1(Input1), 
		.Input2(Input2), 
		.Input3(Input3), 
		.Input4(Input4), 
		.Input5(Input5), 
		.Input6(Input6), 
		.Input7(Input7), 
		.Input8(Input8), 
		.Input9(Input9), 
		.Input10(Input10), 
		.Input11(Input11), 
		.Input12(Input12), 
		.Input13(Input13), 
		.Input14(Input14), 
		.Input15(Input15), 
		.Input16(Input16), 
		.Input17(Input17), 
		.Input18(Input18), 
		.Input19(Input19), 
		.Input20(Input20), 
		.Input21(Input21), 
		.Input22(Input22), 
		.Input23(Input23), 
		.Input24(Input24), 
		.Input25(Input25), 
		.Input26(Input26), 
		.Input27(Input27), 
		.Input28(Input28), 
		.Input29(Input29), 
		.Input30(Input30), 
		.Input31(Input31), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		Select = 5'b00010;
		Input0 = 0;
		Input1 = 0;
		Input2 = 0;
		Input3 = 0;
		Input4 = 0;
		Input5 = 0;
		Input6 = 0;
		Input7 = 0;
		Input8 = 0;
		Input9 = 0;
		Input10 = 0;
		Input11 = 0;
		Input12 = 0;
		Input13 = 0;
		Input14 = 0;
		Input15 = 0;
		Input16 = 0;
		Input17 = 0;
		Input18 = 0;
		Input19 = 0;
		Input20 = 0;
		Input21 = 0;
		Input22 = 0;
		Input23 = 0;
		Input24 = 0;
		Input25 = 0;
		Input26 = 0;
		Input27 = 0;
		Input28 = 0;
		Input29 = 0;
		Input30 = 0;
		Input31 = 0;

		// Wait 100 ns for global reset to finish
		#5;
		Input2= 32'b1111111111111111111111111111111;
        
		// Add stimulus here
		#2
		Select= 5'b00100;

	end
      
endmodule

