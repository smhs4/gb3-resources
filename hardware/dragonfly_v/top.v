module top(
    led,
    uart_rx,
    uart_tx,
    reset
);

    output      led;                //blinky led
    input       reset;

    input           uart_rx;        //uart receive into fpga from bluetooth/FT2232
    output          uart_tx;        //uart transmit out from fpga to bluetooth/FT2232

    wire source_clock;
    wire core_clock;
    wire uncore_clock;

    wire [31:0] data_core_to_mem;
    wire [31:0] data_mem_to_core;
    wire [31:0] instruction_mem_to_core;

    wire [31:0] instruction_address;
    wire [31:0] data_address;

    wire        data_write_enable;
    wire [2:0]  data_mode;

	SB_HFOSC #(.CLKHF_DIV("0b11")) OSCInst0 (
		.CLKHFEN(1'b1),
		.CLKHFPU(1'b1),
		.CLKHF(source_clock)
	);

    assign uncore_clock = source_clock;
    assign core_clock = source_clock;
    /*
     * The craziest clock system you will ever see

     * core_clock:      ___/‾‾‾‾‾‾‾‾‾\_________/‾‾‾‾‾‾‾‾‾\_________/‾‾...
     * uncore_clock:    _/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾...
     */

    // always @(posedge uncore_clock) begin
    //     core_clock = ~core_clock;
    // end

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
        .reset(reset),
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