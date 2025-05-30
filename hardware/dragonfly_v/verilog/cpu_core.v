module cpu_core(
    clk,
	reset,
    instruction_address,
    instruction_in,
    data_address,
    data_out,
    data_in,
    data_mode,
    data_write_enable
);

    input           clk;      //input clock
	input			reset;		//reset input (active high)

    output	[17:0]	instruction_address;
    input   [31:0]	instruction_in;

	output	[17:0]	data_address;
	output	[31:0]	data_out;
	input	[31:0]	data_in;
	output	[2:0]	data_mode;	//note sign extension is done internally, TODO discuss with memory designer for best place to put sign extension
	output			data_write_enable;	//data memory write enable  (active high)

    wire     [31:0]  if_pc;

    wire [31:0] pc_adder_out = 32'b100 + if_pc;

    


endmodule