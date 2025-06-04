`define kDATA_MEMORY_SIZE 10

module data_memory(
    input           clock,
    input   [31:0]  address,
    input   [31:0]  data_in,
    input           write_enable,
    input   [2:0]   mode,
    output  [31:0]  data_out,
    output          led,
    output          uart_tx
);



	reg [31:0]		data_memory[0:2**`kDATA_MEMORY_SIZE-1];

	initial begin
		/*
		 *	read from "data.hex" and store the data in data memory
		 */
		$readmemh("/gb3-resources/build/programs/data.hex",data_memory);
        led_reg = 0;
	end

    reg [31:0] addr_reg;
    reg [31:0] write_data_reg;
    reg write_enable_reg;
    reg [31:0] led_reg;

    assign led = led_reg[0];
    assign uart_tx = led_reg[1];

    // reg [3:0]   write_mask;
    wire [3:0]   write_mask = mode[1] ? 4'b1111 : ((mode[0]) ? ((address[1]) ? 4'b1100 : 4'b0011) : (4'b0001 << (address[1:0])));
    // reg [31:0]  write_buf;
    wire [31:0]  write_buf = mode[1] ? data_in : ((mode[0]) ? {2{data_in[15:0]}} : {4{data_in[7:0]}});

    // always @(*) begin
    //     case (mode[1:0])
    //         2'b00: begin //store byte
    //             // write_buf <= {4{data_in[7:0]}};
    //             case (address[1:0])
    //                 2'b00: write_mask <= 4'b0001;
    //                 2'b01: write_mask <= 4'b0010;
    //                 2'b10: write_mask <= 4'b0100;
    //                 2'b11: write_mask <= 4'b1000;
    //                 default: write_mask <= 4'b0000; //should not happen
    //             endcase
    //         end
    //         2'b01: begin //store half
    //             // write_buf <= {2{data_in[15:0]}};
    //             write_mask <= (address[1]) ? 4'b1100 : 4'b0011;
    //         end
    //         2'b10: begin //store word
    //             // write_buf <= data_in;
    //             write_mask <= 4'b1111;
    //         end
    //         default: begin
    //             // write_buf <= data_in;
    //             write_mask <= 4'b0000;
    //         end
    //     endcase
    // end
    
    reg [31:0]  read_word_buf;
    reg [31:0]  read_data_buf;

    wire [9:0] corrected_address = address[11:2];

	always @(negedge clock) begin
        //MMIO part
        addr_reg <= address;
        write_data_reg <= data_in;
        write_enable_reg <= write_enable;
		if(write_enable_reg == 1'b1 && addr_reg == 32'h2000) begin
			led_reg <= write_data_reg;
		end
        //write part
        if (write_enable) begin
            if(write_mask[0]) data_memory[address[`kDATA_MEMORY_SIZE+1:2]][7:0] <= write_buf[7:0];
            if(write_mask[1]) data_memory[address[`kDATA_MEMORY_SIZE+1:2]][15:8] <= write_buf[15:8];
            if(write_mask[2]) data_memory[address[`kDATA_MEMORY_SIZE+1:2]][23:16] <= write_buf[23:16];
            if(write_mask[3]) data_memory[address[`kDATA_MEMORY_SIZE+1:2]][31:24] <= write_buf[31:24];
        end
        //read part
        read_word_buf <= data_memory[corrected_address];
		
	end
    // magic, madness, heaven, sin
	assign data_out[7:0] = (address[1]) ? ((address[0]) ? read_word_buf[31:24] : read_word_buf[23:16]) : ((address[0]) ? read_word_buf[15:8] : read_word_buf[7:0]);
	assign data_out[15:8] = (mode[1] | mode[0]) ? ((address[1]) ? read_word_buf[31:24] : read_word_buf[15:8]) : {8{((mode[2]) ? 1'b0 : data_out[7])}};
    assign data_out[31:16] = (mode[1]) ? read_word_buf[31:16] : {16{(mode[2]) ? 1'b0 : ((mode[0]) ? data_out[15] : data_out[7])}};

    // always @(*) begin
    //     case (mode[1:0])
    //         2'b00: data_out <= {{24{mode[2] ? 1'b0 : read_data_buf[7]}},read_data_buf[7:0]}; //byte
    //         2'b01: data_out <= {{16{mode[2] ? 1'b0 : read_data_buf[15]}},read_data_buf[15:0]};//half
    //         2'b10: data_out <= read_data_buf;//word
    //         default: data_out <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;//should not happen
    //     endcase
    // end

endmodule