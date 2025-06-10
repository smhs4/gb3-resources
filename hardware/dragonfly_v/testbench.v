`timescale 1ns/1ns

module testbench();
    reg  [7:0]       led;            //blinky led
    wire        reset;

    wire        uart_rx = 1'b0; //uart receive into fpga from bluetooth/FT2232
    wire        uart_tx;        //uart transmit out from fpga to bluetooth/FT2232

    reg         source_clock;
    reg         core_clock;
    wire        uncore_clock;

    // Address and data buses
    wire [31:0] core_data_out;
    wire [31:0] core_data_in;
    wire [31:0] instruction_mem_to_core;
    wire [31:0] instruction_address;
    wire [31:0] data_address;
    wire        data_write_enable;
    wire        data_read_enable;
    wire [2:0]  data_mode;

    wire [31:0] io_address;
    wire [31:0] io_data;
    wire        io_write_enable;

	reg [31:0] clk_counter;
    reg [2:0] reset_counter;

	initial begin
		// $dumpoff;
		$dumpfile ("proc_sim.vcd");
		$dumpvars;
        core_clock <=0;
		source_clock <= 0;
		clk_counter <=0;
        reset_counter = 3'b111;
	end

    /*
     * The craziest clock system you will ever see

     * core_clock:      ___/‾‾‾‾‾‾‾‾‾\_________/‾‾‾‾‾‾‾‾‾\_________/‾‾...
     * uncore_clock:    _/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾...
     */
	always
	#1 source_clock = ~source_clock;

    always @(posedge uncore_clock) begin
        core_clock <= ~core_clock;
    end
    assign uncore_clock = source_clock;
    
	always @(posedge core_clock) begin
        if (reset_counter[2]) reset_counter <=reset_counter-1;
		clk_counter <= clk_counter+1;
        if (clk_counter > 32'h100) begin
            $finish;
        end
	end

    assign reset = reset_counter[2];

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
    wire [31:0] raw_data_out;

    wire [31:0] data_instruction_out;
    reg  [31:0] data_instruction_reg;

    initial begin
        data_instruction_reg <= 32'b0;
        instruction_source <=1'b0;
    end

    always @(posedge uncore_clock) begin
        if (core_clock == 1'b1) begin
            data_instruction_reg <= raw_data_out;
        end
    end

    assign data_instruction_out = core_clock ? raw_data_out : data_instruction_reg;

    reg instruction_source;
    always @(posedge core_clock) begin
        instruction_source <= instruction_address[12];
    end

    assign instruction_mem_to_core = instruction_source ? data_instruction_out : instruction_memory_out;

    instruction_memory instruction_memory(
        .clock(core_clock),
        .reset(reset),
        .addr(instruction_address),
        .out(instruction_memory_out)
    );


    data_memory data_memory(
        .clock(uncore_clock),
        .select(~io_select),            //memory occupies even half of every 16KiB (0-8191, 16384-24575, etc.) within each 8K memory chunk two repeats of 4K memory exists
        .write_enable(data_write_enable & core_clock),
        .mode(data_mode),
        .address({(core_clock ? data_address[11:2] : instruction_address[11:2]),data_address[1:0]}),
        .data_in(core_data_out),
        .data_out(mem_data_out),
        .read_word_buf(raw_data_out)
    );

    assign core_data_in = io_select ? {32'b0} : mem_data_out; //uart always idle, never have data in

    always @(negedge core_clock) begin
        if (data_write_enable) begin
            case (data_address)
                32'h2000: led <= core_data_out[7:0];
                32'h2004: $write("%c",core_data_out[7:0]);
                32'h2010: $dumpon;
                32'h2008: $finish;
                default: ;
            endcase
        end
    end

endmodule