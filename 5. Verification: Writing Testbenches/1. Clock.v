module top_module ( );
    reg clk;
    dut uut(clk);
    initial clk=0;
    always #5 clk=~clk;
endmodule
