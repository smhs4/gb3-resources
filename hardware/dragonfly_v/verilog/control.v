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



/*
 *	RISC-V CONTROL UNIT
 */
module control(
		clock,
		opcode,
		flush,
		RegWrite,
		data_mem_write,
		data_mem_read,
		Branch,
		ALUSrc,
		Jump,
		Jalr,
		// Lui,
		// Auipc,
		Jal,
		id_branch,
		ex_is_pc
		// Fence,
	);

	input 			clock;
	input	[6:0] 	opcode;
	input			flush;

	output reg RegWrite;
	output reg data_mem_write;
	output reg data_mem_read;
	output reg Branch;
	output reg ALUSrc;
	output     Jump;
	output reg Jalr;

	output reg ex_is_pc;
	// output reg Lui;
	// output reg Auipc;
	// output reg Fence;

	output Jal;
	output id_branch;
	assign Jal = opcode[5] & opcode[3];
	assign id_branch = (opcode[6]) & (~opcode[4]) & (~opcode[2]);
	assign Jump = (opcode[6]) & (opcode[5]) & (~opcode[4]) & (opcode[2]);	//110x1	matching 11001 (JALR) 11011 (JAL)
	always @(posedge clock) begin
	RegWrite <= ((~opcode[5]) | ((~opcode[6]) & opcode[4]) | opcode[2]) & (~flush); //confirmed
	data_mem_write <= ((~opcode[6]) & (opcode[5]) & (~opcode[4])) & (~flush);	//confirmed 010xx matching 01000(STORE) 01001(FP-SW) 01011(ATOMIC) 01010(unknown)
	data_mem_read <= (~opcode[5]) & (~opcode[4]) & (~opcode[3]);	//confirmed x000x matching 00000(LOAD) 00001(FP-LW) 10000 10001(unknown)
	Branch <= ((opcode[6]) & (~opcode[4]) & (~opcode[2])) & (~flush);//confirmed1x0x0 matching 10000 (unknown) 10010 (unknown) 11000 (BRANCH) 11010 (unknown)
	ALUSrc <= (~opcode[5]) | opcode[2];//confirmed


	Jalr <= ((opcode[6]) & (opcode[5]) & (~opcode[4]) & (~opcode[3]) & (opcode[2])) & (~flush);		//11001 JALR
	// Lui <= (~opcode[6]) & (opcode[5]) & (opcode[4]) & (~opcode[3]) & (opcode[2]);		//01101 LUI
	// Auipc <= (~opcode[6]) & (~opcode[5]) & (opcode[4]) & (~opcode[3]) & (opcode[2]);	//00101 AUIPC
	// Fence <= (~opcode[5]) & opcode[3] & (opcode[2]);
	ex_is_pc <= opcode[2] & (~(opcode[5] | opcode[4]));
	end

endmodule
