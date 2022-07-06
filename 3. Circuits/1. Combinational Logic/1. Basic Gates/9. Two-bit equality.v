//Using if else
module top_module ( input [1:0] A, input [1:0] B, output z ); 
    always @(*) begin
        if(A==B) z=1;
        else z=0;
    end
endmodule


//Without if else 
module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z = (A[1:0]==B[1:0]);
endmodule
