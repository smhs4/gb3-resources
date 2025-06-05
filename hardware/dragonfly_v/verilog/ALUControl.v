/*
	Authored 2018-2019, Ryan Voo.

	All rights reserved.
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions
	are met:

	*	Redistributions of source code must retain the above
		copyright notice, this list of conditions and the following
		disclaimer.

	*	Redistributions in binary form must reproduce the above
		copyright notice, this list of conditions and the following
		disclaimer in the documentation and/or other materials
		provided with the distribution.

	*	Neither the name of the author nor the names of its
		contributors may be used to endorse or promote products
		derived from this software without specific prior written
		permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
	COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
	LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
	ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
*/



`include "../include/rv32i-defines.v"
// `include "../include/sail-core-defines.v"
`include "../include/dragonfly_core_defines.v"



/*
 *	Description:
 *
 *		This module implements the ALU control unit
 */



module ALUControl(
	input 				clock,
	input				reset,
	input 		[6:0]	Opcode,
	input 		[2:0]	funct3,
	input				is_variant,
	
	output reg 	[1:0]	ex_alu_arithmetic_select,
	output reg 	[1:0]	ex_alu_shift_select,
	output reg 	[1:0]	ex_alu_logic_select,
	output reg 			ex_alu_passthrough_a,

	output reg 			ex_alu_is_eq_compare,
	output reg 			ex_alu_invert_branch_condition,
	output reg 			ex_alu_is_signed_compare
);


	always @(posedge clock) begin
		if (reset) begin //complete
			ex_alu_arithmetic_select 		<= 2'b00;
			ex_alu_shift_select 			<= 2'b00;
			ex_alu_logic_select 			<= 2'b00;
			ex_alu_passthrough_a 			<= 1'b0;
			ex_alu_is_eq_compare 			<= 1'b1;	// set to branch if equals, predictor latch is cleared when reset so this forces a mispredict
														// As a result, the road not taken is used, which is forced to zero during reset
			ex_alu_invert_branch_condition 	<= 1'b0;
			ex_alu_is_signed_compare 		<= 1'b0;
		end else begin
			case (Opcode)
				/*
				*	LUI, U-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_LUI: begin //complete
					ex_alu_arithmetic_select <= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
					ex_alu_shift_select <= `ALU_SELECT_LOGIC;					// select logic or pass-through
					ex_alu_logic_select <= `ALU_SELECT_PASSTHROUGH;				// select pass-through
					ex_alu_passthrough_a <= 1'b0;								// pass-through b: the immediate value

					ex_alu_is_eq_compare 			<= 1'bx;					// LUI is not compare instruction
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= 1'bx;
				end

				/*
				*	AUIPC, U-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_AUIPC: begin //complete
					ex_alu_arithmetic_select 		<= `ALU_SELECT_ADD;		// addition
					ex_alu_shift_select 			<= 2'bxx;				// don't care since the final stage is addition
					ex_alu_logic_select 			<= 2'bxx;
					ex_alu_passthrough_a 			<= 2'bxx;

					ex_alu_is_eq_compare 			<= 1'bx;				// AUIPC is not a compare instruction
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= 1'bx;
				end

				/*
				*	JAL, UJ-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_JAL: begin //complete
					ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
					ex_alu_shift_select 			<= `ALU_SELECT_LOGIC;			// select logic or pass-through
					ex_alu_logic_select 			<= `ALU_SELECT_PASSTHROUGH;		// select pass-through
					ex_alu_passthrough_a 			<= 1'b1;						// pass-through a: the next pc
					
					ex_alu_is_eq_compare 			<= 1'bx;				// AUIPC is not a compare instruction
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= 1'bx;
				end

				/*
				*	JALR, I-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_JALR: begin //complete
					ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
					ex_alu_shift_select 			<= `ALU_SELECT_LOGIC;			// select logic or pass-through
					ex_alu_logic_select 			<= `ALU_SELECT_PASSTHROUGH;		// select pass-through
					ex_alu_passthrough_a 			<= 1'b1;						// pass-through a: the next pc
					
					ex_alu_is_eq_compare 			<= 1'bx;				// AUIPC is not a compare instruction
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= 1'bx;
				end

				/*
				*	Branch, SB-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_BRANCH: begin //complete
					ex_alu_arithmetic_select 		<= `ALU_SELECT_SLT_U;
					ex_alu_shift_select 			<= 2'bxx;
					ex_alu_logic_select 			<= 2'bxx;
					ex_alu_passthrough_a 			<= 1'bx;

					ex_alu_is_eq_compare 			<= ~funct3[2];
					ex_alu_invert_branch_condition 	<=  funct3[0];
					ex_alu_is_signed_compare 		<= ~funct3[1];
				end

				/*
				*	Loads, I-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_LOAD: begin //complete	//LOAD does not use ALU result, thus the output can be any value
					ex_alu_arithmetic_select 		<= 2'bxx;
					ex_alu_shift_select 			<= 2'bxx;
					ex_alu_logic_select 			<= 2'bxx;
					ex_alu_passthrough_a 			<= 1'bx;
					
					ex_alu_is_eq_compare 			<= 1'bx;
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= 1'bx;
				end

				/*
				*	Stores, S-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_STORE: begin	//complete	//STORE does not use ALU result, thus the output can be any value
					ex_alu_arithmetic_select 		<= 2'bxx;
					ex_alu_shift_select 			<= 2'bxx;
					ex_alu_logic_select 			<= 2'bxx;
					ex_alu_passthrough_a 			<= 1'bx;
					
					ex_alu_is_eq_compare 			<= 1'bx;
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= 1'bx;
				end

				/*
				*	Immediate operations, I-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_IMMOP: begin //complete
					ex_alu_is_eq_compare 			<= 1'bx;	//not branch instruction
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= ~funct3[0];
					case (funct3[2:0])
						3'b000: begin //complete	ADDI
							ex_alu_arithmetic_select 		<= `ALU_SELECT_ADD;		// addition
							ex_alu_shift_select 			<= 2'bxx;				// don't care since the final stage is addition
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 2'bxx;
						end
						3'b001: begin //complete	SLLI
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;	// select shift, logic or pass-through
							ex_alu_shift_select 			<= `ALU_SELECT_SLL;			// select sll
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 1'bx;
						end
						3'b010: begin //complete	SLT
							ex_alu_arithmetic_select 		<= `ALU_SELECT_SLT_U;	// slt of sltu
							ex_alu_shift_select 			<= 2'bxx;				// don't care since the final stage is slt
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 2'bxx;
						end
						3'b011: begin //complete	SLTU
							ex_alu_arithmetic_select 		<= `ALU_SELECT_SLT_U;	// slt of sltu
							ex_alu_shift_select 			<= 2'bxx;				// don't care since the final stage is sltu
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 2'bxx;
						end
						3'b100: begin //complete	XORI
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
							ex_alu_shift_select 			<= `ALU_SELECT_LOGIC;			// select logic or pass-through
							ex_alu_logic_select 			<= `ALU_SELECT_XOR;				// select XOR
							ex_alu_passthrough_a 			<= 1'bx;
						end
						3'b101: begin //complete	SHIFT RIGHT imm
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;	// select shift, logic or pass-through
							ex_alu_shift_select 			<= (is_variant) ? `ALU_SELECT_SRA : `ALU_SELECT_SRL;// select shift right
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 1'bx;
						end
						3'b110: begin //complete ORI
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
							ex_alu_shift_select 			<= `ALU_SELECT_LOGIC;			// select logic or pass-through
							ex_alu_logic_select 			<= `ALU_SELECT_OR;				// select OR
							ex_alu_passthrough_a 			<= 1'bx;
						end
						3'b111: begin //complete ANDI
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
							ex_alu_shift_select 			<= `ALU_SELECT_LOGIC;			// select logic or pass-through
							ex_alu_logic_select 			<= `ALU_SELECT_AND;				// select AND
							ex_alu_passthrough_a 			<= 1'bx;
						end
						default: begin	// should never happen
							ex_alu_arithmetic_select 		<= 2'bxx;
							ex_alu_shift_select 			<= 2'bxx;
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 1'bx;
						end
					endcase
				end

				/*
				*	ADD SUB & logic shifts, R-Type
				*/
				`kRV32I_INSTRUCTION_OPCODE_ALUOP: begin
					ex_alu_is_eq_compare 			<= 1'bx;	//not branch instruction
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= (~funct3[0]) & (~is_variant);
					case (funct3[2:0])
						3'b000: begin //complete	ADD SUB
							ex_alu_arithmetic_select 		<= (is_variant) ? `ALU_SELECT_SUB : `ALU_SELECT_ADD;		// addition
							ex_alu_shift_select 			<= 2'bxx;				// don't care since the final stage is addition
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 2'bxx;
						end
						3'b001: begin //complete	SLLI
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;	// select shift, logic or pass-through
							ex_alu_shift_select 			<= `ALU_SELECT_SLL;			// select sll
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 1'bx;
						end
						3'b010: begin //complete	SLT
							ex_alu_arithmetic_select 		<= `ALU_SELECT_SLT_U;	// slt of sltu
							ex_alu_shift_select 			<= 2'bxx;				// don't care since the final stage is slt
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 2'bxx;
						end
						3'b011: begin //complete	SLTU
							ex_alu_arithmetic_select 		<= `ALU_SELECT_SLT_U;	// slt of sltu
							ex_alu_shift_select 			<= 2'bxx;				// don't care since the final stage is sltu
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 2'bxx;
						end
						3'b100: begin //complete	XOR
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
							ex_alu_shift_select 			<= `ALU_SELECT_LOGIC;			// select logic or pass-through
							ex_alu_logic_select 			<= `ALU_SELECT_XOR;				// select XOR
							ex_alu_passthrough_a 			<= 1'bx;
						end
						3'b101: begin //complete	SHIFT RIGHT
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;	// select shift, logic or pass-through
							ex_alu_shift_select 			<= (is_variant) ? `ALU_SELECT_SRA : `ALU_SELECT_SRL;// select shift right
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 1'bx;
						end
						3'b110: begin //complete OR
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
							ex_alu_shift_select 			<= `ALU_SELECT_LOGIC;			// select logic or pass-through
							ex_alu_logic_select 			<= `ALU_SELECT_OR;				// select OR
							ex_alu_passthrough_a 			<= 1'bx;
						end
						3'b111: begin //complete AND
							ex_alu_arithmetic_select 		<= `ALU_SELECT_LOGIC_SHIFT;		// select shift, logic or pass-through
							ex_alu_shift_select 			<= `ALU_SELECT_LOGIC;			// select logic or pass-through
							ex_alu_logic_select 			<= `ALU_SELECT_AND;				// select AND
							ex_alu_passthrough_a 			<= 1'bx;
						end
						default: begin	// should never happen
							ex_alu_arithmetic_select 		<= 2'bxx;
							ex_alu_shift_select 			<= 2'bxx;
							ex_alu_logic_select 			<= 2'bxx;
							ex_alu_passthrough_a 			<= 1'bx;
						end
					endcase
				end
					

				default: begin  //complete	// should not happen, defined to all x to allow optimization
					ex_alu_arithmetic_select 		<= 2'bxx;
					ex_alu_shift_select 			<= 2'bxx;
					ex_alu_logic_select 			<= 2'bxx;
					ex_alu_passthrough_a 			<= 1'bx;
					
					ex_alu_is_eq_compare 			<= 1'bx;
					ex_alu_invert_branch_condition 	<= 1'bx;
					ex_alu_is_signed_compare 		<= 1'bx;
				end
			endcase
		end
	end
endmodule
