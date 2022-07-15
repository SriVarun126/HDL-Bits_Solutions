module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
	parameter A=0,B=1,C=2,D=3,E=4,F=5,G=6,H=7,I=8;
    reg [3:0]state,next_state;
    always @(*) begin
        case(state)
            A:next_state<=B;
            B:next_state<=C;
            C:next_state<=x?D:C;
            D:next_state<=x?D:E;
            E:next_state<=x?F:C;
            F:next_state<=y?I:G;
            G:next_state<=y?I:H;
            H:next_state<=H;
            I:next_state<=I;
        endcase
    end
    always @(posedge clk) begin
        if(~resetn) state<=A;
        else state<=next_state;
    end
    assign f=(state==B);
    assign g=(state==F)|(state==G)|(state==I);
endmodule
