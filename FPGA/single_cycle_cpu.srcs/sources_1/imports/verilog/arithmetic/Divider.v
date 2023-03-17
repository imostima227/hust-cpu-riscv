`timescale 1ns/1ps
module Divider( DataA,
              DataB,
              Result,
              Result2);
    parameter WIDTH = 32;

    //input
    input CarryIn;
    input [WIDTH-1:0] DataA;
    input [WIDTH-1:0] DataB;

    //output
    output [WIDTH-1:0] Result;
    output [WIDTH-1:0] Result2;

    //func
    assign Result = DataA / DataB;
    assign Result2 = DataA % DataB;
endmodule