module divider_pc#(parameter N = 100_000_000)(clk,clk_N);
input clk;                      
output clk_N;                   

reg [31:0] counter;             
                                   
                                   
reg clk_N;
          

always @(posedge clk)  begin    
    if (counter == N/2-1)
        begin
            clk_N<=!clk_N;
            counter<=0;
        end
    else 
        begin 
            counter<=counter+1;
        end
end                           
endmodule