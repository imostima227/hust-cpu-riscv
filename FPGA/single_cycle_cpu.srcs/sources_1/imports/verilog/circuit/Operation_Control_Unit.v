`timescale 1ns/1ps
module Operation_Control_Unit( F12,
                               F13,
                               F14,
                               F25,
                               F30,
                               OP2,
                               OP3,
                               OP4,
                               OP5,
                               OP6,
                               S0,
                               S1,
                               S2,
                               S3);

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
    output S0;
    output S1;
    output S2;
    output S3;

    //func
    assign S0 = (~F30&~F25&~F14&~F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25& F14& F13& F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14& F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F14&~F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F14&~F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F30&~F25& F14&~F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6& OP5&~OP4&~OP3&~OP2)|(~F14&~F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2);
    assign S1 =  (F30&~F25&~F14&~F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25& F14& F13& F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14& F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F30&~F25& F14&~F13& F12&~OP6&~OP5& OP4&~OP3&~OP2);
    assign S2 = (~F30&~F25&~F14&~F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)| (F30&~F25&~F14&~F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25& F14& F13& F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14& F13& F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F14&~F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6& OP5&~OP4&~OP3&~OP2)|(~F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14&~F13&~F12&~OP6&~OP5&~OP4&~OP3&~OP2);
    assign S3 = (~F30&~F25& F14& F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14& F13&~F12&~OP6& OP5& OP4&~OP3&~OP2)|(~F30&~F25&~F14& F13& F12&~OP6& OP5& OP4&~OP3&~OP2)| (F14& F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)| (F14&~F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13&~F12&~OP6&~OP5& OP4&~OP3&~OP2)|(~F14& F13& F12&~OP6&~OP5& OP4&~OP3&~OP2);

endmodule