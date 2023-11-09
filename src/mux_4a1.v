`timescale 1ns / 1ps

module mux_4a1(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    output reg [3:0] F,
    input [1:0] S
    );

always @(*)
 case(S)
    0: F = A;
    1: F = B;
    2: F = C;
    3: F = D;
    default F = 4'b0000;
endcase
endmodule
