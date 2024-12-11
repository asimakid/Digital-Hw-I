`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:30 12/04/2021 
// Design Name: 
// Module Name:    bits32mux2to1 
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
module bits32mux2to1(
    input [31:0] Input0,
    input [31:0] Input1,
    input Select,
    output [31:0] Out
    );
	 assign Out = (Select == 1'b0)?  Input0:
						(Select ==1'b1)? Input1:
						32'bX;
	 /* another implementation
	 reg [31:0] Outres;
	 assign Out = Outres;
	 always@(*) begin
		if(Select) begin
			Outres <= Input1;
		end else begin
			Outres <= Input0;
		end
	end
	*/
endmodule
