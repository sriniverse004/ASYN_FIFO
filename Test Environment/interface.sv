interface intf (input bit wr_clk, rd_clk, rst, wr_en, rd_en);

logic [7:0] wdata;
logic [7:0] rdata;
logic full, empty;
logic [3:0] fifo_counter;

clocking cb1 @(posedge wr_clk);
    default input #5ns output #5ns;
    input full, empty; 
    input fifo_counter;
    output wdata;
    output wr_en;
endclocking

clocking cb2 @(posedge rd_clk);
    default input #5ns output #5ns;
    input full, empty; 
    input fifo_counter;
    output rdata;
    output rd_en;
endclocking

modport mp1 (clocking cb1, clocking cb2, input wr_clk, rd_clk, rst, wr_en, rd_en);

endinterface
