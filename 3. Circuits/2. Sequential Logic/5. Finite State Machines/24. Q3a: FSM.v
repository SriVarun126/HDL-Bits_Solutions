module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
	parameter A=0,B=1;
    reg state,next_state;
    reg [1:0]count,count_clk;
    always @(*) begin
        case(state)
            A:next_state<=s?B:A;
            B:next_state<=B;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state<=A;
        else state<=next_state;
    end
    always @(posedge clk) begin
        if(reset | state==A)begin count<=0;count_clk<=0;end
        else if(count_clk==3)begin count<=w;count_clk=1;end
        else begin count<=count+w;count_clk<=count_clk+1;end
    end
    assign z=(count==2)&(count_clk==3);
endmodule
