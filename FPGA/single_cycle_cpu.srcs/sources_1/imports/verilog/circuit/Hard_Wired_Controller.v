`timescale 1ns/1ps
module Hard_Wired_Controller( Funct,
                              IR21,
                              OP,
                              ALU_OP,
                              ALU_SRC,
                              AUIPC,
                              Beq,
                              Bge,
                              Bne,
                              JAL,
                              Jalr,
                              MemToReg,
                              MemWrite,
                              RegWrite,
                              S_type,
                              ecall,
                              lb,
                              uret);
    //input
    input[4:0]  Funct;
    input  IR21;
    input[4:0]  OP;

    //output
    output[3:0] ALU_OP;
    output ALU_SRC;
    output AUIPC;
    output Beq;
    output Bge;
    output Bne;
    output JAL;
    output Jalr;
    output MemToReg;
    output MemWrite;
    output RegWrite;
    output S_type;
    output ecall;
    output lb;
    output uret;

    //wire
    wire ecall_w;
    wire F12;
    wire F13;
    wire F14;
    wire F25;
    wire F30;
    wire OP2;
    wire OP3;
    wire OP4;
    wire OP5;
    wire OP6;
    wire S0;
    wire S1;
    wire S2;
    wire S3;

    //assign
    assign {F30,F25,F14,F13,F12} = Funct; 
    assign {OP6,OP5,OP4,OP3,OP2} = OP;

    Operation_Control_Unit  Operation_Control_Unit(
        F12,F13,F14,F25,F30,OP2,OP3,OP4,OP5,OP6,S0,S1,S2,S3
    );
    Control_Signals Control_Signals(
        F12,F13,F14,F25,F30,OP2,OP3,OP4,OP5,OP6,ALU_SRC,AUIPC,Beq,Bge,Bne,JAL,Jalr,lb,MemToReg,MemWrite,RegWrite,S_type,ecall_w
    );
    assign uret = IR21 & ecall_w;
    assign ecall = ~IR21 & ecall_w;
    assign ALU_OP = {S3,S2,S1,S0};
endmodule
 