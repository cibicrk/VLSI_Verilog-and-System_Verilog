class monitor;
  virtual inf vinf;
  mailbox mon2sb;
  trans tr;
  function new(virtual inf vinf, mailbox mon2sb);
    this.vinf=vinf;
    this.mon2sb=mon2sb;
  endfunction
  task main();
    forever
      begin
      tr=new();
        @(posedge vinf.mon_m.monitor_i)
      tr.Din<=vinf.mon_m.monitor_i.Din;
      tr.Dout<=vinf.mon_m.monitor_i.Dout;
        mon2sb.put(tr);
        tr.display("Monitor block");
    end
  endtask
endclass
