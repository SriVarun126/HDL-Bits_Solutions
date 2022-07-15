module top_module (
    input clk,
    input reset,
    output [9:0] q);
    always @(posedge clk) begin
        if(reset|q=='d999)q<='d0;
    	else q<=q+1;
    end
endmodule
