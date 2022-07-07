module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    always @(posedge clk) begin
        if({j,k}==2'b00) Q<=Q;
        else if({j,k}==2'b01) Q<=0;
        else if({j,k}==2'b10) Q<=1;
        else Q<=~Q;
    end
endmodule
