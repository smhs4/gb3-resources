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



/*
 *	Description:
 *
 *		This module implements the register file.
 */



module regfile(clk, write, rd_addr, rd_data, rs1_addr, rs1_data, rs2_addr, rs2_data);
	input		clk;
	input		write;
	input [4:0]	rd_addr;
	input [31:0]	rd_data;
	input [4:0]	rs1_addr;
	output [31:0]	rs1_data;
	input [4:0]	rs2_addr;
	output [31:0]	rs2_data;

	/*
	 *	register file, 32 x 32-bit registers
	 */
	reg [31:0]	regfile[31:0];

	wire [31:0] ra = regfile[1];

	wire [31:0] a0 = regfile[10];
	wire [31:0] a1 = regfile[11];
	wire [31:0] a2 = regfile[12];
	wire [31:0] a3 = regfile[13];
	wire [31:0] a4 = regfile[14];
	wire [31:0] a5 = regfile[15];

	/*
	 *	registers for forwarding
	 */
	reg [31:0]	regDatA;
	reg [31:0]	regDatB;
	reg [31:0]	rd_data_buf;

	/*
	 *	The `initial` statement below uses Yosys's support for nonzero
	 *	initial values:
	 *
	 *		https://github.com/YosysHQ/yosys/commit/0793f1b196df536975a044a4ce53025c81d00c7f
	 *
	 *	Rather than using this simulation construct (`initial`),
	 *	the design should instead use a reset signal going to
	 *	modules in the design and to thereby set the values.
	 */

	/*
	 *	Sets registers
	 */
	integer i;
	initial begin
		
		for (i = 0; i < 32; i = i+1) begin
			regfile[i] = 32'b0;
		end
		rs1_forward_enable = 1'b0;
		rs2_forward_enable = 1'b0;
		// regfile[0] = 32'b0;
	end

	wire forward_enable = write & (rd_addr != 5'b0);
	reg rs1_forward_enable;
	reg rs2_forward_enable;

	always @(posedge clk) begin
		if (write==1'b1 && rd_addr!=5'b0) begin
			regfile[rd_addr] <= rd_data;
		end
		// rd_addr_buf	<= rd_addr;
		// write_buf	<= write;
		rd_data_buf	<= rd_data;
		// rs1_addr_buf	<= rs1_addr;
		// rs2_addr_buf	<= rs2_addr;
		rs1_forward_enable <= (rd_addr==rs1_addr) & forward_enable;
		rs2_forward_enable <= (rd_addr==rs2_addr) & forward_enable;

		regDatA		<= regfile[rs1_addr];
		regDatB		<= regfile[rs2_addr];
	end

	assign	rs1_data = rs1_forward_enable ? rd_data_buf : regDatA;
	assign	rs2_data = rs2_forward_enable ? rd_data_buf : regDatB;
endmodule
