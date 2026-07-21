module mod_a(input rst,clk,full,input [7:0] din,output reg [7:0] dout,output reg wr_enb);

always@(posedge clk or posedge rst) begin
    if(rst) begin
        dout<=0;
        wr_enb<=1'b0;
    end
    else begin
        if(!full) begin
        dout<=din;
        wr_enb<=1'b1;
    end
    else begin
        wr_enb<=1'b0;
    end
    end
end
endmodule