module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [99:0]temp;
    bcd_fadd inst0(a[3:0],b[3:0],cin,temp[0],sum[3:0]);
    genvar i;
    generate 
        for(i=1;i<99;i=i+1) begin:inst
            bcd_fadd ins(a[(((i+1)*4)-1):i*4],b[(((i+1)*4)-1):i*4],temp[i-1],temp[i],sum[(((i+1)*4)-1):i*4]);
        end
    endgenerate
    bcd_fadd inst399(a[399:396],b[399:396],temp[98],cout,sum[399:396]);
endmodule
