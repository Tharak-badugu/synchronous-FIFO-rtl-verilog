module mod_a(input rst,clk,full,input [7:0] din,output reg [7:0] dout,output reg wr_enb);
//transmitter module 
always@(posedge clk or posedge rst) begin
    if(rst) begin
        dout<=0; //resetting dout to 0
        wr_enb<=1'b0;    //asserting wr_enb to 0
    end
    else begin
        if(!full) begin
        dout<=din;              //assigning din to dout
        wr_enb<=1'b1;                 //asserting wr_enb to 1
    end
    else begin
        wr_enb<=1'b0;
    end
    end
end
endmodule