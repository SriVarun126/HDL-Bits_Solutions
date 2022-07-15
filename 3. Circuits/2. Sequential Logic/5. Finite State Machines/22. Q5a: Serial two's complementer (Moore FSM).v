module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
	parameter A=0,B=1,C=2;
    reg [1:0]state,next_state;
    always @(*) begin
        case(state)
            A:next_state<=x?B:A;
            B:next_state<=x?C:B;
            C:next_state<=x?C:B;
        endcase
    end
    always @(posedge clk,posedge areset) begin
        if(areset) state<=A;
        else state<=next_state;
    end
    assign z=(state==B);
endmodule
