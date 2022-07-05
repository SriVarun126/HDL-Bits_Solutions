module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    FA inst0(a[0],b[0],cin,sum[0],cout[0]);
    genvar i;
    generate 
        for(i=1;i<100;i=i+1)begin:Full_Adder
            FA inst(a[i],b[i],cout[i-1],sum[i],cout[i]);
        end
    endgenerate
endmodule
module FA(input a,b,cin, output sum,cout);
    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(cin&a);
endmodule
