`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:46 12/03/2021 
// Design Name: 
// Module Name:    Register 
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
module Register(
    input CLK,
    input [31:0] Data,
    input WE,
    output [31:0] Dout
    );
	 (* keep = "true" *)reg [31:0] Doutres ;
	 assign Dout = Doutres;//
	 initial begin
		Doutres <= 32'b0;
	 end
	 always @(posedge CLK)
	 begin
		if (WE)begin
			$display("Writed to Register %b",Data);
			Doutres <= Data;
		end
	end
endmodule
