module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
	parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6,S7=7,S8=8,S9=9,S10=10,S11=11;
    reg [3:0]state,next_state;
    always @(*) begin
        case(state)
            S0:begin
                if(in) next_state<=S0;
                else next_state<=S1;
            end
            S1:begin
                next_state<=S2;
            end
            S2:begin
                next_state<=S3;
            end
            S3:begin
                next_state<=S4;
            end
            S4:begin
                next_state<=S5;
            end
            S5:begin
                next_state<=S6;
            end
            S6:begin
                next_state<=S7;
            end
            S7:begin                
                next_state<=S8;
            end
            S8:begin
                next_state<=S9;
            end
            S9:begin
                if(in)begin next_state<=S11;end
                else next_state<=S10;
            end
            S10:begin
                if(in) next_state<=S0;
                else next_state<=S10;
            end
            S11:begin
                if(in) next_state<=S0;
                else next_state<=S1;
            end
        endcase
    end
    always @(posedge clk) begin
        if(reset) state<=S0;
        else state<=next_state;
    end
    assign done=(state==S11);
endmodule
