`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:47 12/21/2021 
// Design Name: 
// Module Name:    CONTROL 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: //
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CONTROL(///
    input [31:0] Instr,
	 input Zero,
	 input Clk,
	 input Reset,
    output reg PC_Sel,//Branch
    output reg PC_LdEn,//Branch and all states leading to  i fetch
    output reg PC_Reset,
    output reg RF_B_Sel,//decode
    output reg RF_WrData_sel,//alu_wb
	 output reg RF_WrEn,//alu_wb
    output reg ALU_Bin_Sel,//Alu_exec
    output reg[3:0] ALU_func,//Alu_exec
    output reg MEM_WrEn,//mem_wr
	 output reg MEM_ByteOp//mem byte operations
    );
	 reg[3:0] state,nextstate;
	 wire[5:0] Func;
	 wire [5:0] Opcode;
	 assign Opcode = Instr[31:26];
	 assign Func = Instr[5:0];
	 parameter i_fetch= 4'b0000,decode_rr =4'b0001,alu_exec=4'b0010,alu_wb=4'b0011,
	 mem_addr = 4'b0100,mem_wr=4'b0101,mem_rd=4'b0110,ld_wb=4'b0111,branch=4'b1000;
	 //Sequential block of FSM
	 initial begin
		nextstate <=i_fetch;
	 end
	 always @(negedge Clk or posedge Reset) begin
		if(Reset)begin
			state<= i_fetch;
		end
		else begin
			state<= nextstate;
		end
	 end
	 //func not really needed  but to avoid the warning since opcode and func change together
	 always@(state) begin 
		case(state)
			i_fetch: begin 
				$display("Insction Fetch");		
				PC_LdEn = 1'b0;
				MEM_ByteOp =1'b0;
				//disable RF_Wr_En and MEM_WrEn since where on from previous
				RF_WrEn =1'b0;
				MEM_WrEn = 1'b0; 
				//disable PC_LdEn which was enabled on previous state
				//return Pc_sel to normal,only changed when in branch
				PC_Sel = 1'b0;
				//all the other signals zero
				PC_Reset = 1'b0;
				RF_B_Sel =1'b0;
				RF_WrData_sel= 1'b0;
				ALU_Bin_Sel =1'b0;
				ALU_func= 0;
				//next state will always bedecode 
				nextstate = decode_rr;//prepare what will do in this state
				end
			decode_rr: begin 
				$display("Decode instr %b",Instr);
				// imidiate means readregister 2  =21-16 mux select 1
				//nnot immidiate means readreagister2 =15-11 mux select 0
				case(Opcode)
					//next state mem addr for 000011,000111,001111,011111
					6'b000011,6'b000111,6'b001111,6'b011111:begin
						RF_B_Sel = 1'b1;
						nextstate = mem_addr;
					end
					//next state branch for op 111111,000001,000000
					6'b111111,6'b000001,6'b000000:begin
					   RF_B_Sel = 1'b1;
						ALU_func = 4'b0001;
						nextstate = branch;
						if(Instr == 32'h00000000)begin
							RF_B_Sel = 1'b0;
							ALU_func = 4'b0000;
							PC_LdEn = 1'b1;
							nextstate = i_fetch;
						end				
					end
					//next state alu exec for all other
					6'b100000,6'b111000,6'b111001,6'b110000,6'b110010,6'b110011:begin 
						if(Opcode == 6'b100000)begin
							// $display("not function with immed");
								RF_B_Sel = 1'b0;
						end
						else  begin
						//$display("function with immed");
							RF_B_Sel = 1'b1;
						end
						nextstate = alu_exec;
					end
				endcase
				//all the other signals are zero				
				end
			alu_exec:begin
			   $display("Alu exec");
				//decide signals ALU_Bin_sel and ALU_func
				// alu bin sel  0 not immed 
				// alu bin sel 1 immed
				case(Opcode)
					6'b100000:begin
					ALU_Bin_Sel = 1'b0;
					//4 bits from func
					ALU_func = Func[3:0];
					end
					// load immidiate case add immidate with zero reg
					6'b111000,6'b111001:begin 
						ALU_Bin_Sel = 1'b1;
						ALU_func = 4'b0000;
					end
					//other instructions with immidiate form
					default:begin
						ALU_Bin_Sel = 1'b1;
						//4 bits from Opcode						
						ALU_func = Opcode[3:0];
						end
				endcase
				//next state will always be alu_wb
				nextstate = alu_wb;
				/*//all the other signals are already zero or proppriate 
				PC_Sel = 0;
				PC_LdEn = 0;
				PC_Reset =0;
				RF_B_Sel =0;
				RF_WrData_sel = 0;
				RF_WrEn = 0;
				MEM_WrEn =0;
				*/
			end
			alu_wb:begin
			   $display("alu write back");
				//write alu out to rf
				//enable RF write 
				//RF_WrData_sel always show to Alu_out
				RF_WrEn =1'b1;//will be disabled in next state
				//Alu out-> 1 mem_out ->0
				RF_WrData_sel =1'b1;
				//pc = pc +4 no branch just next instruction
				PC_LdEn = 1'b1;
				PC_Sel = 1'b0;
				//next state is always i_fetch
				nextstate = i_fetch;
				end
			mem_addr: begin//state used only for sb,sw,lw,lb
			$display("mem address");
			 //get output from alu to be a + immed alu func  that of add immde
				ALU_func = 4'b0000;
				//choose immed as second argument
				ALU_Bin_Sel =1'b1;
				//two possible next states mem_rd mem_wr 
				//mem_rd for lw and lb
				//mem_wr for sb and sw
				case(Opcode)//PROBLEM just to make a differanet cas sice ignored the other way
					6'b000011:begin//lb
						MEM_ByteOp =1;
						nextstate = mem_rd;
						end
					6'b001111:begin
						MEM_ByteOp =0;
						nextstate = mem_rd;
						end
					6'b000111:begin //sb
						MEM_ByteOp =1;
						nextstate = mem_wr;
						end
					6'b011111:begin
						MEM_ByteOp =0;
						nextstate = mem_wr;
						end
					default:begin
						//case of something not working
						PC_LdEn = 1'b1;
						nextstate = i_fetch;
					end
				endcase	
			
				end
			mem_wr:begin
			$display("write to memory");
			//enbale writing in the memory
				MEM_WrEn = 1'b1;//will be disabled in next state
				//next state is always i_fetch
				PC_LdEn = 1'b1;
				//case  for lw and lb
			
				nextstate = i_fetch;
				//all the other signals to ze
				end
			mem_rd:begin
			$display("memory read");
				//no signal to be decide
				//one engine circle to load the word from memory to memory out
				//next state is always ld_wb
				nextstate = ld_wb;
				//all the other signals to zer
				end
			ld_wb:begin
			 $display("bring to rf from memory");
				//write mem_out  to rf
				//enable RF write 
				//RF_WrData_sel always show to Mem_out
				RF_WrEn =1'b1;//will be disabled in next state
				//Alu out-> 1 mem_out ->0
				RF_WrData_sel =1'b0;
				PC_LdEn = 1'b1;
				//next state is always i_fetch
				nextstate = i_fetch;
				//all the other signals to zero
				end
			branch: begin
			$display("branch");
			//alu does a-b 
				//enable pcload aways in this state no matter if branch or no
				PC_LdEn = 1'b1;
				//need to decide
				case(Opcode)
					6'b111111:// branch		
						//decide pc_sel 1-> for branch 0-> not branch
						PC_Sel = 1'b1;
					6'b000000:begin//beq	
						if(Zero)
							PC_Sel = 1'b1;
						else 
							PC_Sel = 1'b0;
					end
					6'b000001:begin//bne
						if(Zero)
							PC_Sel = 1'b0;
						else 
							PC_Sel = 1'b1;
					end
					default begin 
						PC_Sel = 1'bX;
					end
				endcase
				nextstate = i_fetch;
			end
			default: begin
			$display("probably error");
				nextstate = i_fetch;
				//all the other signals to zero
				PC_Sel = 0;
				PC_LdEn = 1'b1;
				PC_Reset =0;
				RF_B_Sel =0;
				RF_WrData_sel = 0;
				RF_WrEn = 0;
				ALU_Bin_Sel =0;
				ALU_func =0;
				MEM_WrEn =0;
			end
		endcase		
	 end
endmodule
