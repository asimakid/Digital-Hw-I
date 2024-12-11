`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:49 12/18/2021 
// Design Name: 
// Module Name:    register2 
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

module register2(
	 input CLK,
    input [31:0] Data,
    input LoadEn,
	 input reset,
    output [31:0] Dout
    );
	 reg [31:0] Doutres;
	 assign Dout = Doutres;
	 initial begin 
		Doutres <= 32'b0;
	 end
	 always @(posedge CLK)
	 begin
		if (reset)begin
			Doutres <= 32'b0;
		end
	   if (LoadEn)begin
			Doutres <= Data;
		end
	end


endmodule
