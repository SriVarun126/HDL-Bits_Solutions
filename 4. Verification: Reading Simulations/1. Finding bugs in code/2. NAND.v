module top_module (input a, input b, input c, output out);//
	wire temp;
    andgate inst1 ( temp,a, b, c, 1'b1,1'b1 );
	assign out=~temp;
endmodule
