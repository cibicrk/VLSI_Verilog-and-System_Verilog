`include "environment.sv"
class test;
  virtual inf vinf;
  environment env;
  function new(virtual inf vinf);
    this.vinf=vinf;
    env=new(vinf);
  endfunction
  task run();
    fork
    env.rst();
    env.main();
    join
  endtask
  
endclass
