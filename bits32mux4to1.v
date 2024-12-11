`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:35 12/04/2021 
// Design Name: 
// Module Name:    bits32mux4to1 
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
module bits32mux4to1(
    input [31:0] Input0,
    input [31:0] Input1,
    input [31:0] Input2,
    input [31:0] Input3,
    input [1:0] Select,
    output  [31:0] Out
    );
	 assign Out = (Select == 2'b00)? Input0:
					   (Select == 2'b01)? Input1:
						(Select == 2'b10)? Input2:
						(Select == 2'b11)? Input3:
						32'bX;
	 /*another implentation
	 reg [31:0] Outres;
	 assign Out = Outres;
	 
	 always @(*) begin
		case(Select)
		2'b00:
			Outres <= Input0;
		2'b01:
			Outres <= Input1;
		2'b10:
			Outres <= Input2;
		2'b11:
			Outres <= Input3;
		endcase
	end
	*/
endmodule
