`timescale 1ns/1ps
module Counter_pc(clk,RST,clk_en,out);
    input                   clk;
    input                   RST;
    input                   clk_en;
    output reg [31:0]        out;
        initial begin
            out <= 32'h0000_0000;
        end;
    always @(posedge clk or posedge RST)  begin
        if(RST) out <= 32'h0000_0000;
        else if(clk_en) out <= out + 1;
    end
endmodule