class transactor;
    
    rand bit [7:0] wdata;
    
    bit [7:0] rdata;
    bit [3:0] fifo_counter;
    bit empty,full;

    function void display (string name = "");
    
        $display("--------------------------------------------------");
        $display("%s", name);
        $display("--------------------------------------------------");
        $display("rst=%0b, wr_en=%0b, rd_en=%0b", rst, wr_en, rd_en);
        $display("wdata=%08b", wdata);
        $display("rdata=%08b", rdata);
        $display("fifo_counter=%0d", fifo_counter);
        $display("empty=%0b, full=%0b", empty, full);
        $display("---------------------------------------------------");

    endfunction

endclass
