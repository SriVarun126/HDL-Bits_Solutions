//using if else
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    always @(*) begin
        if(vibrate_mode&ring) motor=1;
        else if(ring&~vibrate_mode) begin
        motor=0;
        ringer=1;
    end
    else begin
        motor=0;
        ringer=0;
    end
    end
endmodule




//Without if else
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    assign ringer = ring & ~vibrate_mode;
    assign motor = ring & vibrate_mode;
endmodule
