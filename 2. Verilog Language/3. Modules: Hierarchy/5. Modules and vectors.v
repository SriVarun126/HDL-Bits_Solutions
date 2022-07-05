module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0]temp1,temp2,temp3;
    my_dff8 inst1(clk,d,temp1);
	my_dff8 inst2(clk,temp1,temp2);
    my_dff8 inst3(clk,temp2,temp3);
    always @(*) begin
        case(sel)
            2'b11:q<=temp3;
            2'b10:q<=temp2;
            2'b01:q<=temp1;
            2'b00:q<=d;
        endcase
    end
endmodule
