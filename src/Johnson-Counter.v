`timescale 1ns/1ps
`default_nettype none

module D_flipflop(
    input wire reset, clkin, D,
    output reg Q
);
always@(posedge clkin, negedge reset)begin
    if(!reset) Q<=0;
    else Q<=D;
end
endmodule

module johnson_counter(
    input wire clkin, reset, 
    output wire [15:0] num_out
);
wire [15:0] out_internal;
D_flipflop LSB(
    .clkin(clkin),
    .reset(reset),
    .D(~out_internal[15]),
    .Q(out_internal[0])
);
genvar i;
generate
    for(i=1;i<15;i=i+1)begin:counter
        D_flipflop MID(
            .clkin(clkin),
            .reset(reset),
            .D(out_internal[i-1]),
            .Q(out_internal[i])
        );
    end
endgenerate
assign num_out = out_internal;
D_flipflop MSB(
    .clkin(clkin),
    .reset(reset),
    .D(out_internal[14]),
    .Q(out_internal[15])
);
endmodule