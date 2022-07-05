`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire t1,t2,t3;
    assign {t1,t2}={a&&b,c&&d};
    assign {out,out_n}={t1||t2,~(t1||t2)};
endmodule
