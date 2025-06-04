module uart (
    input			core_clock,
	input 	[31:0]	address,
	input   [7:0]	data_in,
	input			write_enable,
	input			source_clock,
	output [7:0]	data_out,

	input			uart_rx,
	output			uart_tx
);

	reg [7:0]	data_in_reg;
	reg 		busy, busy_pipe,take_data;
	reg 		data_taken,data_taken_pipe, data_taken_out;
	reg [3:0]	bit_counter_send;
	reg [12:0]	clock_counter_send;

	reg [3:0]	bit_counter_receive;
	reg [12:0]	clock_counter_receive;

	reg [9:0]	receive_data_reg;
	reg [7:0]	send_data_reg;

	reg 		data_ready, data_ready_pipe, data_ready_out;

	always @(posedge core_clock) begin
		{data_taken_out, data_taken_pipe} = {data_taken_pipe, data_taken};
		{data_ready_out, data_ready_pipe} = {data_ready_pipe, data_ready};
		if (write_enable && (address == 32'h2010)) begin				//write: register 0 = data_register, no control registers implemented
			busy <= 1;
			data_in_reg = data_in;
		end else if (data_taken_out) begin
			busy <= 0;
		end
	end

	always @(posedge source_clock) begin
		{take_data,busy_pipe} <= {busy_pipe,busy};
		if (take_data) begin
			if (bit_counter_send == 12) begin
			send_data_reg <= data_in_reg;
			data_taken <= 1'b1;
			clock_counter_send <= 0;
			bit_counter_send <=0;
			end
		end else begin
			data_taken <= 1'b0;
		end

		if (clock_counter_send == 13'd5000) begin
			if (bit_counter_send < 4'd12) begin
				bit_counter_send <= bit_counter_send+1;
				clock_counter_send <= 0;
			end
		end else begin
			clock_counter_send <= clock_counter_send+1;
		end

		if (clock_counter_receive == 13'd0) begin
			if(bit_counter_receive == 0) begin
				if (uart_rx == 1'b0) begin			//start bit detected
					bit_counter_receive = bit_counter_receive+1;
					clock_counter_receive = 2500;	//wait for half cycle (trick learned from 8251, noise rejection and better sample time)
				end
			end else if(bit_counter_receive == 1) begin
				if (uart_rx == 1'b0) begin			//still low? then it's a real start bit
					bit_counter_receive = bit_counter_receive+1;
					clock_counter_receive = 5000;
				end else begin
					bit_counter_receive = 0;		// noise, return to waiting state
				end
			end else if(bit_counter_receive < 10) begin
				receive_data_reg[bit_counter_receive] = uart_rx;
				bit_counter_receive = bit_counter_receive+1;
				clock_counter_receive = 5000;
			end else begin
				data_ready = 1'b1;
				bit_counter_receive = 1'b0;
			end
		end else begin
			clock_counter_receive = clock_counter_receive-1;
		end
	end
	wire [9:0] tx_data = {1'b1,send_data_reg,1'b0};
	assign uart_tx = (bit_counter_send > 9) ? tx_data[9] : tx_data[bit_counter_send];

	assign data_out = address[0] ? {6'b0,data_ready_out, busy} : data_receive_data_reg; //read: register 0 = data register, 1 = status register

endmodule