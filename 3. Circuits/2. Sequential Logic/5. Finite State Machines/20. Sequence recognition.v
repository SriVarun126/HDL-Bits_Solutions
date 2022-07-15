module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
	parameter A=0,B=1,C=2,D=3,E=4,F=5,G=6,H=7,I=8,J=9;
    reg [4:0]state,next_state;
    always @(*) begin
        case(state)
            A:next_state<=in?B:A;
            B:next_state<=in?C:A;
            C:next_state<=in?D:A;
            D:next_state<=in?E:A;
            E:next_state<=in?F:A;
            F:next_state<=in?G:H;
            G:next_state<=in?I:J;
            H:next_state<=in?B:A;
            I:next_state<=in?I:A;
            J:next_state<=in?B:A;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state<=A;
        else state<=next_state;
    end
    assign disc=(state==H);
    assign flag=(state==J);
    assign err=(state==I);
endmodule
