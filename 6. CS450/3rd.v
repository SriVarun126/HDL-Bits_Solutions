module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);
    reg [31:0]history;
    always @(posedge clk,posedge areset)begin
        if(areset)history<='0;
        else if(train_mispredicted) history<={train_history[30:0],train_taken};
        else if(predict_valid) history<={history[30:0],predict_taken};
        else history<=history;
    end
    assign predict_history=history;
endmodule
