module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    adder inst0(a[0],b[0],cin,sum[0],cout[0]);
    adder inst1(a[1],b[1],cout[0],sum[1],cout[1]);
    adder inst2(a[2],b[2],cout[1],sum[2],cout[2]);
endmodule
module adder(input a, b, cin,output sum, cout );
	assign sum=a^b^cin;
    assign cout=a&b|b&cin|cin&a;
endmodule
