module top_module (
    input clk,
    input x,
    output z
); 
	wire temp1,temp2,temp3;
    always @(posedge clk) begin
        temp1<=temp1^x;
        temp2<=~temp2&x;
        temp3<=~temp3|x;
    end 
    assign z=~(temp1|temp2|temp3);
endmodule
