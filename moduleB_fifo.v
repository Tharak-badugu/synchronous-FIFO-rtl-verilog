module mod_b(input rst,clk,empty,input [7:0] din,output reg [7:0] dout,output reg rd_enb);

parameter idle =2'b00;
parameter s1=2'b01;
parameter data_state=2'b10;

reg[1:0] ps,ns;
always@(posedge clk or posedge  rst)
begin
    if(rst) begin
        ps<=idle;
        dout<=0;
    end
    else begin
        ps<=ns;

        if(ps==data_state && !empty) begin
          dout<=din;
        end
end
end
   always@(*) begin
    ns = ps;   
    rd_enb = 1'b0; 
    case(ps)
    idle: begin
        ns=s1;
    end
    s1: begin
      ns=data_state;
    end
    data_state: begin
      if(!empty) begin
        rd_enb=1;
        ns=idle;
      end
      else begin
        ns=data_state;
      end
    end
    default: ns=idle;
    endcase
end
endmodule
