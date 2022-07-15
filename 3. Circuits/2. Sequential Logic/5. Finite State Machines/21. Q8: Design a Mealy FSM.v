module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
	parameter A=0,B=1,C=2,D=3;
    reg [1:0]state,next_state;
    always @(*) begin
        case(state)
            A:next_state<=x?B:A;
            B:next_state<=x?B:C;
            C:next_state<=x?D:A;
            D:next_state<=x?B:C;
        endcase
    end
    always @(posedge clk,negedge aresetn) begin
        if(~aresetn) state<=A;
        else state<=next_state;
    end
    assign z=(next_state==D);
endmodule
