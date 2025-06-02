module data_memory(
    clock,
    address,
    data_in,
    data_out,
    write_enable,
    mode,
    led,
    uart_tx,
);
    input           clock;
    input [31:0]    address;
    input [31:0]    data_in;
    input           write_enable;
    input [2:0]     mode;
    output reg [31:0]   data_out;
    output led;
    output uart_tx;
    reg [31:0] addr_reg;
    reg [31:0] write_data_reg;

    reg [31:0] led_reg;

    assign led = led_reg[0];
    assign uart_tx = led_reg[1];

	reg [31:0]		data_memory[0:2**10-1];

	initial begin
		/*
		 *	read from "data.hex" and store the data in data memory
		 */
		$readmemh("/gb3-resources/build/programs/data.hex",data_memory);
	end
    reg write_enable_reg;
	always @(posedge clock) begin
		if(write_enable_reg == 1'b1 && addr_reg == 32'h2000) begin
			led_reg <= write_data_reg;
		end
	end

	always @(negedge clock) begin
		data_out <= data_memory[address[11:2]];
        addr_reg <= {22'b0,address[11:2]};
        write_data_reg <= data_in;
        if (write_enable) begin
            data_memory[address[11:2]] <= data_in;
        end
	end


endmodule