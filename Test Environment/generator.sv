`include "transactor.sv"

class generator;

    transactor trans;
    virtual intf vif;
    mailbox gen2driv;   

    function new (virtual intf vif, mailbox gen2driv);
      this.vif = vif;
      this.gen2driv = gen2driv;
    endfunction
    
    task main();

      repeat(32)@(posedge vif.wr_clk)
         begin
            trans = new();
            trans.randomize();
            trans.display("Generator");
            gen2driv.put(trans);
         end

    endtask
    

endclass
