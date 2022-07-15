module top_module (
    input clock,
    input a,
    output p,
    output q );
    always @(clock) begin
        if(clock)p<=a;
        else p<=p;
    end
    always @(negedge clock)begin
        if(~clock)q<=a;
    end
endmodule
