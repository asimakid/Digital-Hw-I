`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:13 12/07/2021 
// Design Name: 
// Module Name:    mux2to1bits5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux2to1bits5(
    input [4:0] Input0,
    input [4:0] Input1,
    input Select,
    output [4:0] Out
    );
	 assign Out  = (Select == 1'b0)? Input0:
						(Select ==  1'b1)? Input1:
						5'bX;
	 /* another implementation
	  reg [4:0] Outres;
	 assign Out = Outres;
	 always@(*) begin
		if(Select) begin
			Outres <= Input1;
		end else begin
			Outres <= Input0;
		end
	end*/


endmodule
