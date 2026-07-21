module fifo (input rst,clk,wr_enb,rd_enb,
input [7:0]din,
output reg [7:0]dout,
output full,empty);

reg [7:0]mem[7:0];  //8x8 memory array
//4bit pointers MSB used for wrap dectector
reg [3:0]wptr;
reg [3:0]rptr;
integer i;

 //write operation
always @(posedge clk or posedge rst) begin 
    if (rst) begin
        wptr<=4'b0;
       for(i=0; i<8; i=i+1) 
        mem[i]<=8'b0;                //setting memory to 0
    end
    else if (wr_enb && !full)begin
            mem[wptr[2:0]]<=din;
            wptr<=wptr+1'b1;  //incrementing pointer of write operation
        end
end
//read operation
always@(posedge clk or posedge rst) begin  
if (rst) begin
    rptr<=4'b0;
    dout<=8'b0;
end
else if (rd_enb && !empty) begin
            dout<=mem[rptr[2:0]];
            rptr<=rptr+1'b1;   //incrementing pointer of read operation
        end
end
assign full=((wptr[3] != rptr[3]) && wptr[2:0] == rptr[2:0]);     //MSB is used for wrap detection
assign empty=(wptr==rptr);                                        //empty will be high if both pointer are equal
endmodule