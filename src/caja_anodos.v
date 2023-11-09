`timescale 1ns / 1ps

module caja_anodos(
    input [1:0]  A,
    output reg [3:0] F
    );
    
always @(*)
 case(A)
    0: F = 4'b1110;
    1: F = 4'b1101;
    2: F = 4'b1011;
    3: F = 4'b0111;
    default F = 4'b0000;
endcase
endmodule

