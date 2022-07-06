//Structural model
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire temp[2:0];
    adder inst0(x[0],y[0],0,sum[0],temp[0]);
    adder inst1(x[1],y[1],temp[0],sum[1],temp[1]);
    adder inst2(x[2],y[2],temp[1],sum[2],temp[2]);
    adder inst3(x[3],y[3],temp[2],sum[3],sum[4]);
endmodule
module adder(input a, b, cin,output sum, cout );
	assign sum=a^b^cin;
    assign cout=a&b|b&cin|cin&a;
endmodule


//Behavioural model
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    assign sum = x+y;
endmodule
