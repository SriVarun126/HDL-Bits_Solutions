module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire w1,w2,w3,w4;
    assign {w1,w2,w3,w4}={p2a&&p2b,p2c&&p2d,p1a&&p1c&&p1b,p1f&&p1d&&p1e};
    assign {p2y,p1y}={w1||w2,w3||w4};

endmodule
