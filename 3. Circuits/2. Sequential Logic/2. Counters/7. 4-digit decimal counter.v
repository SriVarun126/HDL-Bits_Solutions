module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q);
    BCD inst0(clk, reset, 1, q[3:0]);
    BCD inst1(clk, reset, q[3:0] == 9, q[7:4]);
    BCD inst2(clk, reset, q[7:4] == 9 && q[3:0] == 9, q[11:8]);
    BCD inst3(clk, reset, q[11:8] == 9 && q[7:4] == 9 && q[3:0] == 9, q[15:12]);
    
    assign ena = {q[11:8] == 9 && q[7:4] == 9 && q[3:0] == 9, q[7:4] == 9 && q[3:0] == 9, q[3:0] == 9};
    
endmodule

module BCD(input clk,input reset,input ena,output [3:0] q);
    reg [3:0] nextQ;
    always @(*) begin
        if(q == 9) nextQ = 0;
        else nextQ = q + 1;
    end
    always @(posedge clk) begin
        if(reset) q <= 0;
        else if(ena) q <= nextQ;
    end
endmodule
