`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:06 12/07/2021 
// Design Name: 
// Module Name:    SignExtension32bit 
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
////
//////////////////////////////////////////////////////////////////////////////////
module SignExtension32bit(
    input [15:0] In,
    output [31:0] Out
    );
	assign Out ={{16{In[15]}},In};
	

endmodule
