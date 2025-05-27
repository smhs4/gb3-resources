`timescale 10ns/1ns

module top();

//simulation
    wire [7:0]	led;

	wire		clk_proc;
	wire		data_clk_stall;
	
	reg		clk;
	reg		ENCLKHF		= 1'b1;	// Plock enable
	reg		CLKHF_POWERUP	= 1'b1;	// Power up the HFOSC circuit

    reg [31:0] counter;


	/*
	 *	Use the iCE40's hard primitive for the clock source.
	 */
	// SB_HFOSC #(.CLKHF_DIV("0b11")) OSCInst0 (
	// 	.CLKHFEN(ENCLKHF),
	// 	.CLKHFPU(CLKHF_POWERUP),
	// 	.CLKHF(clk)
	// );

	/*
	 *	Memory interface
	 */
	wire[31:0]	inst_in;
	wire[31:0]	inst_out;
	wire[31:0]	data_out;
	wire[31:0]	data_addr;
	wire[31:0]	data_WrData;
	wire		data_memwrite;
	wire		data_memread;
	wire[3:0]	data_sign_mask;


	cpu processor(
		.clk(clk_proc),
		.inst_mem_in(inst_in),
		.inst_mem_out(inst_out),
		.data_mem_out(data_out),
		.data_mem_addr(data_addr),
		.data_mem_WrData(data_WrData),
		.data_mem_memwrite(data_memwrite),
		.data_mem_memread(data_memread),
		.data_mem_sign_mask(data_sign_mask)
	);

	instruction_memory inst_mem( 
		.addr(inst_in), 
		.out(inst_out)
	);
	// instruction_memory inst_mem( 
	// 	.addr(counter), 
	// 	.out(inst_out)
	// );

	data_mem data_mem_inst(
			.clk(clk),
			.addr(data_addr),
			.write_data(data_WrData),
			.memwrite(data_memwrite), 
			.memread(data_memread), 
			.read_data(data_out),
			.sign_mask(data_sign_mask),
			.led(led),
			.clk_stall(data_clk_stall)
		);
	// always @(posedge clk) begin
	// 	data_out = data_addr;
	// end
	// assign led = data_WrData[7:0];

	assign clk_proc = (data_clk_stall) ? 1'b1 : clk;

	always
	#1 clk = ~clk;



	reg [10:0] counter2;
	reg [31:0] counter3;

	initial begin
		$dumpoff;
		$dumpfile ("bubble.vcd");
		$dumpvars;
		clk <= 0;
		counter <= 0;
		counter2 <= 10;
		counter3 <=0;
	end

	wire forcehalt;
	assign forcehalt = counter > 32'h2dc6c00;
	// assign forcehalt = (counter > 32'h4000) | (counter3 > 32'h10000);
	wire forcehalt2;
	assign forcehalt2 = counter > 32'h2dc6b00;
	// assign forcehalt2 = counter > 1;
	always @(posedge clk) begin
		counter3 <= counter3+1;
	end
	always @(posedge clk_proc) begin
		counter <= counter+1;
		if (led[0]) begin
			counter2 <= counter2+1;
		end
	end
	always @(posedge forcehalt2 or posedge led[0]) begin
		$dumpon;
	end
	// always @(posedge (prog_out == 2)) begin
	// 	$dumpon;
	// end
	always @(posedge forcehalt or posedge counter2[5]) begin
		$finish;
	end
endmodule
