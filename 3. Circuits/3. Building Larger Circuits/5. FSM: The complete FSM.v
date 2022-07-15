module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
	parameter A=0,B=1,C=2,D=3,E=5,F=6,G=7,H=8,I=9,J=10;
    reg [3:0]state,next_state;
    always @(*) begin
        case(state)
            A:next_state<=data?B:A;
            B:next_state<=data?C:A;
            C:next_state<=data?C:D;
            D:next_state<=data?E:A;
            E:next_state<=F;
            F:next_state<=G;
            G:next_state<=H;
            H:next_state<=I;
            I:next_state<=done_counting?J:I;
            J:next_state<=ack?A:J;
        endcase
    end
    always @(posedge clk) begin
        if(reset) state<=A;
        else state<=next_state;
    end
    assign shift_ena=(state==E)|(state==F)|(state==G)|(state==H);
    assign counting=(state==I);
    assign done=(state==J);
endmodule
