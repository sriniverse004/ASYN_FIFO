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

intf intf1(wr_clk, rd_clk, rst, wr_en, rd_en);

  asyn_fifo f1(.wr_clk(intf1.wr_clk), .rd_clk(intf1.rd_clk), .rst(intf1.rst), .wr_en(intf1.wr_en), .rd_en(intf1.rd_en), .wdata(intf1.wdata), .rdata(intf1.rdata), .empty(intf1.empty), .full(intf1.full), .fifo_counter(intf1.fifo_counter));

  test tb(intf1);

initial begin
    $dumpfile("fifo_test.vcd"); 
    $dumpvars;
end

endmodule
