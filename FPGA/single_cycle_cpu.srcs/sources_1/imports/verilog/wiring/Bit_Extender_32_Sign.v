`timescale 1ns/1ps
module Bit_Extender_32_Sign( imm_in,
                             imm_out);

    parameter DATA_WIDTH = 8;

    //input
    input [DATA_WIDTH-1:0] imm_in;

    //output
    output reg [31:0] imm_out;

    always @( *) begin
        imm_out = {{(32-DATA_WIDTH){imm_in[DATA_WIDTH-1]}}, imm_in};
    end

endmodule
