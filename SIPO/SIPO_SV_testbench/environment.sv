`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  virtual inf vinf;
  generator gen;
  driver drv;
  scoreboard scb;
  monitor mn;
  mailbox gen2drv;
  mailbox mon2sb;
  
  function new(virtual inf vinf);
    this.vinf=vinf;
    gen2drv=new();
    mon2sb=new();
    gen=new(gen2drv);
    drv=new(vinf,gen2drv);
    mn=new(vinf,mon2sb);
    scb=new(mon2sb);
  endfunction
  
  task rst();
    drv.rst();
  endtask
  
  task main();
    fork
      gen.main();
      drv.main();
      scb.main();
      mn.main();
    join
  endtask
endclass
