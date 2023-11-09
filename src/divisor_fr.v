`timescale 1ns / 1ps

module divisor_fr #(parameter max_cuenta=5, bits=3) (
    input CLK, RST,
    input CE,
    output FIN_CUENTA,
    output reg [bits-1:0] CUENTA = {bits{1'b0}}
    );
    
wire [bits-1:0] d;
wire reset_reg;

assign d =  CUENTA + 1;
assign FIN_CUENTA = (CUENTA>=max_cuenta);
assign reset_reg = RST | FIN_CUENTA;



always @(posedge CLK)
    if (reset_reg)
        CUENTA <= {bits{1'b0}};
    else if (CE)
        CUENTA <= d;

endmodule
