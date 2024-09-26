class receiver;

    transactor trans;
    virtual intf vif;
    mailbox rec2sb;
    
    function new (virtual intf vif, mailbox rec2sb);
        this.vif = vif;
        this.rec2sb = rec2sb;
    endfunction
    
    task  main();
        
        repeat(32)@(posedge vif.rd_clk)
        begin
            
            trans = new();
            
            trans.wdata <= vif.wdata;
            trans.fifo_counter <= vif.fifo_counter;
            trans.rdata <= vif.rdata;
            trans.empty <= vif.empty;
            trans.full <= vif.full;
            
            rec2sb.put(trans);
            
            trans.display("Receiver");
            
        end
        
    endtask

endclass
