`timescale 1ns/1ps
module Control_Signals( F12,
                        F13,
                        F14,
                        F25,
                        F30,
                        OP2,
                        OP3,
                        OP4,
                        OP5,
                        OP6,
                        ALU_SRC,
                        AUIPC,
                        BEQ,
                        BGE,
                        BNE,
                        JAL,
                        JALR,
                        LB,
                        MemToReg,
                        MemWrite,
                        RegWrite,
                        S_Type,
                        ecall);
    //input
    input  F12;
    input  F13;
    input  F14;
    input  F25;
    input  F30;
    input  OP2;
    input  OP3;
    input  OP4;
    input  OP5;
    input  OP6;

    //output
    output ALU_SRC;
    output AUIPC;
    output BEQ;
    output BGE;
    output BNE;
    output JAL;
    output JALR;
    output LB;
    output MemToReg;
    output MemWrite;
    output RegWrite;
    output S_Type;
    output ecall;

    //func
    assign MemToReg = (~F14& F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2)|(~F14&~F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2);
    assign MemWrite = ~F14& F13&~F12&~OP6& OP5&~OP4&~OP3&~OP2;
    assign AUIPC = ~OP6&~OP5& OP4&~OP3& OP2;
    assign LB = ~F14&~F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2;
    assign BGE =  F14&~F13& F12& OP6& OP5&~OP4&~OP3&~OP2;
    assign ALU_SRC = (~F14&~F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(F14& F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F14&~F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14&~F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F30&~F25& F14&~F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F30&~F25& F14&~F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6& OP5&~OP4&~OP3&~OP2)|(~F14&~F13&~F12& OP6& OP5&~OP4&~OP3& OP2)|(~F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14&~F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2);
    assign RegWrite = (~F30&~F25&~F14&~F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(F30&~F25&~F14&~F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25& F14& F13& F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25& F14& F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14& F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14& F13& F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F14&~F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(F14& F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(F14&~F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14&~F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F30&~F25& F14&~F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F30&~F25& F14&~F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2)| (OP6& OP5&~OP4& OP3& OP2)|(~F14&~F13&~F12& OP6& OP5&~OP4&~OP3& OP2)|(~OP6&~OP5& OP4&~OP3& OP2)|(~F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14&~F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2);
    assign ecall = ~F30&~F25&~F14&~F13&~F12& OP6& OP5& OP4&~OP3&~OP2;
    assign S_Type = ~F14& F13&~F12&~OP6& OP5&~OP4&~OP3&~OP2;
    assign BEQ = ~F14&~F13&~F12& OP6& OP5&~OP4&~OP3&~OP2;
    assign BNE = ~F14&~F13& F12& OP6& OP5&~OP4&~OP3&~OP2;
    assign JALR = ~F14&~F13&~F12& OP6& OP5&~OP4&~OP3& OP2;
    assign JAL =   OP6& OP5&~OP4& OP3& OP2;

endmodule

