module top_module();
    reg [1:0]in;
    wire out;
    andgate uut(in,out);
    initial begin
        in=2'b00;
        #10 in=2'b01;
        #10 in=2'b10;
        #10 in=2'b11;
    end
endmodule
