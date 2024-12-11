`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: malakas123 
// 
// Create Date:    11:08:25 12/03/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] Op,
    output [31:0] Out,
    output Zero
    );
	 //since in always block left operants are regs 
	 reg [31:0] Alu_result;
	 reg Alu_zero;
	 assign Out = Alu_result;
	 assign Zero = Alu_zero;
	 //need to calculate result when op or operants change
	 // so we can use the * event
	 always @(*) begin 
		case(Op)
		4'b0000: //add
			Alu_result <= A + B;
		4'b0001: //sub
			Alu_result <= A - B;
		4'b0010: //and
			Alu_result <= A & B;
		4'b0011: //aor
			Alu_result <= A | B;
		4'b0100: //add
			Alu_result <= !A;
		4'b1000: //srl
			Alu_result <= {A[31],A[31:1]};
		4'b1010: //srl(msb 0)
			Alu_result <= {1'b0,A[31:1]};
		4'b1001: //sll
			Alu_result <= A<<1;
		4'b1100: //rotate  left
			Alu_result <= {A[30:0],A[31]};						
		4'b1101: //rotate right
			Alu_result <= {A[0],A[31:1]};
		default:
			Alu_result <=  A + B;
		endcase
		if (!Alu_result) begin
			Alu_zero = 1'b1;
		end else begin
			Alu_zero = 1'b0;
		end
	 end
endmodule
