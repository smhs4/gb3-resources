module top(
    led_out,
    uart_rx,
    uart_tx,
    // reset
);

    output      led_out;                //blinky led_out
    wire       reset;

    input           uart_rx;        //uart receive into fpga from bluetooth/FT2232
    output          uart_tx;        //uart transmit out from fpga to bluetooth/FT2232

    wire source_clock;
    wire core_clock;
    // wire uncore_clock;

    wire [31:0] data_core_to_mem;
    wire [31:0] data_mem_to_core;
    wire [31:0] instruction_mem_to_core;

    wire [31:0] instruction_address;
    wire [31:0] data_address;

    wire        data_write_enable;
    wire        data_read_enable;
    wire [2:0]  data_mode;

    reg [2:0] reset_counter;
    reg [2:0] led_counter;

    initial begin
        reset_counter = 3'b111;
    end

    always @(posedge core_clock) begin
        led_counter <= led_counter+1;
        if (reset_counter[2]) reset_counter <=reset_counter-1;
    end

    wire locked;

    assign reset = reset_counter[2] | (~locked);

	SB_HFOSC #(.CLKHF_DIV("0b00")) OSCInst0 (
		.CLKHFEN(1'b1),
		.CLKHFPU(1'b1),
		.CLKHF(source_clock)
	);

    pll pll(
        .clock_in(source_clock),
        .clock_out(core_clock),
        .locked(locked)
    );
	// SB_PLL40_CORE #(
    //     .FEEDBACK_PATH("SIMPLE"),
    //     .DIVR(4'b0010),
    //     .DIVF(7'b0100111),
    //     .DIVQ(3'b101),
    //     .FILTER_RANGE(3'b001),
    //     .PLLOUT_SELECT("GENCLK"),  // use PLLOUTCORE
    //     .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
    //     .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
    //     .FDA_FEEDBACK(4'b0000),
    //     .FDA_RELATIVE(4'b0000),
    //     .SHIFTREG_DIV_MODE(1'b0)
    // ) pll_inst (
    //     .REFERENCECLK(source_clock),     // 48 MHz input
    //     .PLLOUTCORE(core_clock),      // 20 MHz output
    //     .RESETB(1'b1),           // keep high when not resetting
    //     .BYPASS(1'b0),
    //     .LOCK(locked)              // goes high when PLL is locked
    // );
    // assign uncore_clock = source_clock;
    // assign core_clock = source_clock;
    /*
     * The craziest clock system you will ever see

     * core_clock:      ___/‾‾‾‾‾‾‾‾‾\_________/‾‾‾‾‾‾‾‾‾\_________/‾‾...
     * uncore_clock:    _/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾...
     */

    // always @(posedge uncore_clock) begin
    //     core_clock = ~core_clock;
    // end

    assign uart_tx = core_clock;

    cpu_core cpu(
        .core_clock(core_clock),
        .core_reset(reset),
        .instruction_address(instruction_address),
        .instruction_in(instruction_mem_to_core),
        .data_address(data_address),
        .data_out(data_core_to_mem),
        .data_in(data_mem_to_core),
        .data_mode(data_mode),
        .data_write_enable(data_write_enable),
        .data_read_enable(data_read_enable)
    );

    instruction_memory instruction_memory(
        .clock(core_clock),
        .reset(reset),
        .addr(instruction_address),
        .out(instruction_mem_to_core)
    );

    wire [31:0] io_address;
    wire [31:0] io_data;
    wire        io_write_enable;
    reg         io_led;

    data_memory data_memory(
        .clock(core_clock),
        .address(data_address),
        .data_in(data_core_to_mem),
        .data_out(data_mem_to_core),
        .write_enable(data_write_enable),
        .read_enable(data_read_enable),
        .mode(data_mode),
        .addr_reg(io_address),
        .write_data_reg(io_data),
        .write_enable_reg(io_write_enable)
    );

    always @(posedge core_clock) begin
        if(io_write_enable == 1'b1 && io_address == 32'h2000) begin
            io_led <= io_data[0];
        end
    end

    assign led_out = io_led & (&led_counter);

    // uart uart(
    //     .core_clock(core_clock),
    //     .address(io_address),
    //     .data_in(io_data[7:0]),
    //     .write_enable(io_write_enable),
    //     .source_clock(source_clock),
    //     .data_out(),
    //     .uart_rx(uart_rx),
    //     .uart_tx(uart_tx)
    // );

endmodule