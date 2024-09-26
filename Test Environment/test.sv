`include "environment.sv"

program test(intf.mp1 intf);

environment env;

initial begin
        env = new(intf);
        env.start();
end

endprogram
