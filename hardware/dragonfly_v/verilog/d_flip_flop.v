module d_flip_flop #(
    parameter WIDTH = 32,
    parameter RESET_VALUE = 0
) (
    clk,
    reset,
    data_in,
    data_out
);
    input               clk;
    input               reset;      //active high
    input   [WIDTH-1:0] data_in;
    output reg[WIDTH-1:0] data_out;

    always @(posedge clk) begin
        if (reset) begin
            data_out <= RESET_VALUE;
        end else begin
            data_out <= data_in;
        end
    end
endmodule