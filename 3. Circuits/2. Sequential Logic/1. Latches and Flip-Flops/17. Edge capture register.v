module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]temp;
    integer i=0;
    always @(posedge clk) begin
        if(reset) begin 
            out<=0;
            temp<=in;
        end
        else begin
            for(i=0;i<32;i=i+1) begin
                if(temp[i]==1&in[i]==0) begin
                    temp[i]<=in[i];
                    out[i]<=1'b1; 
                end
                else begin temp[i]<=in[i]; out[i]<=out[i]; end
            end
        end
    end
endmodule
