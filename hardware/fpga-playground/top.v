`define	kFofE_HFOSC_CLOCK_DIVIDER_FOR_1Hz	100000

module top(led);
	output		led;

	wire		clk;
	reg		LEDstatus = 1;
	reg [18:0]	count = 0;

	reg [31:0] addr_src1;
	reg [31:0] addr_src2;

	initial begin
		addr_src1 = 12345;
		addr_src2 = 67890;
	end

	wire [31:0] rddata;
	wire [31:0] outdata;

	wire [3:0] select = count[18:15];
	/*
	 *	Creates a 48MHz clock signal from
	 *	internal oscillator of the iCE40
	 */
	SB_HFOSC OSCInst0 (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk)
	);

	defparam OSCInst0.CLKHF_DIV = "0b01";
	/*
	 *	Blinks LED at approximately 1Hz. The constant kFofE_CLOCK_DIVIDER_FOR_1Hz
	 *	(defined above) is calibrated to yield a blink rate of about 1Hz.
	 */
	wire [18:0] data_addr;
	agu agu(
		.addr1(addr_src1),
		.addr2(addr_src2),
		.addr_out(data_addr)
	);

	wire [13:0] addr = count[0] ? count[15:2] : data_addr[18:5];

    SB_SPRAM256KA blk0(
        .CLOCK(clk),
        .ADDRESS(addr),
        .DATAIN(count[15:0]),
        .DATAOUT(rddata[15:0]),
        .MASKWREN(4'b1),
        .WREN(1'b0),
        .CHIPSELECT(1'b1),
        .STANDBY(1'b0),
        .SLEEP(1'b0),
        .POWEROFF(1'b1)
	);
    SB_SPRAM256KA blk1(
        .CLOCK(clk),
        .ADDRESS(count),
        .DATAIN(count[15:0]),
        .DATAOUT(rddata[31:16]),
        .MASKWREN(4'b1),
        .WREN(1'b0),
        .CHIPSELECT(1'b1),
        .STANDBY(1'b0),
        .SLEEP(1'b0),
        .POWEROFF(1'b1)
	);
	wire [18:0] nextcount = count + 1;
	assign outdata = {24'b0,select[2] ? (select[3] ? rddata[31:24] : rddata[15:8]) : (select[3] ? rddata [23:16] : rddata[7:0])};
	always @(posedge clk) begin
		// if (count > `kFofE_HFOSC_CLOCK_DIVIDER_FOR_1Hz) begin
		// 	LEDstatus <= !LEDstatus;
		// 	count <= 12345;
		// end
		// else begin
		count <= ~count;
		addr_src2 <= ~addr_src1;
		addr_src1 <= addr_src2;

		// end
	end

	/*
	 *	Assign output led to value in LEDstatus register
	 */
	assign	led = outdata[0];
endmodule
