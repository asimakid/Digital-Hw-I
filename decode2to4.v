`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:19:30 12/05/2021 
// Design Name: 
// Module Name:    decode2to4 
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
module decode2to4(
    input [1:0] In,
    output [3:0] Out
    );
	 assign Out = (In == 2'b00)? 4'b0001:
						(In == 2'b01) ? 4'b0010:
						(In == 2'b10) ? 4'b0100:
						(In == 2'b11) ? 4'b1000:
						4'bX;
	 /*
	 reg [3:0] Outres;
	 assign Out = Outres;

	always @(*) begin
		case(In)
			2'b00:
				Outres = 4'b0001;
			2'b01:
				Outres = 4'b0010;
			2'b10:
				Outres = 4'b0100;
			2'b11:
				Outres = 4'b1000;
		endcase
	end	*/
endmodule
