`include "environment.sv"
class test;
  environment env;
  virtual inf vinf;

  // Constructor
  function new(virtual inf vinf);
    this.vinf = vinf;
    env = new(vinf);
  endfunction

  // Start the environment
  task start();
    env.main();
  endtask
endclass
