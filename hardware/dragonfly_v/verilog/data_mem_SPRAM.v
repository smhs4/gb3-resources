/*
	Authored 2018-2019, Ryan Voo.

	All rights reserved.
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions
	are met:

	*	Redistributions of source code must retain the above
		copyright notice, this list of conditions and the following
		disclaimer.

	*	Redistributions in binary form must reproduce the above
		copyright notice, this list of conditions and the following
		disclaimer in the documentation and/or other materials
		provided with the distribution.

	*	Neither the name of the author nor the names of its
		contributors may be used to endorse or promote products
		derived from this software without specific prior written
		permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
	COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
	LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
	ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
*/



//Data cache

module data_mem (clk, addr, write_data, memwrite, memread, sign_mask, read_data, led, clk_stall);
	input			clk;
	input [31:0]		addr;
	input [31:0]		write_data;
	input			memwrite;
	input			memread;
	input [3:0]		sign_mask;
	output reg [31:0]	read_data;
	output [7:0]		led;
	output reg		clk_stall;	//Sets the clock high

	initial begin
		clk_stall = 1'b0;
	end

	/*
	 *	Sign_mask buffer
	 */
	reg [3:0]		sign_mask_buf;

	reg chip_select;
	always @(posedge clk) begin
		chip_select = memread | memwrite;
	end

	/*
	 *	wire assignments
	 */
	wire [9:0]		addr_buf_block_addr;
	wire [1:0]		addr_buf_byte_offset;
	wire [31:0]		word_buf;
	wire [31:0]		replacement_word;

	assign			addr_buf_block_addr	= addr[11:2];
	assign			addr_buf_byte_offset	= addr[1:0];

	/*
	 *	Regs for multiplexer output
	 */
	wire [7:0]		buf0;
	wire [7:0]		buf1;
	wire [7:0]		buf2;
	wire [7:0]		buf3;

    // assigning the write data from memory
	assign 			buf0	= word_buf[7:0];
	assign 			buf1	= word_buf[15:8];
	assign 			buf2	= word_buf[23:16];
	assign 			buf3	= word_buf[31:24];

	wire [7:0] wmask;      // 1 = byte is written, 0 = byte is ignored

	assign wmask = sign_mask_buf[2]               	? 8'b11111111 :                   // WORD
				sign_mask_buf[1]               		? (addr_buf_byte_offset[1] ?      // HALF-WORD
													8'b11110000 : 8'b00001111) :
				(8'b00000011 << 2*addr_buf_byte_offset);                              // BYTE
	// $display("wmask: %b", wmask);
	// $display("addr_buf_byte_offset: %b", addr_buf_byte_offset);
	//--------------------------------------------------------------
	wire [31:0] replacement_word;
	assign replacement_word = wmask[0] ? write_data :
					wmask[2] ? (write_data << 2) :
					wmask[4] ? (write_data << 4) :
					wmask[6] ? (write_data << 6) :
					write_data; // if no byte is written, return the original word_buf

	wire select0;
	wire select1;
	wire select2;

	wire[31:0] out1;
	wire[31:0] out2;
	wire[31:0] out3;
	wire[31:0] out4;
	wire[31:0] out5;
	wire[31:0] out6;
	/* a is sign_mask_buf[2], b is sign_mask_buf[1], c is sign_mask_buf[0]
	 * d is addr_buf_byte_offset[1], e is addr_buf_byte_offset[0]
	 */

	assign select0 = (~sign_mask_buf[2] & ~sign_mask_buf[1] & ~addr_buf_byte_offset[1] & addr_buf_byte_offset[0]) | (~sign_mask_buf[2] & addr_buf_byte_offset[1] & addr_buf_byte_offset[0]) | (~sign_mask_buf[2] & sign_mask_buf[1] & addr_buf_byte_offset[1]); //~a~b~de + ~ade + ~abd
	assign select1 = (~sign_mask_buf[2] & ~sign_mask_buf[1] & addr_buf_byte_offset[1]) | (sign_mask_buf[2] & sign_mask_buf[1]); // ~a~bd + ab
	assign select2 = sign_mask_buf[1]; //b

	assign out1 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{24{buf1[7]}}, buf1} : {24'b0, buf1}) : ((sign_mask_buf[3]==1'b1) ? {{24{buf0[7]}}, buf0} : {24'b0, buf0});
	assign out2 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{24{buf3[7]}}, buf3} : {24'b0, buf3}) : ((sign_mask_buf[3]==1'b1) ? {{24{buf2[7]}}, buf2} : {24'b0, buf2});
	assign out3 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{16{buf3[7]}}, buf3, buf2} : {16'b0, buf3, buf2}) : ((sign_mask_buf[3]==1'b1) ? {{16{buf1[7]}}, buf1, buf0} : {16'b0, buf1, buf0});
	assign out4 = (select0) ? 32'b0 : {buf3, buf2, buf1, buf0};

	assign out5 = (select1) ? out2 : out1;
	assign out6 = (select1) ? out4 : out3;

	assign read_data = (select2) ? out6 : out5;

    wire [9:0] corrected_address;
	assign corrected_address = addr_buf_block_addr - 32'h1000;

    // spram256 user modules //
    SB_SPRAM256KA ramfn_inst1(
    .DATAIN(replacement_word[15:0]),
    .ADDRESS(corrected_address[9:0]),
    .MASKWREN(wmask[3:0]),
    .WREN(memwrite_buf),
    .CHIPSELECT(chip_select),
    .CLOCK(clk),
    .STANDBY(1'b0),
    .SLEEP(1'b0),
    .POWEROFF(1'b0),
    .DATAOUT(word_buf[15:0])
    );

    SB_SPRAM256KA ramfn_inst2(
    .DATAIN(replacement_word[31:16]),
    .ADDRESS(corrected_address[9:0]),
    .MASKWREN(wmask[7:4]),
    .WREN(memwrite_buf),
    .CHIPSELECT(chip_select),
    .CLOCK(clk),
    .STANDBY(1'b0),
    .SLEEP(1'b0),
    .POWEROFF(1'b0),
    .DATAOUT(word_buf[31:16])
    );

endmodule
