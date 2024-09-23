`include "transactor.sv"

class scoreboard;

    transactor trans;
    virtual intf vif;
    mailbox rec2sb;
    bit [7:0] fifo_mem [15:0];
    bit [3:0] rd_pntr;
    
    function new (virtual intf vif, mailbox rec2sb);
        this.vif = vif;
        this.rec2sb = rec2sb;
    endfunction
    
    task main();
    
        forever begin;
            
            trans = new();
            rec2sb.get(trans);
            
            if(vif.rd_en)begin
                 if(trans.rdata == fifo_mem[rd_pntr])begin
                     rd_pntr++;
                     $display("Successful");
                 end
                 else begin
                     $display("Failed");
                 end
    end

            
        end
    
    endtask

endclass
