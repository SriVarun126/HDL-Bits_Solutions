module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
	parameter A=0,B=1,C=2,D=3,E=5,F=6,G=7,H=8,I=9,J=10;
    reg [3:0]state,next_state;
    wire shift_ena,done_counting;
    reg [9:0]counter;
    reg [3:0]delay;
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
    always @(posedge clk) begin
        if(reset) counter<='d0;
        else if(counter=='d999) counter<='d0;
        else if(counting)counter<=counter+1;
        else counter<=counter;
    end
    always @(posedge clk) begin
        if(reset)delay<='d0;
        else if(shift_ena)delay<={delay[2:0],data};
        else if (counter=='d999)delay<=delay-1;
        else delay<=delay;
    end
    always @(posedge clk)begin
        if(reset)counting<=0;
        else if (next_state==I) counting<=1;
        else counting<=0;
    end
    always @(posedge clk)begin
        if(reset)done<=0;
        else if (next_state==J)done<=1;
        else done<=0;
    end
    assign shift_ena=(state==E)|(state==F)|(state==G)|(state==H);
    assign count=delay;
    assign done_counting=(count==0&counter=='d999);
endmodule
