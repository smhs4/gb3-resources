`define kDATA_MEMORY_SIZE 10

module data_memory(
    input           clock,
    input   [31:0]  address,
    input   [31:0]  data_in,
    input           write_enable,
    input           read_enable,
    input   [2:0]   mode,
    output  [31:0]  data_out,
    output reg [31:0]   addr_reg,
    output reg [31:0]   write_data_reg,
    output reg          write_enable_reg
    // input   [31:0]  io_in_device_0,
    // input   [31:0]  io_in_device_1,
    // input   [31:0]  io_in_device_2,
    // input   [31:0]  io_in_device_3,
);

	reg [31:0]		data_memory[0:2**`kDATA_MEMORY_SIZE-1];

	initial begin
		/*
		 *	read from "data.hex" and store the data in data memory
		 */
		$readmemh("/gb3-resources/build/programs/data.hex",data_memory);
	end

    wire [3:0]   write_mask = mode[1] ? 4'b1111 : ((mode[0]) ? ((address[1]) ? 4'b1100 : 4'b0011) : (4'b0001 << (address[1:0])));
    wire [31:0]  write_buf = mode[1] ? data_in : ((mode[0]) ? {2{data_in[15:0]}} : {4{data_in[7:0]}});
    
    reg [31:0]  read_word_buf;
    reg [31:0]  read_data_buf;

    wire [9:0] word_address = address[`kDATA_MEMORY_SIZE+1:2];

	always @(negedge clock) begin
        //MMIO part
        addr_reg <= address;
        write_data_reg <= data_in;
        write_enable_reg <= write_enable;

        //write part
        if (write_enable) begin
            if(write_mask[0]) data_memory[word_address][7:0] <= write_buf[7:0];
            if(write_mask[1]) data_memory[word_address][15:8] <= write_buf[15:8];
            if(write_mask[2]) data_memory[word_address][23:16] <= write_buf[23:16];
            if(write_mask[3]) data_memory[word_address][31:24] <= write_buf[31:24];
        end
        //read part
        read_word_buf <= data_memory[word_address];
		
	end
    // magic, madness, heaven, sin
	assign data_out[7:0] = (address[1]) ? ((address[0]) ? read_word_buf[31:24] : read_word_buf[23:16]) : ((address[0]) ? read_word_buf[15:8] : read_word_buf[7:0]);
	assign data_out[15:8] = (mode[1] | mode[0]) ? ((address[1]) ? read_word_buf[31:24] : read_word_buf[15:8]) : {8{((mode[2]) ? 1'b0 : data_out[7])}};
    assign data_out[31:16] = (mode[1]) ? read_word_buf[31:16] : {16{(mode[2]) ? 1'b0 : ((mode[0]) ? data_out[15] : data_out[7])}};

endmodule