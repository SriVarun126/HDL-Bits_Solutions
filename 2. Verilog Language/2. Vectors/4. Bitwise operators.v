module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign {out_or_bitwise,out_or_logical,out_not}={a|b,a||b,{~b,~a}};
    
endmodule
