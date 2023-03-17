`timescale 1ns/1ps
module Multiplexer_8( Enable,
                      MuxIn_0,
                      MuxIn_1,
                      MuxIn_2,
                      MuxIn_3,
                      MuxIn_4,
                      MuxIn_5,
                      MuxIn_6,
                      MuxIn_7,
                      Sel,
                      MuxOut);
    
    parameter DATA_WIDTH = 1;

    //input
    input  Enable;
    input  [DATA_WIDTH-1:0]  MuxIn_0;
    input  [DATA_WIDTH-1:0]  MuxIn_1;
    input  [DATA_WIDTH-1:0]  MuxIn_2;
    input  [DATA_WIDTH-1:0]  MuxIn_3;
    input  [DATA_WIDTH-1:0]  MuxIn_4;
    input  [DATA_WIDTH-1:0]  MuxIn_5;
    input  [DATA_WIDTH-1:0]  MuxIn_6;
    input  [DATA_WIDTH-1:0]  MuxIn_7;
    input  [2:0] Sel;

    //output
    output [DATA_WIDTH-1:0] MuxOut;

    //func
    reg [DATA_WIDTH:0] s_selected_vector;

    assign MuxOut = s_selected_vector;

    always @( *) begin
        if (~Enable) s_selected_vector <= 0;
        else case (Sel)
          3'b000:
            s_selected_vector <= MuxIn_0;
          3'b001:
            s_selected_vector <= MuxIn_1;
          3'b010:
            s_selected_vector <= MuxIn_2;
          3'b011:
            s_selected_vector <= MuxIn_3;
          3'b100:
            s_selected_vector <= MuxIn_4;
          3'b101:
            s_selected_vector <= MuxIn_5;
          3'b110:
            s_selected_vector <= MuxIn_6;
          default:
            s_selected_vector <= MuxIn_7;
        endcase
    end

endmodule