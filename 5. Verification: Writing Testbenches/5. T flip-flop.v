module top_module ();
    reg clk,reset,t;
    wire q;
    tff uut(clk,reset,t,q);
    initial begin
        clk=0;reset=0;t=0;
        #10 reset=1;
        #10 reset=0;
        #10 t=1;
    end
    always #5 clk=~clk;
endmodule
