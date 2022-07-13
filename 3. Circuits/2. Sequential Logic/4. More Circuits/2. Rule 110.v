module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    reg [511:0]q_left,q_right;
    assign q_left={1'b0,q[511:1]};
    assign q_right={q[510:0],1'b0};
    always @(posedge clk) begin 
        if(load) q<=data;
        else 
            q<=(~q_left & q_right) | (~q & q_right) | (q & ~q_right);
    end
endmodule
