module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
	parameter A=0,B=1,C=2,D=3,E=4,F=5;
    reg [2:0]state,next_state;
    always @(*) begin
        case(state)
            A:next_state<=w?A:B;
            B:next_state<=w?D:C;
            C:next_state<=w?D:E;
            D:next_state<=w?A:F;
            E:next_state<=w?D:E;
            F:next_state<=w?D:C;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state<=A;
        else state<=next_state;
    end
    assign z=(state==E)|(state==F);
endmodule
