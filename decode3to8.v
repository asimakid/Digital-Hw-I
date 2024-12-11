`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:58 12/04/2021 
// Design Name: 
// Module Name:    decode3to8 
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
module decode3to8(
    input[2:0] Input,
    output[7:0] Out
    );
	 //internal variable
	reg [7:0] Outres;
	assign Out = Outres;
	always @(*) begin		
		case(Input)
		3'b000:
			Outres=8'b00000001; 
		3'b001: 
			Outres=8'b00000010; 
		3'b010:
			Outres=8'b00000100;  
		3'b011: 
			Outres=8'b00001000; 
		3'b100: 
			Outres=8'b00010000; 
		3'b101: 
			Outres=8'b00100000;
		3'b110:
			Outres=8'b01000000; 
		3'b111:
			Outres=8'b10000000; 
		endcase
	end
endmodule
