module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire temp1,temp2;
    wire [31:0]val;
    assign val=b^{32{sub}};
    add16 inst1(a[15:0],val[15:0],sub,sum[15:0],temp1);
    add16 inst2(a[31:16],val[31:16],temp1,sum[31:16],temp2);
endmodule
