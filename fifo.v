module fifo (input rst,clk,wr_enb,rd_enb,
input [7:0]din,
output reg [7:0]dout,
output full,empty);

reg [7:0]mem[0:7];
reg [3:0]wptr;
reg [3:0]rptr;

integer i;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        wptr<=0;
       for(i=0; i<8; i=i+1) 
        mem[i]<=0;
    end
    else if (wr_enb && !full)begin
            mem[wptr[2:0]]<=din;
            wptr<=wptr+1'b1;
        end
end
always@(posedge clk or posedge rst) begin
if (rst) begin
    rptr<=0;
    dout<=0;
end
else if (rd_enb && !empty) begin
            dout<=mem[rptr[2:0]];
            rptr<=rptr+1'b1;
        end
end
assign full=((wptr[3] != rptr[3]) && wptr[2:0] == rptr[2:0]);
assign empty=(wptr==rptr);
endmodule