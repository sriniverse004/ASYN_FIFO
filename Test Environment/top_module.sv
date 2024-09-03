`include "fifo.v"
`include "interface.sv"
`include "test.sv"

module top_module();

bit wr_clk, rd_clk;

always #50 wr_clk=~wr_clk;
always #100 rd_clk=~rd_clk;

inter intf(wr_clk, rd_clk);

asyn_fifo f1(.wr_clk(wr_clk), .rd_clk(rd_clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en), .wdata(wdata), .rdata(rdata), .empty(empty), .full(full), .fifo_counter(fifo_counter));

test tb(intf);

initial begin
    $dumpfile("fifo_test.vcd"); 
    $dumpvars;
end

endmodule
