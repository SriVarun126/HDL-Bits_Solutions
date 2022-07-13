module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q );
    integer i,j,count;
    reg [323:0]pad; //data padding vector
    wire [255:0]nextQ;
    always @(*) begin
    	pad[17:0]={q[240],q[255:240],q[255]};
    	pad[323:306]={q[0],q[15:0],q[15]};
        for(j=1;j<17;j=j+1) begin
            pad[j*18+:18]={q[(j-1)*16],q[((j-1)*16)+:16],q[(j*16)-1]};
    	end
        for(i=0;i<16;i=i+1) begin
            for(j=0;j<16;j=j+1) begin
                count=pad[(i+1)*18+j+1-1]+pad[(i+1)*18+j+1+1]+pad[i*18+j+1-1]+pad[i*18+j+1]+pad[i*18+j+1+1]+pad[(i+2)*18+j+1-1]+pad[(i+2)*18+j+1]+pad[(i+2)*18+j+1+1];
                if(count<=1 | count>=4) nextQ[i*16+j]=0;
                else if (count==3) nextQ[i*16+j]=1;
                else nextQ[i*16+j]=q[i*16+j];
            end
        end
    end
    always @(posedge clk) begin
        if(load) q<=data;
        else q<=nextQ;
    end
endmodule
