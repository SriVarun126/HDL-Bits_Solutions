module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always @(posedge clk)begin
        if(a==b)state<=a;
    end
    always @(*) begin
        q<=a^b^state;
    end
endmodule
