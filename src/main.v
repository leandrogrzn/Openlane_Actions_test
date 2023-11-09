//Garzón Nieto Leandro José - 2194232
//Figueroa Munar Brandon - 2194101
`timescale 1ns / 1ps

module main(
    input A,
    input B,
    input CLK,
    output [6:0] Salida,
    output [3:0] anodos,
    output [3:0] horas
    );
   
wire w1,w2,w3,w4,w5,w12;
wire [3:0] w7,w8,w9,w10,w11;
wire [1:0] w6;

reg q;

always @ (posedge CLK)
  if (A) begin
    q <= !q;
  end else
  q <= q;
  




divisor_fr #(.max_cuenta(100_000_001),.bits(27)) contador_A(
    .CLK(CLK),
    .RST(B),    
    .CE(q),
    .FIN_CUENTA(w1)
); 

divisor_fr #(.max_cuenta(10),.bits(4)) U_S(
    .CLK(CLK),
    .RST(B),
    .CE(w1),
    .CUENTA(w7),
    .FIN_CUENTA(w2)
);

divisor_fr #(.max_cuenta(6),.bits(4)) D_S(
    .CLK(CLK),
    .RST(B),
    .CE(w2),
    .CUENTA(w8),
    .FIN_CUENTA(w3)
);

divisor_fr #(.max_cuenta(10),.bits(4)) U_M(
    .CLK(CLK),
    .RST(B),
    .CE(w3),
    .CUENTA(w9),
    .FIN_CUENTA(w4)
);

divisor_fr #(.max_cuenta(6),.bits(4)) D_M(
    .CLK(CLK),
    .RST(B),
    .CE(w4),
    .CUENTA(w10),
    .FIN_CUENTA(w12)
);

divisor_fr #(.max_cuenta(12),.bits(4)) H(
    .CLK(CLK),
    .RST(B),
    .CE(w12),
    .CUENTA(horas)
);

divisor_fr #(.max_cuenta(99_999),.bits(19)) contador_G(
    .CLK(CLK),
    .RST(1'd0),
    .CE(1'd1),
    .FIN_CUENTA(w5)
);

divisor_fr #(.max_cuenta(4),.bits(2)) contador_F(
    .CLK(CLK),
    .RST(1'd0),
    .CE(w5),
    .CUENTA(w6)
);

caja_anodos U0 (
    .A(w6),
    .F(anodos)
);

mux_4a1 M1 (
    .A(w7),
    .B(w8),
    .C(w9),
    .D(w10),
    .F(w11),
    .S(w6)
);

deco_siete T0 (
    .A(w11),
    .F(Salida)
);

endmodule
