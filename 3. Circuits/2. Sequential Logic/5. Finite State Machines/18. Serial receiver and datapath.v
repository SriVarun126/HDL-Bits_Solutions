module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
	parameter A=0,B=1,C=2,D=3,E=4,F=5,G=6,H=7,I=8,J=9,K=10,L=11;
    reg [3:0]state,next_state;
    reg [7:0]temp;
    always @(*) begin
        case(state)
            A:next_state<=in?A:B;
            B:next_state<=C;
            C:next_state<=D;
            D:next_state<=E;
            E:next_state<=F;
            F:next_state<=G;
            G:next_state<=H;
            H:next_state<=I;
            I:next_state<=J;
            J:next_state<=in?K:L;
            K:next_state<=in?A:B;
            L:next_state<=in?A:L;
            default:next_state<=A;
        endcase
    end
    always @(posedge clk) begin
        if(reset) begin state<=A;end
        else begin state<=next_state;end
    end
    always @(posedge clk) begin
        if(reset) temp='d0;
        else begin
        	case(state)
            	B,C,D,E,F,G,H,I:temp<={in,temp[7:1]};
            	default:temp<=temp;
        	endcase
        end
    end
    assign done=(state==K);
    assign out_byte=temp;
endmodule
