`timescale 1ns/1ps

module Adder(CarryIn,
              DataA,
              DataB,
              CarryOut,
              Result);
    parameter WIDTH = 32;
    // input
    input CarryIn;
    input [WIDTH-1:0] DataA;
    input [WIDTH-1:0] DataB;

    //output
    output CarryOut;
    output [WIDTH-1:0] Result;

    //func
    assign {CarryOut,Result} = DataA + DataB + CarryIn;

endmodule
