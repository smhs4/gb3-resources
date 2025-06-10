module top(
    led_out
);

    output      led_out;                //blinky led_out
    wire       reset;

    wire source_clock;
    wire core_clock;

    wire [31:0] core_data_out;
    wire [31:0] core_data_in;
    wire [31:0] instruction_mem_to_core;

    wire [31:0] instruction_address;
    wire [31:0] data_address;

    wire        data_write_enable;
    wire        data_read_enable;
    wire [2:0]  data_mode;

    reg [2:0] reset_counter;

    initial begin
        reset_counter = 3'b111;
    end

    wire locked;

	SB_HFOSC #(.CLKHF_DIV("0b10")) OSCInst0 (
		.CLKHFEN(1'b1),
		.CLKHFPU(1'b1),
		.CLKHF(source_clock)
	);

    pll pll(
        .clock_in(source_clock),
        .clock_out(core_clock),
        .locked(locked)
    );

    /*
     * The craziest clock system you will ever see

     * core_clock:      ___/‾‾‾‾‾‾‾‾‾\_________/‾‾‾‾‾‾‾‾‾\_________/‾‾...
     * uncore_clock:    _/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾...
     */
    
    // always @(posedge uncore_clock) begin
    //     core_clock <= ~core_clock;
    // end

    always @(posedge core_clock) begin
        if (reset_counter[2]) reset_counter <=reset_counter-1;
    end

    assign reset = reset_counter[2] | (~locked);

    cpu_core cpu(
        .core_clock(core_clock),
        .core_reset(reset),
        .instruction_address(instruction_address),
        .instruction_in(instruction_mem_to_core),
        .data_address(data_address),
        .data_out(core_data_out),
        .data_in(core_data_in),
        .data_mode(data_mode),
        .data_write_enable(data_write_enable),
        .data_read_enable(data_read_enable)
    );

    instruction_memory instruction_memory(
        .clock(core_clock),
        .addr(instruction_address[9:0]),
        .out(instruction_mem_to_core)
    );

    data_memory data_memory(
        .clock(core_clock),
        .write_enable(data_write_enable),
        .mode(data_mode),
        .address(data_address[11:0]),
        .data_in(core_data_out),
        .data_out(core_data_in)
    );

    wire led_select = data_address[13];

    /*
     * LED module
     */
    reg         led_reg;
    always @(negedge core_clock) begin
        if(data_write_enable && led_select) begin
            led_reg <= core_data_out[0];
        end
    end

    assign led_out = led_reg;// & (&led_counter);
endmodule