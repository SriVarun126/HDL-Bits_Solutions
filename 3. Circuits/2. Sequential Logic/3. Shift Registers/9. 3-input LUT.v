module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [0:7]temp;
    always @(posedge clk) begin
        if(enable) temp<={S,temp[0:6]};
        else temp<=temp;
    end
    always @(*) begin
        case({A,B,C})
            3'b000:Z=temp[0];
            3'b001:Z=temp[1];
            3'b010:Z=temp[2];
            3'b011:Z=temp[3];
            3'b100:Z=temp[4];
            3'b101:Z=temp[5];
            3'b110:Z=temp[6];
            3'b111:Z=temp[7];
        endcase
    end
endmodule
