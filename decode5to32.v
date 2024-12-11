`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:16 12/04/2021 
// Design Name: 
// Module Name:    decode5to32 
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
module decode5to32(
    input [4:0] Adr,
	 output reg [31:0] Out
    );
	 always @(*) begin
		case (Adr)
		5'b00000: Out = 32'h00000001;
		5'b00001: Out = 32'h00000002;
		5'b00010: Out = 32'h00000004;
		5'b00011: Out = 32'h00000008;
		5'b00100: Out = 32'h00000010;
		5'b00101: Out = 32'h00000020;
		5'b00110: Out = 32'h00000040;
		5'b00111: Out = 32'h00000080;
		5'b01000: Out = 32'h00000100;
		5'b01001: Out = 32'h00000200;
		5'b01010: Out = 32'h00000400;
		5'b01011: Out = 32'h00000800;
		5'b01100: Out = 32'h00001000;
		5'b01101: Out = 32'h00002000;
		5'b01110: Out = 32'h00004000;
		5'b01111: Out = 32'h00008000;
		5'b10000: Out = 32'h00010000;
		5'b10001: Out = 32'h00020000;
		5'b10010: Out = 32'h00040000;
		5'b10011: Out = 32'h00080000;
		5'b10100: Out = 32'h00100000;
		5'b10101: Out = 32'h00200000;
		5'b10110: Out = 32'h00400000;
		5'b10111: Out = 32'h00800000;
		5'b11000: Out = 32'h01000000;
		5'b11001: Out = 32'h02000000;
		5'b11010: Out = 32'h04000000;
		5'b11011: Out = 32'h08000000;
		5'b11100: Out = 32'h10000000;
		5'b11101: Out = 32'h20000000;
		5'b11110: Out = 32'h40000000;
		5'b11111: Out = 32'h80000000;
		endcase 		
		
	 end
	/*not  Inv4(Nota, Adr[4]);
	not  Inv3(Notb, Adr[3]);
	not  Inv2(Notc, Adr[2]);
	not  Inv1(Notd, Adr[1]);
	not  Inv0(Note, Adr[0]);

	(* keep_hierarchy = "yes" *)AND_5_input a0(Out[0],  Nota,Notb,Notc,Notd,Note); // 00000
	AND_5_input a1(Out[1],  Nota,Notb,Notc,Notd,Adr[0]); // 00001
	AND_5_input a2(Out[2],  Nota,Notb,Notc,Adr[1],Note); //00010
	AND_5_input a3(Out[3],  Nota,Notb,Notc,Adr[1],Adr[0]);
	AND_5_input a4(Out[4],  Nota,Notb,Adr[2],Notd,Note);
	AND_5_input a5(Out[5],  Nota,Notb,Adr[2],Notd,Adr[0]);
	AND_5_input a6(Out[6],  Nota,Notb,Adr[2],Adr[1],Note);
	AND_5_input a7(Out[7],  Nota,Notb,Adr[2],Adr[1],Adr[0]);
	AND_5_input a8(Out[8],    Nota,Adr[3],Notc,Notd,Note);
	AND_5_input a9(Out[9],    Nota,Adr[3],Notc,Notd,Adr[0]);
	AND_5_input a10(Out[10],  Nota,Adr[3],Notc,Adr[1],Note);
	AND_5_input a11(Out[11],  Nota,Adr[3],Notc,Adr[1],Adr[0]);
	AND_5_input a12(Out[12],  Nota,Adr[3],Adr[2],Notd,Note);
	AND_5_input a13(Out[13],  Nota,Adr[3],Adr[2],Notd,Adr[0]);
	AND_5_input a14(Out[14],  Nota,Adr[3],Adr[2],Adr[1],Note);
	AND_5_input a15(Out[15],  Nota,Adr[3],Adr[2],Adr[1],Adr[0]);
	AND_5_input a16(Out[16],  Adr[4],Notb,Notc,Notd,Note);
	AND_5_input a17(Out[17],  Adr[4],Notb,Notc,Notd,Adr[0]);
	AND_5_input a18(Out[18],  Adr[4],Notb,Notc,Adr[1],Note);
	AND_5_input a19(Out[19],  Adr[4],Notb,Notc,Adr[1],Adr[0]);
	AND_5_input a20(Out[20],  Adr[4],Notb,Adr[2],Notd,Note);
	AND_5_input a21(Out[21],  Adr[4],Notb,Adr[2],Notd,Adr[0]);
	AND_5_input a22(Out[22],  Adr[4],Notb,Adr[2],Adr[1],Note);
	AND_5_input a23(Out[23],  Adr[4],Notb,Adr[2],Adr[1],Adr[0]);
	AND_5_input a24(Out[24],  Adr[4],Adr[3],Notc,Notd,Note);
	AND_5_input a25(Out[25],  Adr[4],Adr[3],Notc,Notd,Adr[0]);
	AND_5_input a26(Out[26],  Adr[4],Adr[3],Notc,Adr[1],Note);
	AND_5_input a27(Out[27],  Adr[4],Adr[3],Notc,Adr[1],Adr[0]);
	AND_5_input a28(Out[28],  Adr[4],Adr[3],Adr[2],Notd,Note);
	AND_5_input a29(Out[29],  Adr[4],Adr[3],Adr[2],Notd,Adr[0]);
	AND_5_input a30(Out[30],  Adr[4],Adr[3],Adr[2],Adr[1],Note);
	AND_5_input a31(Out[31],  Adr[4],Adr[3],Adr[2],Adr[1],Adr[0]);
	 */


endmodule
