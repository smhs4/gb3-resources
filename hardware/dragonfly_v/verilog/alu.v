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
 *		This module implements the ALU for the RV32I.
 */



/*
 *	Not all instructions are fed to the ALU. As a result, the alu_control
 *	field is only unique across the instructions that are actually
 *	fed to the ALU.
 */
module alu(
	input [1:0]	arithmetic_select,
	input [1:0]	shift_select,
	input [1:0]	logic_select,
	input 		passthrough_a,
	input 		is_eq_compare,
	input 		invert_branch_condition,
	input 		is_signed_compare,
	input [31:0]		A,
	input [31:0]		B,
	output reg [31:0]	alu_result,
	output wire		branch_enable
);

	wire [31:0] compare_A = {(A[31] ^ is_signed_compare),A[30:0]};
	wire [31:0] compare_B = {(B[31] ^ is_signed_compare),B[30:0]};

	reg [31:0]	not_adder;

	reg [31:0] logic_result;
	reg [31:0] shift_logic_result;

	always @(*) begin			//conbinational always
		case (logic_select)
			`ALU_SELECT_XOR:	logic_result = A ^ B;
			`ALU_SELECT_AND:	logic_result = A & B;
			`ALU_SELECT_OR:		logic_result = A | B;
			`ALU_SELECT_PASSTHROUGH: logic_result = (passthrough_a) ? A : B;
			default:	logic_result = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;	//should never happen
		endcase
		case (shift_select)
			`ALU_SELECT_SLL:	shift_logic_result = A << B[4:0];
			`ALU_SELECT_SRL:	shift_logic_result = A >> B[4:0];
			`ALU_SELECT_SRA:	shift_logic_result = $signed(A) >>> B[4:0];
			`ALU_SELECT_LOGIC:	shift_logic_result = logic_result;
			default:	shift_logic_result = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;	//should never happen
		endcase
		case (arithmetic_select)
			`ALU_SELECT_ADD: alu_result = A + B;
			`ALU_SELECT_SUB: alu_result = A - B;
			`ALU_SELECT_SLT_U: alu_result = (compare_A < compare_B) ? 32'b1 : 32'b0;
			`ALU_SELECT_LOGIC_SHIFT: alu_result = shift_logic_result;
			default:	alu_result = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;	//should never happen
		endcase
	end

	assign branch_enable = ((is_eq_compare) ? (A==B) : (compare_A < compare_B)) ^ (invert_branch_condition);

endmodule
