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
 *	Pipeline registers
 */



/* IF/ID pipeline registers */ 
module if_id (clk, if_inst, if_pc, id_inst, id_pc);
	input			clk;
	input [31:0]		if_inst;
	input [31:0]		if_pc;

	output reg[31:0]	id_inst;
	output reg[31:0]	id_pc;

	/*
	 *	This uses Yosys's support for nonzero initial values:
	 *
	 *		https://github.com/YosysHQ/yosys/commit/0793f1b196df536975a044a4ce53025c81d00c7f
	 *
	 *	Rather than using this simulation construct (`initial`),
	 *	the design should instead use a reset signal going to
	 *	modules in the design.
	 */
	initial begin
		id_inst = 32'b0;
		id_pc = 32'b0;
	end

	always @(posedge clk) begin
		id_inst <= if_inst;
		id_pc <= if_pc;
	end
endmodule



/* ID/EX pipeline registers */ 
module id_ex (clk, id_inst_imm, id_RegB_AddrFwdFlush_mux_out, id_RegA_AddrFwdFlush_mux_out, id_inst_rd, id_dataMem_sign_mask, id_alu_ctl, id_imm, id_RegB_mux_out, id_RegA_mux_out, id_pc, data_in, data_out, ex_inst_imm, ex_RegB_AddrFwdFlush_mux_out, ex_RegA_AddrFwdFlush_mux_out, ex_inst_rd, ex_dataMem_sign_mask, ex_alu_ctl, ex_imm, ex_RegB_mux_out, ex_RegA_mux_out, ex_pc);
	input			clk;
	input [11:0]		id_inst_imm;
	input [4:0]			id_RegB_AddrFwdFlush_mux_out;
	input [4:0]			id_RegA_AddrFwdFlush_mux_out;
	input [4:0]			id_inst_rd;
	input [3:0]			id_dataMem_sign_mask;
	input [6:0]			id_alu_ctl;
	input [31:0]		id_imm;
	input [31:0]		id_RegB_mux_out;
	input [31:0]		id_RegA_mux_out;
	input [31:0]		id_pc;
	input [11:0]		data_in;
	output reg[11:0]	data_out;
	output reg[11:0]	ex_inst_imm;
	output reg[4:0]		ex_RegB_AddrFwdFlush_mux_out;
	output reg[4:0]		ex_RegA_AddrFwdFlush_mux_out;
	output reg[4:0]		ex_inst_rd;
	output reg[3:0]		ex_dataMem_sign_mask;
	output reg[6:0]		ex_alu_ctl;
	output reg[31:0]	ex_imm;
	output reg[31:0]	ex_RegB_mux_out;
	output reg[31:0]	ex_RegA_mux_out;
	output reg[31:0]	ex_pc;

	/*
	 *	The `initial` statement below uses Yosys's support for nonzero
	 *	initial values:
	 *
	 *		https://github.com/YosysHQ/yosys/commit/0793f1b196df536975a044a4ce53025c81d00c7f
	 *
	 *	Rather than using this simulation construct (`initial`),
	 *	the design should instead use a reset signal going to
	 *	modules in the design and to thereby set the values.
	 */
	initial begin
		data_out = 44'b0;
		ex_inst_imm = 12'b0;
		ex_RegB_AddrFwdFlush_mux_out = 5'b0;
		ex_RegA_AddrFwdFlush_mux_out = 5'b0;
		ex_inst_rd = 5'b0;
		ex_dataMem_sign_mask = 4'b0;
		ex_alu_ctl = 7'b0;
		ex_imm = 32'b0;
		ex_RegB_mux_out = 32'b0;
		ex_RegA_mux_out = 32'b0;
		ex_pc = 32'b0;
	end

	always @(posedge clk) begin
		data_out <= data_in;
		ex_inst_imm <= id_inst_imm;
		ex_RegB_AddrFwdFlush_mux_out <= id_RegB_AddrFwdFlush_mux_out;
		ex_RegA_AddrFwdFlush_mux_out <= id_RegA_AddrFwdFlush_mux_out;
		ex_inst_rd <= id_inst_rd;
		ex_dataMem_sign_mask <= id_dataMem_sign_mask;
		ex_alu_ctl <= id_alu_ctl;
		ex_imm <= id_imm;
		ex_RegB_mux_out <= id_RegB_mux_out;
		ex_RegA_mux_out <= id_RegA_mux_out;
		ex_pc <= id_pc;
	end
endmodule



/* EX/MEM pipeline registers */ 
module ex_mem (clk, data_in, data_out);
	input			clk;
	input [154:0]		data_in;
	output reg[154:0]	data_out;

	/*
	 *	The `initial` statement below uses Yosys's support for nonzero
	 *	initial values:
	 *
	 *		https://github.com/YosysHQ/yosys/commit/0793f1b196df536975a044a4ce53025c81d00c7f
	 *
	 *	Rather than using this simulation construct (`initial`),
	 *	the design should instead use a reset signal going to
	 *	modules in the design and to thereby set the values.
	 */
	initial begin
		data_out = 155'b0;
	end

	always @(posedge clk) begin
		data_out <= data_in;
	end
endmodule



/* MEM/WB pipeline registers */ 
module mem_wb (clk, data_in, data_out);
	input			clk;
	input [116:0]		data_in;
	output reg[116:0]	data_out;

	/*
	 *	The `initial` statement below uses Yosys's support for nonzero
	 *	initial values:
	 *
	 *		https://github.com/YosysHQ/yosys/commit/0793f1b196df536975a044a4ce53025c81d00c7f
	 *
	 *	Rather than using this simulation construct (`initial`),
	 *	the design should instead use a reset signal going to
	 *	modules in the design and to thereby set the values.
	 */
	initial begin
		data_out = 117'b0;
	end

	always @(posedge clk) begin
		data_out <= data_in;
	end
endmodule
