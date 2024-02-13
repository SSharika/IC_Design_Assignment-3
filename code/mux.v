

module mux(
    input [1:0] sel,
    input [3:0] data0,
    input [3:0] data1,
    output reg [3:0] out
);

always @(*)
    case(sel)
        2'b00: out = data0;
        2'b01: out = data1;
        default: out = 4'b0000;
    endcase

endmodule

