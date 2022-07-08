module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    BCDms1 inst1(clk,reset,ena,ss[3:0]);
    BCDms2 inst2(clk,reset,ena&&ss[3:0]==9,ss[7:4]);
    BCDms1 inst3(clk,reset,ena&&ss[7:4]==5 && ss[3:0]==9,mm[3:0]);
    BCDms2 inst4(clk,reset,ena&&mm[3:0]==9 && ss[7:4]==5 && ss[3:0]==9,mm[7:4]);
    reg [7:0]nexthh;
    always @(posedge clk) begin
        if(reset) hh<='h12;
        else hh<=nexthh;
    end
    always @(*) begin
        if(ena && mm=='h59 && ss=='h59) begin
            if(hh=='h09) nexthh<='h10;
            else if(hh=='h10) nexthh<='h11;
            else if(hh=='h11) nexthh<='h12;
            else if(hh=='h12) nexthh<='h01;
            else nexthh<=hh+1;
        end
        else
            nexthh<=hh;
    end
    always @(posedge clk) 
    begin
        if (reset) 
            pm <= 0;
    	else if(hh ==  8'h11 && mm == 8'h59 && ss == 8'h59)
        	pm = ~pm;
    end
   // assign pm=mm[7:4]==5 && mm[3:0]==9 && ss[7:4]==5 && ss[3:0]==9 && hh[3:0]==2 && hh
endmodule

module BCDms1(input clk,input reset,input ena,output [3:0] q);
    reg [3:0] nextQ;
    always @(*) begin
        if(q==9) nextQ = 0;
        else nextQ = q + 1;
    end
    always @(posedge clk) begin
        if(reset) q <= 0;
        else if(ena) q <= nextQ;
    end
endmodule
module BCDms2(input clk,input reset,input ena,output [3:0] q);
    reg [3:0] nextQ;
    always @(*) begin
        if(q==5) nextQ = 0;
        else nextQ = q + 1;
    end
    always @(posedge clk) begin
        if(reset) q <= 0;
        else if(ena) q <= nextQ;
    end
endmodule
