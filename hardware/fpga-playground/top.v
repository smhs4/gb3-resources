module top(
	output		led,
	input		uart_rx,
	output 		uart_tx,
);
	wire		clk;
	reg [12:0]	count = 0;
	wire [9:0] data = 10'b1010101010;
	/*
	 *	Creates a 48MHz clock signal from
	 *	internal oscillator of the iCE40
	 */
	SB_HFOSC #(.CLKHF_DIV("0b00")) OSCInst0 (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk)
	);

	reg [3:0] bit_counter;

	always @(posedge clk) begin
		if (count > 13'd5000)begin
			bit_counter <= bit_counter +1;
			count <= 0;
		end else begin
			count <= count+1;
		end
	end
	assign uart_tx = (bit_counter > 9) ? data[9] : data[bit_counter];

	/*
	 *	Assign output led to value in LEDstatus register
	 */
	assign	led = (bit_counter > 9) ? data[9] : data[bit_counter];
endmodule
