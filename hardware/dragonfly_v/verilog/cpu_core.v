module cpu_core(
    core_clock,
	core_reset,
    instruction_address,
    instruction_in,
    data_address,
    data_out,
    data_in,
    data_mode,
    data_write_enable
);

    input           core_clock;      //input clock
	input			core_reset;		//core_reset input (active high)

    output	[31:0]	instruction_address;
    input   [31:0]	instruction_in;

	output	[31:0]	data_address;
	output	[31:0]	data_out;
	input	[31:0]	data_in;
	output	[2:0]	data_mode;	//note sign extension is done internally, TODO discuss with memory designer for best place to put sign extension
	output			data_write_enable;	//data memory write enable  (active high)

    wire    [31:0]  id_pc;
    wire    [31:0]  id_jump_offset;
    wire    [31:0]  the_road_not_taken;
    wire    [31:0]  flush_target_pc = ex_is_jalr ? data_address : the_road_not_taken;
    wire    [31:0]  id_next_pc = id_pc + 4;
    wire    [31:0]  id_target_pc = id_is_jump ? id_jump_target : id_next_pc;
    wire    [31:0]  id_jump_target = id_pc + id_jump_offset;
    assign instruction_address = ex_flush ?  flush_target_pc : id_target_pc;

    d_flip_flop alternative_pc (
        .clock(core_clock),
        .reset(core_reset),
        .in(id_is_jump ? id_next_pc : id_jump_target),
        .out(the_road_not_taken)
    );

    wire [31:0] pc_adder_out = 32'b100 + if_pc;

    d_flip_flop program_counter(
        .clock(core_clock),
        .reset(core_reset),
        .in(instruction_address),
        .out(id_pc)
    );

    wire [31:0] id_instruction = instruction_in;
    wire [4:0]  id_rs1 = id_instruction[19:15];
    wire [4:0]  id_rs2 = id_instruction[24:20];
    wire [6:0]  id_opcode = id_instruction[6:0];
    wire [2:0]  id_funct3 = id_instruction[14:12];
    
    d_flip_flop #(.WIDTH(1)) id_ex_data_mode_reg(
        .clock(core_clock),
        .reset(reset),
        .in(id_funct3),
        .out(data_mode)
    );

    regfile id_integer_registers(
        .clock(core_clock),
        .write(ex_write),
        .rd_addr(ex_rd),
        .rd_data(ex_result),
        .rs1_addr(id_rs1),
        .rs1_data(ex_rs1_data),
        .rs2_addr(id_rs2),
        .rs2_data(ex_rs2_data)
    );

    imm_gen id_immediate_generator(//TODO
        .inst(id_instruction),
        .id_jump_offset(id_jump_offset)
    );

    wire ex_is_ld;
    wire ex_is_pc_instruction;          //PC into ALU: AUIPC(00101), JAL(11011), JALR(11001)
    wire ex_is_imm_instruction;         //IMM into ALU: ALU-imm arithmetic(00100), LUI(01101), AUIPC(00101), JAL(11011), JALR(11001)
    wire ex_is_branch;
    wire ex_is_jalr;
    wire id_is_jal;
    wire id_is_branch;
    wire id_mux_next_pc;

    control id_control_unit(
        .clock(core_clock),
        .opcode(id_opcode),
        .data_mem_write(data_write_enable),
        .data_mem_read(ex_is_ld),
        .ALUSrc(ex_is_imm_instruction),
        .Branch(ex_is_branch),
        .Jalr(ex_is_jalr),
        .Jal(id_is_jal),
        .id_branch(id_is_branch),
        .ex_is_pc(ex_is_pc_instruction),
        .Jump(id_mux_next_pc)
    );

    wire [6:0] ex_alu_control;
    ALUControl id_alu_controller(
        .clock(core_clock),
        .reset(core_reset),
        .FuncCode({id_instruction[30],id_funct3}),
        .Opcode(id_opcode),
        .ALUCtl(ex_alu_control)
    );

    wire id_is_jump = id_is_jal | (id_is_branch & id_should_branch);

    wire id_should_branch = id_instruction[31];
    wire ex_should_branch;
    
    d_flip_flop #(.WIDTH(1)) id_ex_branch_reg (
        .clock(core_clock),
        .reset(core_reset),
        .in(id_should_branch),
        .out(ex_should_branch)
    );
    wire ex_flush = ex_is_jalr | (ex_is_branch & (ex_should_branch ^ ex_branch_enable));         //if instruction is jalr, then always flush, otherwise ..
                                                                                //flush if branch enable is different from expected

    d_flip_flop id_ex_pc_reg(
        .clock(core_clock),
        .reset(core_reset),
        .in((id_mux_next_pc) ? id_next_pc : id_pc),
        .out(ex_pc)
    );

    wire [31:0]     ex_alu_A = ex_is_pc_instruction ? ex_pc : ex_rs1_data;
    wire [31:0]     ex_alu_B = ex_is_imm_instruction ? ex_imm : ex_rs2_data;
    wire [31:0]     ex_alu_result;
    wire            ex_branch_enable;

    alu alu(
        .ALUCtl(ex_alu_control),
        .A(ex_alu_A),
        .B(ex_alu_B),
        .alu_result(ex_alu_result),
        .branch_enable(ex_branch_enable)
    );

    wire [31:0] ex_result = ex_is_ld ? data_in : ex_alu_result;

    assign data_address = ex_imm + ex_rs1_data;
    assign data_out = ex_rs2_data;


endmodule