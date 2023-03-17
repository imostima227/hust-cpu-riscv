`timescale 1ns/1ps

module Shifter( DataA,
                ShiftAmount,
                Result);
    parameter WIDTH = 32;
    parameter WIDTH_SHIFT = 5;
    parameter ShifterMode = 0;

    //input
    input [WIDTH-1:0] DataA;
    input [WIDTH_SHIFT-1:0] ShiftAmount;

    //output
    output reg [WIDTH-1:0] Result;

    //func
    /***************************************************************************
    ** ShifterMode represents when:                                          **
    ** 0 : Logical Shift Left                                                **
    ** 1 : Arithmetic Shift Right                                            **
    ** 2 : Logical Shift Right                                               **
    ***************************************************************************/

    always @( *) begin
        case(ShifterMode)
            0: Result = DataA << ShiftAmount;
            1: Result = ($signed(DataA)) >>> ShiftAmount;
            default Result = DataA >> ShiftAmount;
        endcase
    end

endmodule