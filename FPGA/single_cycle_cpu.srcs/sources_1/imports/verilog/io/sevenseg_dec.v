`timescale 1ns/1ps
module sevenseg_dec(
    input [3:0]         data,
    output reg [7:0]    segments
);
	 always @(data) begin
        case(data)
            4'h0: segments = 8'b11000000;
            4'h1: segments = 8'b11111001;
            4'h2: segments = 8'b10100100;
            4'h3: segments = 8'b10110000;
            4'h4: segments = 8'b10011001;
            4'h5: segments = 8'b10010010;
            4'h6: segments = 8'b10000010;
            4'h7: segments = 8'b11111000;
            4'h8: segments = 8'b10000000;
            4'h9: segments = 8'b10011000;
            4'ha: segments = 8'b10001000;
            4'hb: segments = 8'b10000011;
            4'hc: segments = 8'b11000110;
            4'hd: segments = 8'b10100001;
            4'he: segments = 8'b10000110;
            4'hf: segments = 8'b10001110;
            default: segments = 8'b111_1111_1;
        endcase
    end
endmodule
