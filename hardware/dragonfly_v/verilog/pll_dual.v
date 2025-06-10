/**
 * PLL configuration
 *
 * This Verilog module was generated automatically
 * using the icepll tool from the IceStorm project.
 * Use at your own risk.
 *
 * Given input frequency:        12.000 MHz
 * Requested output frequency:   16.000 MHz
 * Achieved output frequency:    15.938 MHz
 */

module pll(
	input  clock_in,
	output clock_out,
	output clock_out_half,
	output locked
	);

SB_PLL40_2F_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'b0010),		// DIVR =  0
		.DIVF(7'b0111111),	// DIVF = 84
		.DIVQ(3'b110),		// DIVQ =  6
		.FILTER_RANGE(3'b001),	// FILTER_RANGE = 1
		.PLLOUT_SELECT_PORTB("GENCLK_HALF")
	) uut (
		.LOCK(locked),
		.RESETB(1'b1),
		.BYPASS(1'b0),
		.REFERENCECLK(clock_in),
		.PLLOUTGLOBALA(clock_out),
		.PLLOUTGLOBALB(clock_out_half)
		);

endmodule
