module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    reg [7:0]temp1,temp2,temp3;
    parameter S0=0,S1=1,S2=2,S3=3;
    reg [1:0]state,next_state;
    always @(*) begin
        case(state)
            S0:begin
                temp1<=in;
                if(in[3]) next_state<=S1;
                else next_state<=S0;
            end
            S1:begin
                temp2<=in;
                next_state<=S2;
            end
            S2:begin
                temp3<=in;
                out_bytes<={temp1,temp2,temp3};
                next_state<=S3;
            end
            S3:begin
                if(in[3]) begin temp1<=in;next_state<=S1;end
                else next_state<=S0;
            end
        endcase
    end

    always @(posedge clk) begin
        if(reset) state<=S0;
        else state<=next_state;
    end
 
    // Output logic
    assign done=(state==S3);

    // New: Datapath to store incoming bytes.

endmodule
