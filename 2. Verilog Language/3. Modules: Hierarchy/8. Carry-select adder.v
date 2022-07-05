module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire temp1,temp2,temp3;
    wire [31:16]val1,val2;
    add16 inst1(a[15:0],b[15:0],0,sum[15:0],temp1);
    add16 inst2(a[31:16],b[31:16],0,val1[31:16],temp2);
    add16 inst3(a[31:16],b[31:16],1,val2[31:16],temp3);
    always @(a or b) begin
    case(temp1)
        1'b0:sum[31:16]<=val1[31:16];
        1'b1:sum[31:16]<=val2[31:16];
    endcase
    end
endmodule
