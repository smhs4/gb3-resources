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
 *	cpu top-level
 */



module cpu(
			clk,
			inst_mem_in,
			inst_mem_out,
			data_mem_out,
			data_mem_addr,
			data_mem_WrData,
			data_mem_memwrite,
			data_mem_memread,
			data_mem_sign_mask
		);
	/*
	 *	Input Clock
	 */
	input clk;

	/*
	 *	instruction memory input
	 */
	output [31:0]		inst_mem_in;
	input [31:0]		inst_mem_out;

	/*
	 *	Data Memory
	 */
	input [31:0]		data_mem_out;
	output [31:0]		data_mem_addr;
	output [31:0]		data_mem_WrData;
	output			data_mem_memwrite;
	output			data_mem_memread;
	output [3:0]		data_mem_sign_mask;

	/*
	 *	Program Counter
	 */
	wire [31:0]		pc_mux0;
	wire [31:0]		pc_in;
	wire [31:0]		pc_out;
	wire			pcsrc;
	wire [31:0]		if_inst_mux_out;
	wire [31:0]		fence_mux_out;

	/*
	 *	Pipeline Registers
	 */
	// wire [63:0]		if_id_out;
	wire [11:0]		id_ex_out;
	wire [154:0]		ex_mem_out;
	wire [116:0]		mem_wb_out;

	/*
	 *	Control signals
	 */
	wire			MemtoReg1;
	wire			RegWrite1;
	wire			MemWrite1;
	wire			MemRead1;
	wire			Branch1;
	wire			Jump1;
	wire			Jalr1;
	wire			ALUSrc1;
	wire			Lui1;
	wire			Auipc1;
	wire			Fence_signal;
	// wire			CSRR_signal;
	// wire			CSRRI_signal;



	wire [4:0] 		if_inst_rs1 = if_inst_mux_out[19:15];
	wire [4:0] 		if_inst_rs2 = if_inst_mux_out[24:20];
	// wire [11:0] 	if_rdcsr_addr = if_inst_mux_out[31:20];

	/*
	 *	Decode stage
	 */
	wire [10:0]		cont_mux_out; //control signal mux
	wire [31:0]		regA_out;
	wire [31:0]		regB_out;
	wire [31:0]		id_imm_out;
	wire [31:0]		RegA_mux_out;
	wire [31:0]		RegB_mux_out;
	wire [4:0]		RegA_AddrFwdFlush_mux_out;
	wire [4:0]		RegB_AddrFwdFlush_mux_out;
	// wire [31:0]		rdValOut_CSR;
	wire [3:0]		id_dataMem_sign_mask;

	wire [31:0] 	id_pc;
	wire [31:0] 	id_inst;

	wire [11:0] 	id_inst_imm = id_inst[31:20];
	wire [4:0] 		id_instruction_rs2 = id_inst[24:20];
	wire [4:0] 		id_instruction_rs1 = id_inst[19:15];
	wire [4:0]		id_inst_rd = id_inst[11:7];
	wire [6:0] 		id_opcode = id_inst[6:0];

	/*
	 *	Execute stage
	 */
	wire [8:0]		ex_cont_mux_out;
	wire [31:0]		ex_addr_adder_mux_out;
	wire [31:0]		ex_alu_mux_out;
	wire [31:0]		ex_addr_adder_sum;
	wire [6:0]		id_alu_ctl;
	wire			ex_alu_branch_enable;
	wire [31:0]		ex_alu_result;
	wire [31:0]		ex_lui_result;

	wire [4:0]		ex_RegA_AddrFwdFlush_mux_out;
	wire [4:0]		ex_RegB_AddrFwdFlush_mux_out;

	/*
	 *	Memory access stage
	 */
	wire [31:0]		auipc_mux_out;
	wire [31:0]		mem_csrr_mux_out;

	/*
	 *	Writeback to registers stage
	 */
	wire [31:0]		wb_mux_out;
	wire [31:0]		reg_dat_mux_out;

	/*
	 *	Forwarding multiplexer wires
	 */
	wire [31:0]		dataMemOut_fwd_mux_out;
	wire [31:0]		mem_fwd1_mux_out;
	wire [31:0]		mem_fwd2_mux_out;
	wire [31:0]		wb_fwd1_mux_out;
	wire [31:0]		wb_fwd2_mux_out;
	wire			mfwd1;
	wire			mfwd2;
	wire			wfwd1;
	wire			wfwd2;

	/*
	 *	Branch Predictor
	 */
	wire [31:0]		pc_adder_out;
	wire [31:0]		branch_predictor_addr;
	wire			predict;
	wire [31:0]		branch_predictor_mux_out;
	wire			actual_branch_decision;
	wire			mistake_trigger;
	wire			decode_ctrl_mux_sel;
	wire			inst_mux_sel;
	wire[31:0] mem_regwb_mux_out; //TODO copy of wb_mux but in mem stage, move back and cleanup

	/*
	 *	Instruction Fetch Stage
	 */
	// mux2to1 pc_mux(
	// 		.input0(pc_mux0),
	// 		.input1(ex_mem_out[72:41]),
	// 		.select(pcsrc),
	// 		.out(pc_in)
	// 	);
	assign pc_in = pcsrc ? ex_mem_out[72:41] : pc_mux0;

	// adder pc_adder(
	// 		.input1(32'b100),
	// 		.input2(pc_out),
	// 		.out(pc_adder_out)
	// 	);
	assign pc_adder_out = 32'b100 + pc_out;

	program_counter pc_latch(
			.inAddr(pc_in),
			.outAddr(pc_out),
			.clk(clk)
		);

	// mux2to1 inst_mux(
	// 		.input0(inst_mem_out),
	// 		.input1(32'b0),
	// 		.select(inst_mux_sel),
	// 		.out(if_inst_mux_out)
	// 	);
	assign if_inst_mux_out = inst_mux_sel ? 32'b0 : inst_mem_out;


	// mux2to1 fence_mux(
	// 		.input0(pc_adder_out),
	// 		.input1(pc_out),
	// 		.select(Fence_signal),
	// 		.out(fence_mux_out)
	// 	);
	assign fence_mux_out = Fence_signal ? pc_out : pc_adder_out;

	/*
	 *	IF/ID Pipeline Register
	 */
	if_id if_id_reg(
			.clk(clk),
			.if_inst(if_inst_mux_out),
			.if_pc(pc_out),
			.id_inst(id_inst),
			.id_pc(id_pc)
		);

	/*
	 *	Decode Stage
	 */
	control id_control_unit(
			.opcode(id_opcode),
			.MemtoReg(MemtoReg1),
			.RegWrite(RegWrite1),
			.MemWrite(MemWrite1),
			.MemRead(MemRead1),
			.Branch(Branch1),
			.ALUSrc(ALUSrc1),
			.Jump(Jump1),
			.Jalr(Jalr1),
			.Lui(Lui1),
			.Auipc(Auipc1),
			.Fence(Fence_signal)
			// .CSRR()
		);

	// mux2to1 id_cont_mux(
	// 		.input0({21'b0, Jalr1, ALUSrc1, Lui1, Auipc1, Branch1, MemRead1, MemWrite1, CSRR_signal, RegWrite1, MemtoReg1, Jump1}),
	// 		.input1(32'b0),
	// 		.select(decode_ctrl_mux_sel),
	// 		.out(cont_mux_out)
	// 	);
	assign cont_mux_out = decode_ctrl_mux_sel ? 11'b0 : {Jalr1, ALUSrc1, Lui1, Auipc1, Branch1, MemRead1, MemWrite1, 1'b0, RegWrite1, MemtoReg1, Jump1};

	regfile id_register_files(
			.clk(clk),
			.write(ex_mem_out[2]),
			.wrAddr(ex_mem_out[142:138]),
			.wrData(reg_dat_mux_out),
			.rdAddrA(if_inst_rs1),
			.rdDataA(regA_out),
			.rdAddrB(if_inst_rs2),
			.rdDataB(regB_out)
		);

	imm_gen id_immediate_generator(
			.inst(id_inst),
			.imm(id_imm_out)
		);

	ALUControl id_alu_control(
			.Opcode(id_opcode),
			.FuncCode({id_inst[30], id_inst[14:12]}),
			.ALUCtl(id_alu_ctl)
		);

	sign_mask_gen id_sign_mask_gen_inst(
			.func3(id_inst[14:12]),
			.sign_mask(id_dataMem_sign_mask)
		);

	// csr_file ControlAndStatus_registers(
	// 		.clk(clk),
	// 		.write(mem_wb_out[3]), //TODO
	// 		.wrAddr_CSR(mem_wb_out[116:105]),
	// 		.wrVal_CSR(mem_wb_out[35:4]),
	// 		.rdAddr_CSR(if_rdcsr_addr),
	// 		.rdVal_CSR(rdValOut_CSR)
	// 	);
	// assign rdValOut_CSR = 32'b0;

	// mux2to1 RegA_mux(
	// 		.input0(regA_out),
	// 		.input1({27'b0, id_instruction_rs1}),
	// 		.select(CSRRI_signal),
	// 		.out(RegA_mux_out)
	// 	);
	assign RegA_mux_out = regA_out;

	// mux2to1 RegB_mux(
	// 		.input0(regB_out),
	// 		.input1(rdValOut_CSR),
	// 		.select(CSRR_signal),
	// 		.out(RegB_mux_out)
	// 	);
	assign RegB_mux_out = regB_out;

	// mux2to1 RegA_AddrFwdFlush_mux( //TODO cleanup
	// 		.input0({27'b0, id_instruction_rs1}),
	// 		.input1(32'b0),
	// 		.select(CSRRI_signal),
	// 		.out(RegA_AddrFwdFlush_mux_out)
	// 	);
	// assign RegA_AddrFwdFlush_mux_out = CSRRI_signal ? 5'b0 : id_instruction_rs1;
	assign RegA_AddrFwdFlush_mux_out = id_instruction_rs1;

	// mux2to1 RegB_AddrFwdFlush_mux( //TODO cleanup
	// 		.input0({27'b0, id_instruction_rs2}),
	// 		.input1(32'b0),
	// 		.select(CSRR_signal),
	// 		.out(RegB_AddrFwdFlush_mux_out)
	// 	);
	// assign RegB_AddrFwdFlush_mux_out = CSRR_signal ? 5'b0 : id_instruction_rs2;
	assign RegB_AddrFwdFlush_mux_out = id_instruction_rs2;

	// assign CSRRI_signal = CSRR_signal & (id_inst[14]);
	// assign CSRRI_signal = 1'b0;

	wire [11:0] ex_inst_imm;
	wire [4:0]	ex_inst_rd;
	wire [3:0]	ex_dataMem_sign_mask;
	wire [6:0]	ex_alu_ctl;
	wire [31:0]	ex_imm;

	wire [31:0]	ex_RegB_mux_out;
	wire [31:0]	ex_RegA_mux_out;

	wire [31:0] ex_pc;

	//ID/EX Pipeline Register
	id_ex id_ex_reg(
			.clk(clk),
			.id_inst_imm(id_inst_imm),
			.id_RegB_AddrFwdFlush_mux_out(RegB_AddrFwdFlush_mux_out),
			.id_RegA_AddrFwdFlush_mux_out(RegA_AddrFwdFlush_mux_out),
			.id_inst_rd(id_inst_rd),
			.id_dataMem_sign_mask(id_dataMem_sign_mask),
			.id_alu_ctl(id_alu_ctl),
			.id_imm(id_imm_out),
			.id_RegB_mux_out(RegB_mux_out),
			.id_RegA_mux_out(RegA_mux_out),
			.id_pc(id_pc),
			.data_in({cont_mux_out[10:7], predict, cont_mux_out[6:0]}),
			.data_out(id_ex_out),
			.ex_inst_imm(ex_inst_imm),
			.ex_RegB_AddrFwdFlush_mux_out(ex_RegB_AddrFwdFlush_mux_out),
			.ex_RegA_AddrFwdFlush_mux_out(ex_RegA_AddrFwdFlush_mux_out),
			.ex_inst_rd(ex_inst_rd),
			.ex_dataMem_sign_mask(ex_dataMem_sign_mask),
			.ex_alu_ctl(ex_alu_ctl),
			.ex_imm(ex_imm),
			.ex_RegB_mux_out(ex_RegB_mux_out),
			.ex_RegA_mux_out(ex_RegA_mux_out),
			.ex_pc(ex_pc)
		);
	

	//Execute stage
	// mux2to1 ex_cont_mux(
	// 		.input0({23'b0, id_ex_out[8:0]}),
	// 		.input1(32'b0),
	// 		.select(pcsrc),
	// 		.out(ex_cont_mux_out)
	// 	);
	assign ex_cont_mux_out = pcsrc ? 12'b0 : id_ex_out;

	// mux2to1 ex_addr_adder_mux(
	// 		.input0(ex_pc),
	// 		.input1(wb_fwd1_mux_out),
	// 		.select(id_ex_out[11]),
	// 		.out(ex_addr_adder_mux_out)
	// 	);
	assign ex_addr_adder_mux_out = id_ex_out[11] ? wb_fwd1_mux_out : ex_pc;

	// adder ex_addr_adder(
	// 		.input1(ex_addr_adder_mux_out),
	// 		.input2(ex_imm),
	// 		.out(ex_addr_adder_sum)
	// 	);
	assign ex_addr_adder_sum = ex_addr_adder_mux_out + ex_imm;

	// mux2to1 ex_alu_mux(
	// 		.input0(wb_fwd2_mux_out),
	// 		.input1(ex_imm),
	// 		.select(id_ex_out[10]),
	// 		.out(ex_alu_mux_out)
	// 	);
	assign ex_alu_mux_out = id_ex_out[10] ? ex_imm : wb_fwd2_mux_out;

	alu ex_alu_main(
			.ALUctl(ex_alu_ctl),
			.A(wb_fwd1_mux_out),
			.B(ex_alu_mux_out),
			.ALUOut(ex_alu_result),
			.Branch_Enable(ex_alu_branch_enable),
			.mem_address(data_mem_addr)
		);

	// mux2to1 ex_lui_mux(
	// 		.input0(ex_alu_result),
	// 		.input1(ex_imm),
	// 		.select(id_ex_out[9]),
	// 		.out(ex_lui_result)
	// 	);
	assign ex_lui_result = ex_alu_result;

	//EX/MEM Pipeline Register
	ex_mem ex_mem_reg(
			.clk(clk),
			.data_in({ex_inst_imm, ex_inst_rd, wb_fwd2_mux_out, ex_lui_result, ex_alu_branch_enable, ex_addr_adder_sum, ex_pc, ex_cont_mux_out}),
			.data_out(ex_mem_out)
		);

	//Memory Access Stage
	branch_decision branch_decide(
			.Branch(ex_mem_out[6]),
			.Predicted(ex_mem_out[7]),
			.Branch_Enable(ex_mem_out[73]),
			.Jump(ex_mem_out[0]),
			.Mispredict(mistake_trigger),
			.Decision(actual_branch_decision),
			.Branch_Jump_Trigger(pcsrc)
		);

	// mux2to1 auipc_mux(
	// 		.input0(ex_mem_out[105:74]),
	// 		.input1(ex_mem_out[72:41]),
	// 		.select(ex_mem_out[8]),
	// 		.out(auipc_mux_out)
	// 	);
	assign auipc_mux_out = ex_mem_out[8] ? ex_mem_out[72:41] : ex_mem_out[105:74];

	// mux2to1 mem_csrr_mux(
	// 		.input0(auipc_mux_out),
	// 		.input1(ex_mem_out[137:106]),
	// 		.select(ex_mem_out[3]),
	// 		.out(mem_csrr_mux_out)
	// 	);
	assign mem_csrr_mux_out = auipc_mux_out;

	//MEM/WB Pipeline Register
	mem_wb mem_wb_reg(
			.clk(clk),
			.data_in({ex_mem_out[154:143], ex_mem_out[142:138], data_mem_out, mem_csrr_mux_out, ex_mem_out[105:74], ex_mem_out[3:0]}),
			.data_out(mem_wb_out)
		);

	//Writeback to Register Stage
	// mux2to1 wb_mux(
	// 		.input0(mem_wb_out[67:36]),
	// 		.input1(mem_wb_out[99:68]),
	// 		.select(mem_wb_out[1]),
	// 		.out(wb_mux_out)
	// 	);
	assign wb_mux_out = mem_wb_out[1] ? mem_wb_out[99:68] : mem_wb_out[67:36];

	// mux2to1 reg_dat_mux( //TODO cleanup
	// 		.input0(mem_regwb_mux_out),
	// 		.input1(ex_pc),
	// 		.select(ex_mem_out[0]),
	// 		.out(reg_dat_mux_out)
	// 	);
	assign reg_dat_mux_out = ex_mem_out[0] ? ex_pc : mem_regwb_mux_out;

	//Forwarding Unit
	ForwardingUnit forwarding_unit(
			.clk(clk),
			.rs1(RegA_AddrFwdFlush_mux_out),
			.rs2(RegB_AddrFwdFlush_mux_out),
			// .MEM_RegWriteAddr(ex_mem_out[142:138]),
			// .WB_RegWriteAddr(mem_wb_out[104:100]),
			// .MEM_RegWrite(ex_mem_out[2]),
			// .WB_RegWrite(mem_wb_out[2]),
			.MEM_RegWriteAddr(ex_inst_rd),
			.WB_RegWriteAddr(ex_mem_out[142:138]),
			.MEM_RegWrite(ex_cont_mux_out[2]),
			.WB_RegWrite(ex_mem_out[2]),
			// .EX_CSRR_Addr(ex_inst_imm),
			// .MEM_CSRR_Addr(ex_mem_out[154:143]),
			// .WB_CSRR_Addr(mem_wb_out[116:105]),
			// .MEM_CSRR(ex_mem_out[3]),
			// .WB_CSRR(mem_wb_out[3]),
			.MEM_fwd1(mfwd1),
			.MEM_fwd2(mfwd2),
			.WB_fwd1(wfwd1),
			.WB_fwd2(wfwd2)
		);

	// mux2to1 mem_fwd1_mux(
	// 		.input0(ex_RegA_mux_out),
	// 		.input1(dataMemOut_fwd_mux_out),
	// 		.select(mfwd1),
	// 		.out(mem_fwd1_mux_out)
	// 	);
	assign mem_fwd1_mux_out = mfwd1 ? dataMemOut_fwd_mux_out : ex_RegA_mux_out;

	// mux2to1 mem_fwd2_mux(
	// 		.input0(ex_RegB_mux_out),
	// 		.input1(dataMemOut_fwd_mux_out),
	// 		.select(mfwd2),
	// 		.out(mem_fwd2_mux_out)
	// 	);
	assign mem_fwd2_mux_out = mfwd2 ? dataMemOut_fwd_mux_out : ex_RegB_mux_out;

	// mux2to1 wb_fwd1_mux(
	// 		.input0(mem_fwd1_mux_out),
	// 		.input1(wb_mux_out),
	// 		.select(wfwd1),
	// 		.out(wb_fwd1_mux_out)
	// 	);
	assign wb_fwd1_mux_out = wfwd1 ? wb_mux_out : mem_fwd1_mux_out;

	// mux2to1 wb_fwd2_mux(
	// 		.input0(mem_fwd2_mux_out),
	// 		.input1(wb_mux_out),
	// 		.select(wfwd2),
	// 		.out(wb_fwd2_mux_out)
	// 	);
	assign wb_fwd2_mux_out = wfwd2 ? wb_mux_out : mem_fwd2_mux_out;

	// mux2to1 dataMemOut_fwd_mux(
	// 		.input0(ex_mem_out[105:74]),
	// 		.input1(data_mem_out),
	// 		.select(ex_mem_out[1]),
	// 		.out(dataMemOut_fwd_mux_out)
	// 	);
	assign dataMemOut_fwd_mux_out = ex_mem_out[1] ? data_mem_out : ex_mem_out[105:74];

	//Branch Predictor
	branch_predictor branch_predictor_FSM(
			.clk(clk),
			.actual_branch_decision(actual_branch_decision),
			.branch_decode_sig(cont_mux_out[6]),
			.branch_mem_sig(ex_mem_out[6]),
			.in_addr(id_pc),
			.offset(id_imm_out),
			.branch_addr(branch_predictor_addr),
			.prediction(predict)
		);

	// mux2to1 branch_predictor_mux(
	// 		.input0(fence_mux_out),
	// 		.input1(branch_predictor_addr),
	// 		.select(predict),
	// 		.out(branch_predictor_mux_out)
	// 	);
	assign branch_predictor_mux_out = predict ? branch_predictor_addr : fence_mux_out;

	// mux2to1 mistaken_branch_mux(
	// 		.input0(branch_predictor_mux_out),
	// 		.input1(ex_pc),
	// 		.select(mistake_trigger),
	// 		.out(pc_mux0)
	// 	);
	assign pc_mux0 = mistake_trigger ? ex_pc : branch_predictor_mux_out;

	//A copy of the writeback mux, but in MEM stage //TODO move back and cleanup
	// mux2to1 mem_regwb_mux(
	// 		.input0(mem_csrr_mux_out),
	// 		.input1(data_mem_out),
	// 		.select(ex_mem_out[1]),
	// 		.out(mem_regwb_mux_out)
	// 	);
	assign mem_regwb_mux_out = ex_mem_out[1] ? data_mem_out : mem_csrr_mux_out;

	//OR gate assignments, used for flushing
	assign decode_ctrl_mux_sel = pcsrc | mistake_trigger;
	assign inst_mux_sel = pcsrc | predict | mistake_trigger | Fence_signal;

	//Instruction Memory Connections
	assign inst_mem_in = pc_out;

	//Data Memory Connections
	// assign data_mem_addr = ex_lui_result;
	assign data_mem_WrData = wb_fwd2_mux_out;
	assign data_mem_memwrite = ex_cont_mux_out[4];
	assign data_mem_memread = ex_cont_mux_out[5];
	assign data_mem_sign_mask = ex_dataMem_sign_mask;
endmodule
