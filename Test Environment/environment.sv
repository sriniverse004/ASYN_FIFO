`include "transactor.sv"
`include "generator.sv"
`include "driver.sv"
`include "receiver.sv"
`include "scoreboard.sv"

class environment;

  generator gen;
  driver driv;
  receiver rec;
  scoreboard sb;
  
  mailbox gen2driv;
  mailbox rec2sb;
  
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    gen2driv = new();
    rec2sb = new();
    gen = new(vif,gen2driv);
    driv = new(vif,gen2driv);
    rec = new(vif,rec2sb);
    sb = new(vif,rec2sb);
  endfunction
  
  
  task test();
   gen.main();
   driv.main();
   rec.main();
   sb.main();
  endtask
  
  
  task start();
   test();
   $finish;
  endtask

    
endclass
