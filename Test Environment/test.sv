`include "environment.sv"

program test(inter.mp1 intf);

virtual intf vif;
environment env;

initial begin
    env = new(virtual intf vif);
    env.start();
end

endprogram
