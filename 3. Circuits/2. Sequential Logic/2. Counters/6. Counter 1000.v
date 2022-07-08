module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0]temp1,temp2,temp3;
    always @(*) begin
        if(reset)
            c_enable<=3'b001;
        else begin
        if(temp1==4'b1001 && temp2==4'b1001) c_enable<=3'b111;
        else if(temp1==4'b1001) c_enable<=3'b011;
        else c_enable<=3'b001;
        end
    end
    bcdcount counter0 (clk, reset, c_enable[0],temp1);
    bcdcount counter1 (clk, reset, c_enable[1],temp2);
    bcdcount counter2 (clk, reset, c_enable[2],temp3);
    assign OneHertz=(temp1==4'b1001)&&(temp2==4'b1001)&&(temp3==4'b1001);

endmodule
