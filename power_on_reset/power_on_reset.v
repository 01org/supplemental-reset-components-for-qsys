/*
 * Copyright (c) 2016-2021 Intel Corporation
 *
 * SPDX-License-Identifier: MIT-0
 */
/*
This component produces a power on reset strobe.

At power up when the FPGA enters user mode the registers of the
altera_std_synchronizer core will all be set to ZERO.  As the 1'b1 input
propogates through the shift chain of the synchronizer the specified power on
reset delay count will be measured to the number of clocks specified by the
POR_COUNT parameter.

This is intended to create a rather short power on reset delay, between 2 and 32
clocks, so the inefficient use of a shift chain to measure this is not a
significant concern.  The advantage of using the altera_std_synchronizer is that
it takes care of the quartus properties to preserve the registers of the shift
chain and apply the SDC constraints for us.

To constrain the outputs of this component in your own SDC constraints, you can
locate the output registers of the component with something like this:
[get_registers {*power_on_reset:*|output_reg}]

*/
`timescale 1 ps / 1 ps
module power_on_reset #(
	parameter POR_COUNT = 20	// MUST BE 2 or greater
) (
	input  wire  clk,
	output wire  reset
);

wire sync_dout;
altera_std_synchronizer #(
	.depth (POR_COUNT)
) power_on_reset_std_sync_inst (
	.clk     (clk),
	.reset_n (1'b1),
	.din     (1'b1),
	.dout    (sync_dout)
);

reg output_reg;
initial begin
	output_reg <= 1'b0;
end

always @ (posedge clk) begin
	output_reg <= sync_dout;
end

assign reset = ~output_reg;

endmodule

