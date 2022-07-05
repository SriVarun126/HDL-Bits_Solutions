// Using if else
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(in) begin
        if(in[0]==1) 
            pos=2'b00;
        else if(in[1]==1)
            pos=2'b01;
        else if(in[2]==1)
            pos=2'b10;
        else if(in[3]==1)
            pos=2'b11;
        else
            pos=0;
    end
endmodule



//Using Case
module top_module (
	input [3:0] in,
	output reg [1:0] pos
);

	always @(*) begin			
		case (in)
			4'h0: pos = 2'h0;	
			4'h1: pos = 2'h0;
			4'h2: pos = 2'h1;
			4'h3: pos = 2'h0;
			4'h4: pos = 2'h2;
			4'h5: pos = 2'h0;
			4'h6: pos = 2'h1;
			4'h7: pos = 2'h0;
			4'h8: pos = 2'h3;
			4'h9: pos = 2'h0;
			4'ha: pos = 2'h1;
			4'hb: pos = 2'h0;
			4'hc: pos = 2'h2;
			4'hd: pos = 2'h0;
			4'he: pos = 2'h1;
			4'hf: pos = 2'h0;
			default: pos = 2'b0;	
		endcase
  end
endmodule
