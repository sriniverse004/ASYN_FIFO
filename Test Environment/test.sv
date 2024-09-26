`include "environment.sv"

program test(intf intf1);

environment env;
    
initial begin
  	env = new(intf1);
    env.start();
end

endprogram
