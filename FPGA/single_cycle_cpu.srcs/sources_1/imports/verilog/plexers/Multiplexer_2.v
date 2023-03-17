`timescale 1ns/1ps
module Multiplexer_2( Enable,
                      MuxIn_0,
                      MuxIn_1,
                      Sel,
                      MuxOut);
    
    parameter DATA_WIDTH = 1;

    //input
    input  Enable;
    input  [DATA_WIDTH-1:0]  MuxIn_0;
    input  [DATA_WIDTH-1:0]  MuxIn_1;
    input  Sel;

    //output
    output [DATA_WIDTH-1:0] MuxOut;

    //func
    reg [DATA_WIDTH:0] s_selected_vector;

    assign MuxOut = s_selected_vector;

    always @( *) begin
        if (~Enable) s_selected_vector <= 0;
        else case (Sel)
          1'b0:
            s_selected_vector <= MuxIn_0;
          default:
            s_selected_vector <= MuxIn_1;
        endcase
    end

endmodule