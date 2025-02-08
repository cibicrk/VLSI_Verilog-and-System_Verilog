class trans;
  rand bit Din;
  bit [3:0] Dout;
  constraint range{Din inside{0,1};}
  
  function void display(string name);
    $display("-------------------------------------------------");
    $display("Din=%b,Dout=%b",Din,Dout);
    $display("-------------------------------------------------");
  endfunction
  
endclass

