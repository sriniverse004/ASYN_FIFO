`include "environment.sv"

program test(inter.mp1 intf);

environment env;

initial begin
        env = new(intf);
    env.start();
end

endprogram
