//feedback
module tb();
  wire b;
  g1 dut(.b(b));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $monitor("time=%0t ,B=%b",$time,b);
    #100;
    $finish;
  end
endmodule
//even-odd
module tb;
  wire b;
  reg a;
  g3 dut(.a(a),.b(b)); //change even=g2 and odd=g3 
          initial begin
            $dumpfile("dump.vcd"); $dumpvars;
          $monitor("time=%0t,a=%b,b=%b",$time,a,b);
          a=0; #20;
          a=1; #20;
          a=0; #20;
          a=1; #20;
          a=0; #20;
          #100;
          $finish;
          end
endmodule

