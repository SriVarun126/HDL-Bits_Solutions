//Ports by name
module top_module ( input a, input b, output out );
    mod_a inst(.in1(a),.in2(b),.out(out));
endmodule



//Ports by position
module top_module ( input a, input b, output out );
    mod_a inst(a,b,out);
endmodule
