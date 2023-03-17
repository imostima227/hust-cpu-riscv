`timescale 1ns/1ps
module ALU( AluOP,
            X,
            Y,
            Equal,
            GreaterOrEqual,
            Less,
            Result,
            Result_2);
    
    //input
    input[3:0]  AluOP;
    input[31:0]  X;
    input[31:0]  Y;

    //output
    output Equal;
    output reg GreaterOrEqual;
    output reg Less;
    output reg [31:0] Result;
    output reg [31:0] Result_2;
    reg Greater;

    //func
    assign Equal = (X == Y ? 1: 0);

    always @( *) begin
        case(AluOP)
        4'b0000: begin 
                Result <= X << Y[4:0];
                Result_2 <= 0;
        end
        4'b0001: begin
                Result <= ($signed(X)) >>> Y[4:0];
                Result_2 <= 0;
        end
        4'b0010: begin
                Result <= X >> Y[4:0];
                Result_2 <= 0;
        end
        4'b0011: begin
                {Result_2,Result} <= X * Y;
        end            
        4'b0100: begin
                Result <= X / Y;
                Result_2 <= X % Y;
        end
        4'b0101: begin 
                Result <= X + Y;
                Result_2 <= 0;
        end
        4'b0110: begin
                Result <= X + ~Y +1;
                Result_2 <= 0;
        end
        4'b0111: begin 
                Result <= X & Y;
                Result_2 <= 0;
        end
        4'b1000: begin
                Result <= X | Y;
                Result_2 <= 0;
        end
        4'b1001: begin
                Result <= X ^ Y;
                Result_2 <= 0;
        end
        4'b1010: begin
                Result <= ~( X | Y);
                Result_2 <= 0;
        end
        4'b1011: begin
                Result <= (($signed(X)) < ($signed(Y))) ? 32'h0000_0001 : 32'h0000_0000;
                Less <= ($signed(X)) < ($signed(Y)) ? 1 : 0;
                GreaterOrEqual <= (($signed(X)) > ($signed(Y)) | ($signed(X)) == ($signed(Y))) ? 1 : 0;
        end
        4'b1100: begin 
                Result <= X < Y ? 32'h0000_0001 : 32'h0000_0000;
                Less <= X < Y ? 1 : 0;
                GreaterOrEqual <= ((X > Y) | (X == Y)) ? 1 : 0;
        end
        endcase
        end        
  endmodule