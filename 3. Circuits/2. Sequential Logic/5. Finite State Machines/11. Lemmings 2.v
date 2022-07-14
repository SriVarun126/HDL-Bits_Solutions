module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
parameter LEFT=0, RIGHT=1,GROUND=2;
    reg [1:0]state, next_state,prev_state;
    always @(*) begin
        case(state)
            LEFT:begin
                if(~ground) begin next_state<=GROUND;prev_state<=LEFT; end
                else if(bump_left) begin next_state<=RIGHT;prev_state<=LEFT; end
                else begin next_state<=LEFT;prev_state<=LEFT; end
            end
            RIGHT: begin
                if(~ground) begin next_state<=GROUND;prev_state<=RIGHT; end
                else if(bump_right) begin next_state<=LEFT;prev_state<=RIGHT; end
                else begin next_state<=RIGHT;prev_state<=RIGHT;end
            end
            GROUND: begin
                if(ground) next_state<=prev_state;
                else begin next_state<=GROUND;end
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
endmodule
