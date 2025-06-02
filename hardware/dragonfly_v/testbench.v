`timescale 10ns/1ns


module testbench();
    wire      led;                //blinky led
    reg       reset;

    wire           uart_rx = 1'b0;        //uart receive into fpga from bluetooth/FT2232
    wire          uart_tx;        //uart transmit out from fpga to bluetooth/FT2232

    reg source_clock;
    reg core_clock;
    wire uncore_clock;

    wire [31:0] data_core_to_mem;
    wire [31:0] data_mem_to_core;
    wire [31:0] instruction_mem_to_core;

    wire [31:0] instruction_address;
    wire [31:0] data_address;

    wire        data_write_enable;
    wire [2:0]  data_mode;


    reg [31:0] cpu_clk_counter;
	reg [31:0] clk_counter;
	reg [10:0] capture_counter;

	initial begin
		$dumpoff;
		$dumpfile ("proc_sim.vcd");
		$dumpvars;
        core_clock <=0;
		source_clock <= 0;
		cpu_clk_counter <= 0;
		capture_counter <= 10;
		clk_counter <=0;
        reset <= 1'b1;
        #10
        reset <= 1'b0;
	end
	wire forcehalt;
	wire dump_start;

	assign forcehalt = (cpu_clk_counter > 32'h80) | (clk_counter > 32'h100);
	assign dump_start = clk_counter > 1;

	// wire program_halt = |inst_in[31:20];
	always @(posedge source_clock) begin
		clk_counter <= clk_counter+1;
	end
	always @(posedge core_clock) begin
		cpu_clk_counter <= cpu_clk_counter+1;
		if (led) begin
			capture_counter <= capture_counter+1;
		end
	end
	always @(posedge dump_start or posedge led) begin
		$dumpon;
	end
	always @(posedge forcehalt or posedge capture_counter[5]) begin
		$finish;
	end

	always
	#1 source_clock = ~source_clock;
	// SB_HFOSC #(.CLKHF_DIV("0b11")) OSCInst0 (
	// 	.CLKHFEN(1'b1),
	// 	.CLKHFPU(1'b1),
	// 	.CLKHF(source_clock)
	// );

    assign uncore_clock = source_clock;

    /*
     * The craziest clock system you will ever see

     * core_clock:      ___/‾‾‾‾‾‾‾‾‾\_________/‾‾‾‾‾‾‾‾‾\_________/‾‾...
     * uncore_clock:    _/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾...
     */

    always @(posedge uncore_clock) begin
        core_clock = ~core_clock;
    end

    cpu_core cpu(
        .core_clock(core_clock),
        .core_reset(reset),
        .instruction_address(instruction_address),
        .instruction_in(instruction_mem_to_core),
        .data_address(data_address),
        .data_out(data_core_to_mem),
        .data_in(data_mem_to_core),
        .data_mode(data_mode),
        .data_write_enable(data_write_enable)
    );

    instruction_memory instruction_memory(
        .clock(core_clock),
        .addr(instruction_address),
        .out(instruction_mem_to_core)
    );

    data_memory data_memory(
        .clock(core_clock),
        .address(data_address),
        .data_in(data_core_to_mem),
        .data_out(data_mem_to_core),
        .write_enable(data_write_enable),
        .mode(data_mode),
        .led(led),
        .uart_tx(uart_tx)
    );
endmodule