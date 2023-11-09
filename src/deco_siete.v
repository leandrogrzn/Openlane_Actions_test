`timescale 1ns / 1ps

module deco_siete(
    input [3:0] A,
    output reg [6:0] F 
    );

always @(*)
 case(A)
    0: F = 7'b0000001;
    1: F = 7'b1001111;
    2: F = 7'b0010010;
    3: F = 7'b0000110;
    4: F = 7'b1001100;
    5: F = 7'b0100100;
    6: F = 7'b0100000;
    7: F = 7'b0001111;
    8: F = 7'b0000000;
    9: F = 7'b0001100;
    default F = 7'b1111110;
endcase
endmodule
