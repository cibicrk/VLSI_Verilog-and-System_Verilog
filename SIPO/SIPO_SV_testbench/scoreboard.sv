class scoreboard;
  mailbox mon2sb;
  trans tr;
  function new(mailbox mon2sb);
    this.mon2sb=mon2sb;
  endfunction
  task main();
    forever
      begin
        mon2sb.get(tr);
        
        if(!tr.Din == tr.Dout[0])
          $error("Mismatch : Din=%b Dout=%b",tr.Din,tr.Dout);
        else
          $display("Matching : Din=%b Dout=%b",tr.Din,tr.Dout);
        
        tr.display("Scoreboard block");
      end
  endtask
endclass
