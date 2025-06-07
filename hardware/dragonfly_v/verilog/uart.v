`define STATE_IDLE		2'b00
`define STATE_BEGIN		2'b01
`define STATE_RECEIVE	2'b11
`define STATE_END		2'b10

module uart (
    input			core_clock,
	input			source_clock,
	input			write_enable,
	input			read_enable,
	input			select,
	input 	[1:0]	address,
	input   [7:0]	data_in,
	output  [7:0]	data_out,

	input			uart_rx,
	output			uart_tx
);

	reg [7:0]	data_in_reg;
	reg 		busy, busy_pipe,take_data;
	reg 		data_taken,data_taken_pipe, data_taken_out;
	reg [3:0]	bit_counter_send;
	reg [12:0]	clock_counter_send;

	reg [2:0]	bit_counter_receive;
	reg [12:0]	clock_counter_receive;

	reg [7:0]	receive_data_reg;
	reg [7:0]	send_data_reg;

	reg 		rx_data_ready, rx_data_ready_pipe, rx_data_ready_out;
	reg			rx_data_taken, rx_data_taken_pipe, rx_data_taken_out;

	reg [1:0]	state;

	initial begin
		state = 2'b00;
		data_in_reg = 8'b0;
		busy = 1'b0;
		busy_pipe = 1'b0;
		take_data = 1'b0;
		data_taken = 1'b0;
		data_taken_pipe = 1'b0;
		data_taken_out = 1'b0;
		bit_counter_send = 4'b0;
		clock_counter_send = 13'b0;
		bit_counter_receive = 3'b0;
		clock_counter_receive = 3'b0;
		receive_data_reg = 8'b0;
		send_data_reg = 10'b0;
		rx_data_ready = 1'b0;
		rx_data_ready_pipe = 1'b0;
		rx_data_ready_out = 1'b0;
		rx_data_taken = 1'b0;
		rx_data_taken_pipe = 1'b0;
		rx_data_taken_out = 1'b0;
	end

	always @(negedge core_clock) begin
		{data_taken_out, data_taken_pipe} <= {data_taken_pipe, data_taken};
		{rx_data_ready_out, rx_data_ready_pipe} <= {rx_data_ready_pipe, rx_data_ready};
		if (write_enable && select) begin				//write: register 0 = data_register, no control registers implemented
			busy <= 1;
			data_in_reg = data_in;
		end else if (data_taken_out) begin
			busy <= 0;
		end

		if (read_enable && select) begin
			rx_data_taken <= 1'b1;
		end else if (~rx_data_ready_out) begin
			rx_data_taken <= 1'b0;
		end
	end

	always @(posedge source_clock) begin
		{take_data,busy_pipe} <= {busy_pipe,busy};
		{rx_data_taken_out,rx_data_taken_pipe} <= {rx_data_taken_pipe, rx_data_taken};
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
			case (state)
				`STATE_IDLE: begin
					//idle state
					if (~uart_rx) begin
						state <= `STATE_BEGIN;
						clock_counter_receive <= 2500;
					end
					if (rx_data_taken_out) begin
						rx_data_ready <= 1'b0;
					end
				end
				`STATE_BEGIN: begin
					//begin state
					if (~uart_rx) begin
						state <= `STATE_RECEIVE;
						clock_counter_receive <=5000;
					end
					else begin
						state <= `STATE_IDLE;
					end
				end
				`STATE_RECEIVE: begin
					//receive state
					if (bit_counter_receive == 3'b111) begin
						state <= `STATE_END;
					end
					receive_data_reg[bit_counter_receive] <= uart_rx;
					bit_counter_receive <= bit_counter_receive+1;
					clock_counter_receive <= 5000;
				end
				`STATE_END: begin
					//end state
					state = `STATE_IDLE;
					rx_data_ready <= 1'b1;
					clock_counter_receive <= 2500;
				end
				default: ;//should neve happed
			endcase
		end else begin
			clock_counter_receive <= clock_counter_receive-1;
		end
	end
	wire [15:0] tx_data = {7'b1111111,send_data_reg,1'b0};
	assign uart_tx = tx_data[bit_counter_send];

	assign data_out = address[0] ? {6'b0,rx_data_ready_out, busy} : receive_data_reg; //read: register 0 = data register, 1 = status register

endmodule