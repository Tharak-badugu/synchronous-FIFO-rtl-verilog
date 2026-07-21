`include "moduleA_fifo.v"
`include "moduleB_fifo.v"
`include "fifo.v"
module top_fifo(input rst,clk,input [7:0]din,output [7:0]dout);

wire [7:0] modA_to_fifo;  //connection from moduleA to fifo
wire rd_enb;              // enable to read the data
wire wr_enb;              // enable to write the data
wire full;                 // fifo is full so the write operation stops
wire empty;               //fifo is empty so nothing to read in the memory
wire [7:0] fifo_to_modB;   // connection from fifo to moduleB


mod_a module1(.clk(clk),.rst(rst),.din(din),.dout(modA_to_fifo),.wr_enb(wr_enb),.full(full));
fifo fifo1(.clk(clk),.rst(rst),.wr_enb(wr_enb),.rd_enb(rd_enb),.din(modA_to_fifo),.dout(fifo_to_modB),.full(full),.empty(empty));
mod_b module2(.clk(clk),.rst(rst),.rd_enb(rd_enb),.din(fifo_to_modB),.dout(dout),.empty(empty));

endmodule