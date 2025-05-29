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


