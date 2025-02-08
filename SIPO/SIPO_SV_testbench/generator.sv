class generator;
  trans tr;
  mailbox gen2drv;
  static int count=8;
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task main;
    repeat(8)
      begin
        tr=new();
       if (!tr.randomize())
         begin
        $error("Failed to randomize the transaction");
        end 
        else 
          begin
        tr.display("generate block");
        gen2drv.put(tr);
        end
      end
  endtask
endclass
