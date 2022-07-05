module top_module ( input clk, input d, output q );
    wire temp1,temp2;
    my_dff inst1(clk,d,temp1);
    my_dff inst2(clk,temp1,temp2);
    my_dff inst3(clk,temp2,q);
endmodule
