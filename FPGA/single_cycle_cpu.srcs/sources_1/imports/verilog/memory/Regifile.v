`timescale 1ns/1ps
module Regifile( Clk,
                 Din,
                 R1addr,
                 R2addr,
                 WE,
                 Waddr,
                 R1,
                 R2);
    //input
    input  Clk;
    input[31:0]  Din;
    input[4:0]  R1addr;
    input[4:0]  R2addr;
    input  WE;
    input[4:0]  Waddr;

    //output
    output[31:0] R1;
    output[31:0] R2;

    //func
    reg [31:0] mem[31:0];

    initial begin
        $readmemh("D:\\pro\\principles_of_computer_composition\\cpu24-riscv\\Single_Cycle_RISCV2\\single_cycle_cpu\\single_cycle_cpu.srcs\\sources_1\\imports\\verilog\\memory\\initial.txt",mem);
    end


    always @(posedge Clk) begin
        if (WE) begin
            if(Waddr != 5'b00000) begin
                mem[Waddr] <= Din;
            end
        end
    end
    assign R1 = mem[R1addr];
    assign R2 = mem[R2addr];
endmodule
    
    