module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
	parameter A=0,B=1,C=2,D=3;
    reg [1:0]state,next_state;
    always @(*) begin
        case(state)
            A:begin
                if(r[1])next_state<=B;
                else if(~r[1]&r[2])next_state<=C;
                else if(~r[1]&~r[2]&r[3])next_state<=D;
                else next_state<=A;
            end
            B:next_state<=r[1]?B:A;
            C:next_state<=r[2]?C:A;
            D:next_state<=r[3]?D:A;
        endcase
    end
    always @(posedge clk) begin
        if(~resetn) state<=A;
        else state<=next_state;
    end
    assign g[1]=(state==B);
    assign g[2]=(state==C);
    assign g[3]=(state==D);
endmodule
