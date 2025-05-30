module top(
    led,
    uart_rx,
    uart_tx,
    temp_in
);

    output          led;            //blinky led

    input       temp_in;
    reg         temp;

    input           uart_rx;        //uart receive into fpga from bluetooth/FT2232
    output          uart_tx;        //uart transmit out from fpga to bluetooth/FT2232
    
    cpu_core cpu();

	reg [31:0] addr_src1;
	reg [31:0] addr_src2;

	initial begin
		addr_src1 = 12345;
		addr_src2 = 67890;
	end
	always @(posedge uart_rx) begin
		addr_src2 <= ~addr_src1;
		addr_src1 <= addr_src2;
        temp <= temp_in;
	end
    wire [31:0] regout;

    d_flip_flop dff(
        .clk(uart_rx),
        .reset(1'b0),
        .data_in((temp) ? addr_src2 : addr_src1),
        .data_out(regout)
    );
    assign led = addr_src2[0];
    assign uart_tx = regout[1];
endmodule