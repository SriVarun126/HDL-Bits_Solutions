module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
parameter LEFT=0, RIGHT=1,GROUND=2,DIG=3;
    reg [1:0]state, next_state,prev_state;
    always @(*) begin
        case(state)
            LEFT:begin
                prev_state<=LEFT;
                if(dig & ground) begin next_state<=DIG; end
                else if(~ground) begin next_state<=GROUND; end
                else if(bump_left) begin next_state<=RIGHT;prev_state<=RIGHT; end
                else begin next_state<=LEFT; end
            end
            RIGHT: begin
                prev_state<=RIGHT;
                if(dig & ground) begin next_state<=DIG; end
                else if(~ground) begin next_state<=GROUND; end
                else if(bump_right) begin next_state<=LEFT;prev_state<=LEFT; end
                else begin next_state<=RIGHT; end
            end
            GROUND: begin
                if(ground) next_state<=prev_state;
                else begin next_state<=GROUND;end
            end
            DIG: begin
                if(ground) next_state<=DIG;
                else next_state<=GROUND;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state<=LEFT;
        else 
           	begin 
            	state<=next_state;
            end
    end

    
    assign walk_left = (state == LEFT)&(state!=GROUND);
    assign walk_right = (state == RIGHT)&(state!=GROUND);
    assign aaah = (state==GROUND);
    assign digging = (state==DIG);
endmodule
