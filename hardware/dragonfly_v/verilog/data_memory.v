module data_memory(
    clock,
    address,
    data_in,
    data_out,
    write_enable,
    mode
);
    input           clock;
    input [31:0]    address;
    input [31:0]    data_in;
    input           write_enable;
    input [3:0]     mode;
    output reg [31:0]   data_out;

	reg [31:0]		data_memory[0:2**10-1];

	initial begin
		/*
		 *	read from "data.hex" and store the data in data memory
		 */
		$readmemh("/gb3-resources/build/programs/data.hex",instruction_memory);
	end

	always @(negedge clock) begin
		data_out <= data_memory[address[11:2]];
        if (write_enable) begin
            data_memory[address[11:2]] <= data_in;
        end
	end


endmodule