`timescale 1ns/1ps
module Multiplexer_4( Enable,
                      MuxIn_0,
                      MuxIn_1,
                      MuxIn_2,
                      MuxIn_3,
                      Sel,
                      MuxOut);
    
    parameter DATA_WIDTH = 1;

    //input
    input  Enable;
    input  [DATA_WIDTH-1:0]  MuxIn_0;
    input  [DATA_WIDTH-1:0]  MuxIn_1;
    input  [DATA_WIDTH-1:0]  MuxIn_2;
    input  [DATA_WIDTH-1:0]  MuxIn_3;
    input  [1:0] Sel;

    //output
    output [DATA_WIDTH-1:0] MuxOut;

    //func
    reg [DATA_WIDTH:0] s_selected_vector;

    assign MuxOut = s_selected_vector;

    always @( *) begin
        if (~Enable) s_selected_vector <= 0;
        else case (Sel)
          2'b00:
            s_selected_vector <= MuxIn_0;
          2'b01:
            s_selected_vector <= MuxIn_1;
          2'b10:
            s_selected_vector <= MuxIn_2;
          default:
            s_selected_vector <= MuxIn_3;
        endcase
    end

endmodule