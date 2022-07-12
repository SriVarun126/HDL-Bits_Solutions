module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]temp;
    always @(posedge clk) begin
        if(~resetn) temp<=0;
        else temp<={in,temp[3:1]};
    end
    assign out=temp[0];
endmodule
