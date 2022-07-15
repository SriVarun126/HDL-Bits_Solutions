module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    assign Y0=({y,x}==4'b0001)|({y,x}==4'b0010)|({y,x}==4'b0101)|({y,x}==4'b0110)|({y,x}==4'b1000);
    assign z=(~y[2]&y[1]&y[0])|(y[2]&~y[1]&~y[0]);
endmodule
