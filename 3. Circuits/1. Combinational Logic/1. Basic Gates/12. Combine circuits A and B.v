module top_module (input x, input y, output z);
    wire temp1,temp2,temp3,temp4;
    A inst1(x,y,temp1);
    B inst2(x,y,temp2);
    A inst3(x,y,temp3);
    B inst4(x,y,temp4);
    assign z=(temp1|temp2)^(temp3&temp4);
endmodule
module A (input x, input y, output z);
    assign  z = (x^y) & x;
endmodule
module B ( input x, input y, output z );
    assign z=~(x^y);
endmodule
