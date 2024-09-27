module asyn_fifo_tb();
reg wr_clk;
reg rd_clk;
reg rst;
reg [7:0] wdata;
reg rd_en;
reg wr_en;

wire [7:0] rdata;
wire [4:0] fifo_counter;
wire full;
wire empty;

  asyn_fifo dut(.wr_clk(wr_clk),.rd_clk(rd_clk),.rst(rst),.wdata(wdata),.rd(rd_en),.wr_en(wr_en),.rdata(rdata),.fifo_counter(fifo_counter),.full(full),.empty(empty));

initial 
begin
$dumpfile("fifo_test.vcd");
$dumpvars(0,asyn_fifo_tb);
end

always #50 wr_clk=~wr_clk;
always #100 rd_clk=~rd_clk;

initial
begin
wr_clk=1'b0;
rd_clk=1'b0;
reset=1'b1;
d_in=8'b10110001;
rd_en<=1'b0;
wr_en<=1'b1;

#20
reset=1'b0;
d_in=8'b10110001;
rd_en<=1'b0;
wr_en<=1'b1;

#20
reset=1'b0;
d_in=8'b10110001;
rd_en<=1'b1;
wr_en<=1'b0;

#20
reset=1'b0;
d_in=8'b11111101;
rd_en<=1'b0;
wr_en<=1'b1;

#20
reset=1'b0;
d_in=8'b10110001;
rd_en<=1'b1;
wr_en<=1'b0;

#1000 $finish;

end
endmodule







