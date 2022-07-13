module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q );
    integer i;
    reg [511:0]nextQ;
    always @(posedge clk) begin
        if(load) q<=data;
        else begin
            q<={1'b0,q[511:1]}^{q[510:0],1'b0};            
        end
    end
endmodule
