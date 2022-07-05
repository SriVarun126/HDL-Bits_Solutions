module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire temp1,temp2;
    add16 inst1(a[15:0],b[15:0],0,sum[15:0],temp1);
    add16 inst2(a[31:16],b[31:16],temp1,sum[31:16],temp2);
endmodule

//Full Adder
module add1 ( input a, input b, input cin,   output sum, output cout );

    assign sum = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
endmodule
