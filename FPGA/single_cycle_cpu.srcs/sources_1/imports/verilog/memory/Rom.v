`timescale 1ns/1ps
module Rom( Address,
                Data);
    
    //input 
    input[9:0]  Address;

    //output
    output reg [31:0] Data;
    
    //func
    reg [31:0] mem [1023:0];
    initial begin
       $readmemh("D:\\pro\\principles_of_computer_composition\\cpu24-riscv\\Single_Cycle_RISCV2\\single_cycle_cpu\\single_cycle_cpu.srcs\\sources_1\\imports\\verilog\\memory\\ccab.txt",mem);
    end

    always @ (Address)
    begin
      Data <= mem[Address];  
    end

endmodule