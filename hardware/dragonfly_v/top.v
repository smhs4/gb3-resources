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
    reg core_clock;
    wire uncore_clock;

    wire [31:0] core_data_out;
    wire [31:0] core_data_in;
    wire [31:0] instruction_mem_to_core;

    wire [31:0] instruction_address;
    wire [31:0] data_address;

    wire        data_write_enable;
    wire        data_read_enable;
    wire [2:0]  data_mode;

    reg [2:0] reset_counter;
    reg [2:0] led_counter;

    reg [2:0] core_reset_counter;

    initial begin
        reset_counter = 3'b111;
        core_reset_counter = 3'b000;
    end

    always @(posedge core_clock) begin
        led_counter <= led_counter+1;
        if (reset_counter[2]) reset_counter <=reset_counter-1;
    end

    wire locked;

    assign reset = reset_counter[2] | (~locked);

`ifdef NO_PLL
	SB_HFOSC #(.CLKHF_DIV("0b11")) OSCInst0 (
		.CLKHFEN(1'b1),
		.CLKHFPU(1'b1),
		.CLKHF(uncore_clock)
	);

    assign locked = 1'b1;
`else
	SB_HFOSC #(.CLKHF_DIV("0b10")) OSCInst0 (
		.CLKHFEN(1'b1),
		.CLKHFPU(1'b1),
		.CLKHF(source_clock)
	);

    pll pll(
        .clock_in(source_clock),
        .clock_out(uncore_clock),
        .locked(locked)
    );
`endif
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
        .data_out(core_data_out),
        .data_in(core_data_in),
        .data_mode(data_mode),
        .data_write_enable(data_write_enable),
        .data_read_enable(data_read_enable)
    );

    wire io_select = data_address[13];
    wire [31:0] mem_data_out;
    wire [31:0] instruction_memory_out;

    wire [31:0] data_instruction_out;
    reg  [31:0] data_instruction_reg;

    initial begin
        data_instruction_reg <= 32'b0;
        instruction_source <=1'b0;
    end

    always @(negedge core_clock) begin
        data_instruction_reg <= mem_data_out;
    end

    assign data_instruction_out = core_clock ? mem_data_out : data_instruction_reg;

    reg instruction_source;
    always @(posedge core_clock) begin
        instruction_source <= instruction_address[12];
    end

    assign instruction_mem_to_core = instruction_memory_out;

    instruction_memory instruction_memory(
        .clock(core_clock),
        .reset(reset),
        .addr(instruction_address),
        .out(instruction_memory_out)
    );


    data_memory data_memory(
        .core_clock(core_clock),
        .clock(uncore_clock),
        .select(~io_select),            //memory occupies even half of every 16KiB (0-8191, 16384-24575, etc.) within each 8K memory chunk two repeats of 4K memory exists
        .write_enable(data_write_enable & core_clock),
        .read_enable(data_read_enable),
        .mode(data_mode),
        .address({(core_clock ? data_address[11:2] : instruction_address[11:2]),data_address[1:0]}),
        .data_in(core_data_out),
        .data_out(mem_data_out)
    );

    wire led_select = io_select & (~data_address[2]);   //address 0x2000
    wire uart_select = io_select & (data_address[2]);   //address 0x2004

`ifdef USE_UART
    wire [7:0] uart_data_out;

    uart uart(
        .core_clock(core_clock),
        .source_clock(source_clock),
        .write_enable(data_write_enable),
        .read_enable(data_read_enable),
        .select(uart_select),
        .address(data_address[1:0]),
        .data_in(core_data_out[7:0]),
        .data_out(uart_data_out),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx)
    );

    assign core_data_in = io_select ? {24'b0,uart_data_out} : mem_data_out; //uart occupies the entire io space
`else
    assign core_data_in = mem_data_out;
    assign uart_tx = 1'b0;
`endif

    /*
     * LED module
     */
    reg         led_reg;
    always @(negedge core_clock) begin
        if(data_write_enable && led_select) begin
            led_reg <= core_data_out[0];
        end
    end

    assign led_out = led_reg & (&led_counter);
endmodule