`timescale 1ns/1ps
module cpu( Clk,
            Go,
            RST,
            Clk_Rate_Sel,
            PC_Sel,
            IR_Sel,
            Clk_Count_Sel,
            Normal_Sel,
            SEG,
            NA);

    //input
    input Clk;
    input Go;
    input RST;
    input Clk_Rate_Sel;
    input PC_Sel;
    input IR_Sel;
    input Clk_Count_Sel;
    input Normal_Sel;
    //output 
    output [7:0] SEG;
    output [7:0] NA;

    //wire
    wire [31:0] wire_PC;
    wire [31:0] wire_IR;
    wire [31:0] wire_RDin;
    wire [31:0] wire_MDin;
    wire [31:0] wire_LedData;
    wire wire_RegWrite;
    wire wire_MemWrite;
    wire [4:0] Display_Sel;

    //func
    assign Display_Sel = {Clk_Rate_Sel,PC_Sel,IR_Sel,Clk_Count_Sel,Normal_Sel};
    Single_Cycle_RISCV  Single_Cycle_RISCV(~Go,Clk,RST,Display_Sel,IR,LedData,MDin,MemWrite,PC,RDin,RegWrite,NA,SEG);
 
 endmodule