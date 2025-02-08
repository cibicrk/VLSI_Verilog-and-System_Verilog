class driver;
  virtual inf vinf;
  mailbox gen2drv;
  trans tr;
  function new(virtual inf vinf, mailbox gen2drv);
    this.vinf=vinf;
    this.gen2drv=gen2drv;
  endfunction
  
  task rst();
    @(posedge vinf.driv_m.driver_i.clr)
    vinf.driv_m.driver_i.Din <= 0;
  endtask
  
  task main();
    forever
      begin
        gen2drv.get(tr);
        @(posedge vinf.driv_m.driver_i)
        vinf.driv_m.driver_i.Din <=tr.Din;
        tr.display("Driver Block");
      end
  endtask
endclass
        
