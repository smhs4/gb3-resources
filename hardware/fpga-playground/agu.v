module agu(addr1, addr2, addr_out);
    input [31:0] addr1;
    input [31:0] addr2;
    output [18:0] addr_out;

    assign addr_out = addr1[18:0] + addr2[18:0];

endmodule