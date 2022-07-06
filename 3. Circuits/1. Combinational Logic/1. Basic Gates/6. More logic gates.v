module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    assign {out_and,out_or,out_xor,out_nand,out_nor,out_xnor,out_anotb}={a&b,a|b,a^b,~(a&b),~(a|b),~(a^b),a&~b};
endmodule
