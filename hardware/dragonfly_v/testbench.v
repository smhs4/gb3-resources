`timescale 1ns/1ns


module testbench();
    wire      led;                //blinky led
    wire       reset;

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


	reg [31:0] clk_counter;
	reg [10:0] capture_counter;

	initial begin
		// $dumpoff;
		$dumpfile ("proc_sim.vcd");
		$dumpvars;
        core_clock <=0;
		source_clock <= 0;
		capture_counter <= 10;
		clk_counter <=0;
        // reset <= 1'b1;
        // #10
        // reset <= 1'b0;
	end
	wire forcehalt;
	wire dump_start;

	assign forcehalt = (clk_counter > 32'h156ec34);

    reg [2:0] reset_counter;

    initial begin
        reset_counter = 3'b111;
    end

    always @(posedge core_clock) begin
        if (reset_counter[2]) reset_counter <=reset_counter-1;
    end

    assign reset = reset_counter[2];
	// wire program_halt = |inst_in[31:20];
	always @(posedge core_clock) begin
		clk_counter <= clk_counter+1;

        // if (instruction_address == 32'h054) begin
        //     $display("memcpy finished");
        //     $finish;
        // end
		// if (led) begin
		// 	capture_counter <= capture_counter+1;
        //     $display("capture_counter: %d", capture_counter);
		// end
	end
	// always @(posedge led) begin
	// 	$dumpon;
	// end
	always @(posedge forcehalt or posedge capture_counter[5]) begin
		$finish;
	end

	always
	#1 source_clock = ~source_clock;

    assign uncore_clock = source_clock;

    /*
     * The craziest clock system you will ever see

     * core_clock:      ___/‾‾‾‾‾‾‾‾‾\_________/‾‾‾‾‾‾‾‾‾\_________/‾‾...
     * uncore_clock:    _/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾\____/‾‾‾‾...
     */

    always @(posedge uncore_clock) begin
        core_clock = ~core_clock;
        if ((data_address == 32'h2004) & (data_write_enable == 1'b1)) begin
            $dumpon;
        end
        if ((data_address == 32'h2008) & (data_write_enable == 1'b1)) begin
            $finish;
        end
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
        .reset(reset),
        .addr(instruction_address),
        .out(instruction_mem_to_core)
    );

    // data_memory data_memory(
    //     .clock(core_clock),
    //     .address(data_address),
    //     .data_in(data_core_to_mem),
    //     .data_out(data_mem_to_core),
    //     .write_enable(data_write_enable),
    //     .mode(data_mode),
    //     .led(led),
    //     .uart_tx(uart_tx)
    // );
    wire [31:0] io_address;
    wire [31:0] io_data;
    wire        io_write_enable;

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

    always @(posedge core_clock) begin
        if ((io_address == 32'h2010) && io_write_enable) begin
            $write("%c",io_data[7:0]);
        end
    end

endmodule