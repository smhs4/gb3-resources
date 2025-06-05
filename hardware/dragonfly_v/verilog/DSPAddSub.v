module DSPAddSub( input1, input2, out, carry_out, sub, hold);
    
	input [31:0] input1;
    input [31:0] input2;
	input sub;
	input hold;

    output [31:0] out;
	output carry_out;

	SB_MAC16 i_sbmac16_addsub
	(
		.A(input2[31 : 16]),
		.B(input2[15 : 0]),
		.C(input1[31 : 16]),
		.D(input1[15 : 0]),
		.O(out),
		.CLK(),
		.CE(1'b0), // clock enabled input? What happens if we disable?
		.IRSTTOP(1'b0),
		.IRSTBOT(1'b0),
		.ORSTTOP(1'b0),
		.ORSTBOT(1'b0),
		.AHOLD(hold),
		.BHOLD(hold),
		.CHOLD(hold),
		.DHOLD(hold),
		.OHOLDTOP(1'b0),
		.OHOLDBOT(1'b0),
		.OLOADTOP(1'b0),
		.OLOADBOT(1'b0),
		.ADDSUBTOP(sub),
		.ADDSUBBOT(sub),
		.CO(carry_out),
		.CI(1'b0),
		.ACCUMCI(1'b0),
		.ACCUMCO(),
		.SIGNEXTIN(1'b0),
		.SIGNEXTOUT()
	);

    // add_sub_32_bypassed_unsigned [24:0] 001_0010000_1010000_0000_0000
    // bypass, take from adder/subtractor output directly, do not store in accumulator register
    defparam i_sbmac16_addsub.B_SIGNED = 1'b0 ;
    defparam i_sbmac16_addsub.A_SIGNED = 1'b0 ;
    defparam i_sbmac16_addsub.MODE_8x8 = 1'b1 ;

    defparam i_sbmac16_addsub.BOTADDSUB_CARRYSELECT = 2'b00 ;
    defparam i_sbmac16_addsub.BOTADDSUB_UPPERINPUT = 1'b1 ;
    defparam i_sbmac16_addsub.BOTADDSUB_LOWERINPUT = 2'b00 ;
    defparam i_sbmac16_addsub.BOTOUTPUT_SELECT = 2'b00 ; //lower [15:0] of adder/subtractor

    defparam i_sbmac16_addsub.TOPADDSUB_CARRYSELECT = 2'b10 ;
    defparam i_sbmac16_addsub.TOPADDSUB_UPPERINPUT = 1'b1 ;
    defparam i_sbmac16_addsub.TOPADDSUB_LOWERINPUT = 2'b00 ;
    defparam i_sbmac16_addsub.TOPOUTPUT_SELECT = 2'b00 ; // higher [31:16] of adder/subtractor

    defparam i_sbmac16_addsub.PIPELINE_16x16_MULT_REG2 = 1'b0 ;
    defparam i_sbmac16_addsub.PIPELINE_16x16_MULT_REG1 = 1'b0; 
    defparam i_sbmac16_addsub.BOT_8x8_MULT_REG = 1'b0;
    defparam i_sbmac16_addsub.TOP_8x8_MULT_REG = 1'b0;

    defparam i_sbmac16_addsub.D_REG = 1'b0;
    defparam i_sbmac16_addsub.B_REG = 1'b0;
    defparam i_sbmac16_addsub.A_REG = 1'b0;
    defparam i_sbmac16_addsub.C_REG = 1'b0;
     
endmodule