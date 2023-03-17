`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/13 18:11:33
// Design Name: 
// Module Name: Single_Cycle_RISCV_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Single_Cycle_RISCV_tb();
    reg Go;
    reg Clk;
    reg RST;
    wire [31:0] IR;
    wire [31:0] LedData;
    wire [31:0] MDin;   
    wire MemWrite;
    wire [31:0] PC;
    wire [31:0] RDin;
    wire RegWrite;  
    initial
    begin
        Clk = 1'b0;
        Go = 1'b0;
        RST = 1'b0;
        #10 RST = 1'b1;
        #15 RST = 1'b0;
    end
    
    always begin
        #20 Clk = ~Clk;
    end
    
    Single_Cycle_RISCV tb(Go,Clk,RST,IR,LedData,MDin,MemWrite,PC,RDin,RegWrite);
endmodule
