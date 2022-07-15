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
	parameter LEFT=0, RIGHT=1,GROUND=2,DIG=3,SPLAT=4,TEMP=5;
    reg [2:0]state, next_state,prev_state;
    reg [4:0]count;
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
                if(count==20 & ground) next_state<=SPLAT;
                else if(count==20) next_state<=TEMP;
                else if(ground) next_state<=prev_state;
                else begin next_state<=GROUND;end
            end
            DIG: begin
                if(ground) next_state<=DIG;
                else next_state<=GROUND;
            end
            SPLAT: begin
                next_state<=SPLAT;
            end
            TEMP: begin
                if(ground) next_state<=SPLAT;
                else next_state<=TEMP;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) begin state<=LEFT; end
        else 
           	begin 
            	state<=next_state;
            end
    end
    always @(posedge clk, posedge areset) begin
        if(areset) count<=5'd0;
        else if(state==GROUND) count<=count+1'b1;
        else count<=5'd0;
    end

    
    assign walk_left = (state == LEFT)&(state!=GROUND)&~(state==SPLAT);
    assign walk_right = (state == RIGHT)&(state!=GROUND)&~(state==SPLAT);
    assign aaah = (state==GROUND)|(state==TEMP);
    assign digging = (state==DIG)&~(state==SPLAT);
endmodule
