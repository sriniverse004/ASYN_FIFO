`include "transactor.sv"

class driver;

    transactor trans;
    virtual intf vif;
    mailbox gen2driv;
    
    function new (virtual intf vif, mailbox gen2driv);
        this.vif = vif;
        this.gen2driv = gen2driv;
    endfunction
    
    task  main();
        
        repeat(32)@(posedge vif.wr_clk)
        begin
        
            gen2driv.get(trans);
            
            vif.wdata <= trans.wdata;
            
            trans.fifo_counter <= vif.fifo_counter;
            trans.rdata <= vif.rdata;
            trans.empty <= vif.empty;
            trans.full <= vif.full;
            
            trans.display("Driver");
            
        end
        
    endtask

endclass
