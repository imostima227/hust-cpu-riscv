`timescale 1ns/1ps
module Ram( addr,
            clk,
            d,
            we,
            q);
    
    //input
    input[9:0]  addr;
    input  clk;
    input[31:0]  d;
    input  we;

    //output
    output[31:0] q;

    //func
	reg [31:0] mem[1023:0];

    initial begin
        $readmemh("D:\\pro\\principles_of_computer_composition\\cpu24-riscv\\Single_Cycle_RISCV2\\single_cycle_cpu\\single_cycle_cpu.srcs\\sources_1\\imports\\verilog\\memory\\initial.txt",mem);
    end

	always @ (posedge clk) begin
		if (we)
			mem[addr] <= d;
	end
	assign q = mem[addr];

endmodule