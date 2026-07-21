`timescale 1ns/1ps
`include "top_fifo.v"
module tb_top_fifo;
reg rst,clk;
reg [7:0]din;
wire [7:0]dout;

top_fifo dut(rst,clk,din,dout);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_top_fifo);
end
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    rst=1;
    din=8'b0;
    #10;
    rst=0;
    #10;
    din = 8'd80;
    #10;
    din=8'd90;
    #10;
    din=8'd100;
    #10;
    din=8'd110;
    #10;
    din=8'd120;
    #10;
    din=8'd130;
    #10;
    din=8'd140;
    #10;
    din=8'd150;
    #10;
    din=8'd160;
    #10;
    din=8'd0;
#400;
    $finish;
end
endmodule
