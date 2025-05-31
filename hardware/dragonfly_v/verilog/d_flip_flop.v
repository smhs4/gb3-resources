module d_flip_flop #(
    parameter WIDTH = 32,
    parameter RESET_VALUE = 0
) (
    clock,
    reset,
    in,
    out
);
    input               clock;
    input               reset;      //active high
    input   [WIDTH-1:0] in;
    output reg[WIDTH-1:0] out;

    always @(posedge clock) begin
        if (reset) begin
            out <= RESET_VALUE;
        end else begin
            out <= in;
        end
    end
endmodule