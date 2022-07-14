module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    reg [2:0]state,next_state;
    always @(*) begin
        case(state)
            A:next_state<=s[1]?B:A;
            B:next_state<=s[2]?C:s[1]?B:A;
            C:next_state<=s[3]?D:s[2]?C:F;
            D:next_state<=s[3]?D:E;
            E:next_state<=s[2]?(s[3]?D:E):F;
            F:next_state<=s[1]?(s[2]?C:F):A;
        endcase
    end
    always @(posedge clk)begin
        if(reset) state<=A;
        else state<=next_state;
    end
    always @(*) begin
        case(state)
            A:begin fr1<=1;fr2<=1;fr3<=1;dfr<=1;end
            B:begin fr1<=1;fr2<=1;fr3<=0;dfr<=0;end
            C:begin fr1<=1;fr2<=0;fr3<=0;dfr<=0;end
            D:begin fr1<=0;fr2<=0;fr3<=0;dfr<=0;end
            E:begin fr1<=1;fr2<=0;fr3<=0;dfr<=1;end
            F:begin fr1<=1;fr2<=1;fr3<=0;dfr<=1;end
        endcase
    end
endmodule
