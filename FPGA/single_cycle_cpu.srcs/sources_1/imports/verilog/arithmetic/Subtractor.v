`timescale 1ns/1ps

module Subtractor(BorrowIn,
              DataA,
              DataB,
              BorrowOut,
              Result);
    parameter WIDTH = 32;
    // input
    input BorrowIn;
    input [WIDTH-1:0] DataA;
    input [WIDTH-1:0] DataB;

    //output
    output BorrowOut;
    output [WIDTH-1:0] Result;

    //func
    assign Result = DataA + ~(DataB) + ~(BorrowIn);
    assign BorrowOut = Result > 0 ? 0 : 1;

endmodule
