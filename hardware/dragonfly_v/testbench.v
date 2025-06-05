`timescale 1ns/1ns

module testbench();
    wire        led;            //blinky led
    wire        reset;

    wire        uart_rx = 1'b0; //uart receive into fpga from bluetooth/FT2232
    wire        uart_tx;        //uart transmit out from fpga to bluetooth/FT2232

    reg         source_clock;
    reg         core_clock;
    wire        uncore_clock;

    // Address and data buses
    wire [31:0] data_core_to_mem;
    wire [31:0] data_mem_to_core;
    wire [31:0] instruction_mem_to_core;
    wire [31:0] instruction_address;
    wire [31:0] data_address;
    wire        data_write_enable;
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
        core_clock = ~core_clock;
    end
    assign uncore_clock = source_clock;
    
	always @(posedge core_clock) begin
        if (reset_counter[2]) reset_counter <=reset_counter-1;
		clk_counter <= clk_counter+1;
        if (clk_counter > 32'h1000) begin
            $finish;
        end
        if (io_write_enable) begin
            case (io_address)
                32'h2010: $write("%c",io_data[7:0]);
                32'h2004: $dumpon;
                32'h2008: $finish;
                default: ;
            endcase
        end
	end

    assign reset = reset_counter[2];

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
        .addr_reg(io_address),
        .write_data_reg(io_data),
        .write_enable_reg(io_write_enable)
    );

endmodule