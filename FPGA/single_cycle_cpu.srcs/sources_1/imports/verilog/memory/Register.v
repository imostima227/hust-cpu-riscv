`timescale 1ns/1ps
module Register( Clock,
                 ClockEnable,
                 D,
                 Reset,
                 Q);
    parameter ActiveLevel = 1;
    parameter DATA_WIDTH = 32;

    //input
    input  Clock;
    input  ClockEnable;
    input  [DATA_WIDTH-1:0]  D;
    input  Reset;

    //output
    output[DATA_WIDTH-1:0] Q;

    //func
    reg [DATA_WIDTH-1:0] s_state_reg;
    reg [DATA_WIDTH:0] s_state_reg_neg_edge;

    assign Q = (ActiveLevel) ? s_state_reg : s_state_reg_neg_edge;
    
    initial begin
       s_state_reg <= 0;
       s_state_reg_neg_edge <= 0;
    end

    always @(posedge Clock or posedge Reset)
    begin
       if (Reset) s_state_reg <= 0;
       else if (ClockEnable) s_state_reg <= D;
    end

    always @(negedge Clock or posedge Reset)
    begin
       if (Reset) s_state_reg_neg_edge <= 0;
       else if (ClockEnable) s_state_reg_neg_edge <= D;
    end

endmodule
