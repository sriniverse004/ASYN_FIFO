`include "asyn_fifo.v"
`include "interface.sv"
`include "test.sv"

module top_module();

bit wr_clk, rd_clk;
bit rst, wr_en, rd_en;

always #50 wr_clk=~wr_clk;
always #100 rd_clk=~rd_clk;

initial begin 
 
  fork
  
  	#10 rst=1;
  	#15 rst=0;
  	#20 wr_en=1;
  	#20 rd_en=1;
    
  join
  
end

inter intf(wr_clk, rd_clk, rst, wr_en, rd_en);

asyn_fifo f1(.wr_clk(intf.wr_clk), .rd_clk(intf.rd_clk), .rst(intf.rst), .wr_en(intf.wr_en), .rd_en(intf.rd_en), .wdata(intf.wdata), .rdata(intf.rdata), .empty(intf.empty), .full(intf.full), .fifo_counter(intf.fifo_counter));

test tb(intf);

initial begin
    $dumpfile("fifo_test.vcd"); 
    $dumpvars;
end

endmodule
