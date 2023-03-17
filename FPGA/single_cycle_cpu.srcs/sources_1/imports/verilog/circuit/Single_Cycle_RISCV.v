`timescale 1ns/1ps
module Single_Cycle_RISCV( Go,
                           Clk,
                           RST,
                           Display_Sel,
                           IR,
                           LedData,
                           MDin,
                           MemWrite,
                           PC,
                           RDin,
                           RegWrite,
                           NA,
                           SEG);
    // input
    input  Go;
    input  Clk;
    input  RST;
    input [4:0] Display_Sel;
    //output
    output[31:0] IR;
    output[31:0] LedData;
    output[31:0] MDin;
    output MemWrite;
    output[31:0] PC;
    output[31:0] RDin;
    output RegWrite;
    output[7:0] SEG;
    output[7:0] NA;

    //wire
    wire wire_Clk_N;
    wire wire_Clk_N1;
    wire wire_Clk_N2;
    wire [31:0] wire_Cycle;
    wire [31:0] wire_pc4;
    wire [31:0] wire_branch_addr;
    wire [31:0] wire_mux21_out; //PC
    wire wire_halt;
    wire [31:0] wire_PC_reg_out;
    wire [31:0] wire_IR;
    wire wire_JAL;
    wire wire_JALR;
    wire wire_URET;
    wire wire_AUIPC;
    wire wire_LB;
    wire wire_Beq;
    wire wire_Bge;
    wire wire_Bne;
    wire wire_MemToReg;
    wire wire_MemWrite;
    wire [3:0] wire_AluOP;
    wire wire_AluSrcB;
    wire wire_RegWrite;
    wire wire_S_Type;
    wire wire_ecall;
    wire [4:0] wire_mux22_out; //rs1
    wire [4:0] wire_mux23_out; //rs2
    wire [11:0] wire_mux24_out; //I/S
    wire [31:0] wire_R1;
    wire [31:0] wire_R2;
    wire [31:0] wire_MDin;
    wire [31:0] wire_extender1_out; //I/S
    wire [31:0] wire_mux25_out; //ALU
    wire wire_equal;
    wire [31:0] wire_Alu_out;
    wire [1:0] wire_sel;
    wire [31:0] wire_Ram_out;
    wire [31:0] wire_mux41_out; //LB
    wire [31:0] wire_mux42_out; //sel
    wire [31:0] wire_RDin; //J/AUIPC
    wire [31:0] wire_adder1_out; //R1 + I_imm
    wire [31:0] wire_and1_out; //mux81
    wire [31:0] wire_extender2_out; //B
    wire [31:0] wire_extender3_out; //J
    wire [31:0] wire_extender4_out; //U
    wire [31:0] wire_extender5_out; //mux41_1
    wire [31:0] wire_extender6_out; //mux41_2
    wire [31:0] wire_extender7_out; //mux41_3
    wire [31:0] wire_extender8_out; //mux41_4
    wire [31:0] wire_shifter1_out; //B
    wire [31:0] wire_shifter2_out; //J
    wire [31:0] wire_shifter3_out; //U
    wire [31:0] wire_adder2_out; //B
    wire [31:0] wire_adder3_out; //J
    wire [31:0] wire_AUIPC_res;
    wire wire_GreaterOrEqual;
    wire [2:0] wire_Instr;
    wire wire_J;
    wire wire_PCSrc;
    wire wire_R1_MDin_Greater;
    wire wire_R1_MDin_Equal;
    wire wire_R1_0x22_Equal;
    wire [4:0] wire_Display_Sel_Reg_out;
    wire [1:0] wire_Display_Sel;
    wire [31:0] wire_FDGA_in;
    //assign
    assign IR = wire_IR;
    assign MDin = wire_MDin;
    assign MemWrite = wire_MemWrite;
    assign PC = wire_PC_reg_out;
    assign RDin = wire_RDin;
    assign RegWrite = wire_RegWrite;
    assign wire_pc4 = wire_PC_reg_out + 4;
    assign wire_and1_out = wire_adder1_out & 32'hffff_fffe;
    assign wire_sel = wire_Alu_out[1:0];
    assign wire_MDin = wire_R2;
    assign wire_J = wire_JAL | wire_JALR;
    assign wire_GreaterOrEqual = wire_R1_MDin_Equal | wire_R1_MDin_Greater;
    assign wire_PCSrc = (wire_GreaterOrEqual & wire_Bge) + 
                        (wire_Beq & wire_equal) + 
                        (wire_Bne & ~wire_equal) + wire_J;
    assign wire_Instr = {wire_JAL,(wire_Beq | wire_Bge | wire_Bne), wire_JALR};
    assign wire_Display_Sel = (wire_Display_Sel_Reg_out[3] == 1'b1) ? 2'b11 :(
                            (wire_Display_Sel_Reg_out[2] == 1'b1) ? 2'b10 :(
                          (wire_Display_Sel_Reg_out[1] == 1'b1) ? 2'b01: 2'b00
      )                            
    );
    //func
    divider_pc #(.N(100_1000)) divider1(Clk,wire_Clk_N1);
    divider_pc #(.N(1000_1000)) divider2(Clk,wire_Clk_N2);
    Counter_pc Counter_pc (wire_Clk_N,RST,~wire_halt,wire_Cycle);

    Multiplexer_2 #(.DATA_WIDTH(32)) mux21(1'b1,wire_pc4,wire_branch_addr,wire_PCSrc,wire_mux21_out);
    Multiplexer_2 #(.DATA_WIDTH(5)) mux22(1'b1,wire_IR[19:15],5'b10001,wire_ecall,wire_mux22_out);
    Multiplexer_2 #(.DATA_WIDTH(5)) mux23(1'b1,wire_IR[24:20],5'b01010,wire_ecall,wire_mux23_out);
    Multiplexer_2 #(.DATA_WIDTH(12)) mux24(1'b1,wire_IR[31:20],{wire_IR[31:25],wire_IR[11:7]},wire_S_Type,wire_mux24_out);
    Multiplexer_2 #(.DATA_WIDTH(32)) mux25(1'b1,wire_R2,wire_extender1_out,wire_AluSrcB,wire_mux25_out);
    Multiplexer_2 #(.DATA_WIDTH(1)) mux26(1'b1,(wire_ecall & ~wire_R1_0x22_Equal),1'b0,Go,wire_halt);
    Multiplexer_2 #(.DATA_WIDTH(1)) mux27(1'b1,wire_Clk_N1,wire_Clk_N2,wire_Display_Sel_Reg_out[4],wire_Clk_N);
    Multiplexer_4 #(.DATA_WIDTH(32)) mux41(1'b1,wire_Alu_out,wire_Ram_out,0,wire_mux42_out,{wire_LB,wire_MemToReg},wire_mux41_out);
    Multiplexer_4 #(.DATA_WIDTH(32)) mux42(1'b1,wire_extender5_out,wire_extender6_out,wire_extender7_out,wire_extender8_out,wire_sel,wire_mux42_out);
    Multiplexer_4 #(.DATA_WIDTH(32)) mux43(1'b1,wire_mux41_out,wire_pc4,wire_AUIPC_res,0,{wire_AUIPC,wire_J},wire_RDin);
    Multiplexer_4 #(.DATA_WIDTH(32)) mux44(1'b1,LedData,wire_Cycle,wire_IR,wire_PC_reg_out,wire_Display_Sel,wire_FDGA_in);
    Multiplexer_8 #(.DATA_WIDTH(32)) mux81(1'b1,0,wire_and1_out,wire_adder2_out,0,wire_adder3_out,0,0,0,wire_Instr,wire_branch_addr);

    Bit_Extender_32_Sign #(.DATA_WIDTH(12)) Extender1(wire_mux24_out,wire_extender1_out);
    Bit_Extender_32_Sign #(.DATA_WIDTH(12)) Extender2({wire_IR[31],wire_IR[7],wire_IR[30:25],wire_IR[11:8]},wire_extender2_out);
    Bit_Extender_32_Sign #(.DATA_WIDTH(20)) Extender3({wire_IR[31],wire_IR[19:12],wire_IR[20],wire_IR[30:21]},wire_extender3_out);
    Bit_Extender_32_Sign #(.DATA_WIDTH(20)) Extender4(wire_IR[31:12],wire_extender4_out);
    Bit_Extender_32_Sign #(.DATA_WIDTH(8)) Extender5(wire_Ram_out[7:0],wire_extender5_out);
    Bit_Extender_32_Sign #(.DATA_WIDTH(8)) Extender6(wire_Ram_out[15:8],wire_extender6_out);
    Bit_Extender_32_Sign #(.DATA_WIDTH(8)) Extender7(wire_Ram_out[23:16],wire_extender7_out);
    Bit_Extender_32_Sign #(.DATA_WIDTH(8)) Extender8(wire_Ram_out[31:24],wire_extender8_out);

    Shifter Shifter1(wire_extender2_out,5'b0001,wire_shifter1_out);
    Shifter Shifter2(wire_extender3_out,5'b0001,wire_shifter2_out);
    Shifter Shifter3(wire_extender4_out,5'b1100,wire_shifter3_out);

    Adder adder1(1'b0,wire_extender1_out,wire_R1,,wire_adder1_out);
    Adder adder2(1'b0,wire_shifter1_out,wire_PC_reg_out,,wire_adder2_out);
    Adder adder3(1'b0,wire_shifter2_out,wire_PC_reg_out,,wire_adder3_out);
    Adder adder4(1'b0,wire_shifter3_out,wire_PC_reg_out,,wire_AUIPC_res);

    Comparator Comparator1(wire_R1,wire_MDin,wire_R1_MDin_Equal,wire_R1_MDin_Greater,);
    Comparator Comparator2(wire_R1,32'h0000_0022,wire_R1_0x22_Equal,,);

    Register #(.DATA_WIDTH(32)) PC_Reg(wire_Clk_N,~wire_halt,wire_mux21_out,RST,wire_PC_reg_out);
    Register #(.DATA_WIDTH(32)) Led_Reg(wire_Clk_N,wire_ecall & wire_R1_0x22_Equal,wire_MDin,RST,LedData);
    Register #(.DATA_WIDTH(5)) Display_Sel_Reg(Clk,Display_Sel!=wire_Display_Sel_Reg_out,Display_Sel,RST,wire_Display_Sel_Reg_out);

    Rom Rom(wire_PC_reg_out[11:2],wire_IR);
    Hard_Wired_Controller Hard_Wired_Controller({wire_IR[30],wire_IR[25],wire_IR[14:12]},wire_IR[21],wire_IR[6:2],
        wire_AluOP,wire_AluSrcB,wire_AUIPC,wire_Beq,wire_Bge,wire_Bne,wire_JAL,wire_JALR,wire_MemToReg,wire_MemWrite,
        wire_RegWrite,wire_S_Type,wire_ecall,wire_LB,wire_URET);
    Regifile Regifile(wire_Clk_N,wire_RDin,wire_mux22_out,wire_mux23_out,wire_RegWrite,wire_IR[11:7],wire_R1,wire_R2);
    ALU ALU(wire_AluOP,wire_R1,wire_mux25_out,wire_equal,,,wire_Alu_out,);   
    Ram Ram(wire_Alu_out[11:2],wire_Clk_N,wire_MDin,wire_MemWrite,wire_Ram_out); 
    FPGADigit FPGADigit(Clk,wire_FDGA_in,NA,SEG);

    
 endmodule
