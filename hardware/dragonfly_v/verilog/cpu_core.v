module cpu_core(
    input           core_clock,     //input clock
	input			core_reset,		//core_reset input (active high)

	output	[31:0]	instruction_address,
	input   [31:0]	instruction_in,

	output	[31:0]	data_address,
	output	[31:0]	data_out,
	input	[31:0]	data_in,
	output	[2:0]	data_mode,	        //note sign extension is done externally
	output			data_write_enable,	//data memory write enable  (active high)
    output          data_read_enable
);



    wire    [31:0]  id_pc;
    wire    [31:0]  id_jump_offset;
    wire    [31:0]  the_road_not_taken;
    wire    [31:0]  flush_target_pc = ex_is_jalr ? data_address : the_road_not_taken;
`ifdef USE_DSP
    wire    [31:0]  id_next_pc;
    DSPAdd pc_adder(
            .input1(id_pc),
            .input2(32'h4),
            .out(id_next_pc)
        );
`else
    wire    [31:0]  id_next_pc = id_pc + 4;
`endif
    wire    [31:0]  id_target_pc = id_is_jump ? id_jump_target : id_next_pc;
`ifdef USE_DSP
    wire    [31:0]  id_jump_target;
    DSPAdd pc_adder_2(
            .input1(id_pc),
            .input2(id_jump_offset),
            .out(id_jump_target)
        );
`else
    wire    [31:0]  id_jump_target = id_pc + id_jump_offset;
`endif
    assign instruction_address = ex_flush ?  flush_target_pc : id_target_pc;





    wire ex_is_pc_instruction;          //PC into ALU: AUIPC(00101), JAL(11011), JALR(11001)
    wire ex_is_imm_instruction;         //IMM into ALU: ALU-imm arithmetic(00100), LUI(01101), AUIPC(00101), JAL(11011), JALR(11001)
    wire ex_is_branch;
    wire ex_is_jalr;
    wire id_is_jal;
    wire id_is_branch;
    wire id_mux_next_pc;






    wire [31:0] id_instruction;
    // always @(posedge core_clock) begin
    assign    id_instruction = instruction_in;
    // end
    wire [4:0]  id_rs1 = id_instruction[19:15];
    wire [4:0]  id_rs2 = id_instruction[24:20];
    wire [4:0]  id_rd  = id_instruction[11:7];
    wire [6:0]  id_opcode = id_instruction[6:0];
    wire [2:0]  id_funct3 = id_instruction[14:12];




    wire ex_reg_write;
    wire [31:0] ex_rs1_data;
    wire [31:0] ex_rs2_data;


    wire [4:0] ex_rd;


    wire [31:0] ex_imm;


    wire [1:0]	ex_alu_arithmetic_select;
	wire [1:0]	ex_alu_shift_select;
	wire [1:0]	ex_alu_logic_select;

	wire 		ex_alu_passthrough_a;
	wire 		ex_alu_is_eq_compare;
	wire 		ex_alu_invert_branch_condition;
	wire 		ex_alu_is_signed_compare;


    wire id_is_jump = id_is_jal | (id_is_branch & id_should_branch);

    wire id_should_branch = id_instruction[31];
    wire ex_should_branch;



    wire ex_flush = ex_is_jalr | (ex_is_branch & (ex_should_branch ^ ex_branch_enable));         //if instruction is jalr, then always flush, otherwise ..
                                                                                //flush if branch enable is different from expected

    wire [31:0] ex_pc;
`ifdef SIMULATION
    reg [31:0] mispredict_counter;
    initial begin
        mispredict_counter = 0;
    end

    always @(posedge core_clock) begin
        if (ex_is_branch & (ex_should_branch ^ ex_branch_enable)) begin
            mispredict_counter = mispredict_counter+1;
        end
    end
`endif

    wire [31:0]     ex_alu_A = ex_is_pc_instruction ? ex_pc : ex_rs1_data;
    wire [31:0]     ex_alu_B = ex_is_imm_instruction ? ex_imm : ex_rs2_data;
    wire [31:0]     ex_alu_result;
    wire            ex_branch_enable;

    wire [31:0] ex_result = data_read_enable ? data_in : ex_alu_result;


    d_flip_flop alternative_pc (
        .clock(core_clock),
        .reset(core_reset),
        .in(id_is_jump ? id_next_pc : id_jump_target),
        .out(the_road_not_taken)
    );

    d_flip_flop program_counter(
        .clock(core_clock),
        .reset(core_reset),
        .in(instruction_address),
        .out(id_pc)
    );

    
    d_flip_flop #(.WIDTH(3)) id_ex_data_mode_reg(
        .clock(core_clock),
        .reset(core_reset),
        .in(id_funct3),
        .out(data_mode)
    );


    d_flip_flop #(.WIDTH(5)) id_ex_rd_reg(
        .clock(core_clock),
        .reset(core_reset),
        .in(id_rd),
        .out(ex_rd)
    );



    regfile id_integer_registers(
        .clk(core_clock),
        .write(ex_reg_write),
        .rd_addr(ex_rd),
        .rd_data(ex_result),
        .rs1_addr(id_rs1),
        .rs1_data(ex_rs1_data),
        .rs2_addr(id_rs2),
        .rs2_data(ex_rs2_data)
    );


    imm_gen id_immediate_generator(
        .clock(core_clock),
        .reset(core_reset),
        .inst(id_instruction),
        .id_jump_offset(id_jump_offset),
        .ex_imm(ex_imm)
    );


    control id_control_unit(
        .clock(core_clock),
        .reset(core_reset),
        .opcode(id_opcode),
        .flush(ex_flush),
        .RegWrite(ex_reg_write),
        .data_mem_write(data_write_enable),
        .data_mem_read(data_read_enable),
        .ALUSrc(ex_is_imm_instruction),
        .Branch(ex_is_branch),
        .Jalr(ex_is_jalr),
        .Jal(id_is_jal),
        .id_branch(id_is_branch),
        .ex_is_pc(ex_is_pc_instruction),
        .Jump(id_mux_next_pc)
    );

    ALUControl id_alu_controller(
        .clock(core_clock),
        .reset(core_reset),
        .funct3(id_funct3),
        .is_variant(id_instruction[30]),
        .Opcode(id_opcode),
        .ex_alu_arithmetic_select(ex_alu_arithmetic_select),
        .ex_alu_shift_select(ex_alu_shift_select),
        .ex_alu_logic_select(ex_alu_logic_select),
        .ex_alu_passthrough_a(ex_alu_passthrough_a),
        .ex_alu_is_eq_compare(ex_alu_is_eq_compare),
        .ex_alu_invert_branch_condition(ex_alu_invert_branch_condition),
        .ex_alu_is_signed_compare(ex_alu_is_signed_compare)
    );


    
    d_flip_flop #(.WIDTH(1)) id_ex_branch_reg (
        .clock(core_clock),
        .reset(core_reset),
        .in(id_should_branch),
        .out(ex_should_branch)
    );

    d_flip_flop id_ex_pc_reg(
        .clock(core_clock),
        .reset(core_reset),
        .in((id_mux_next_pc) ? id_next_pc : id_pc),
        .out(ex_pc)
    );

    alu alu(
    	.arithmetic_select(ex_alu_arithmetic_select),
        .shift_select(ex_alu_shift_select), 
        .logic_select(ex_alu_logic_select),
        .passthrough_a(ex_alu_passthrough_a),
        .is_eq_compare(ex_alu_is_eq_compare),
        .invert_branch_condition(ex_alu_invert_branch_condition),
        .is_signed_compare(ex_alu_is_signed_compare),
        .A(ex_alu_A),
        .B(ex_alu_B),
        .alu_result(ex_alu_result),
        .branch_enable(ex_branch_enable)
    );

`ifdef USE_DSP          //doesn't work somehow
    DSPAdd mem_addr_adder(
            .input1(ex_imm),
            .input2(ex_rs1_data),
            .out(data_address)
        );
`else
    assign data_address = ex_imm + ex_rs1_data;
`endif
    assign data_out = ex_rs2_data;


endmodule