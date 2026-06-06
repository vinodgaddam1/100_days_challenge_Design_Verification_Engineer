module tb;
  reg a,b;
  wire nand_not,nand_and,nand_or,nand_buf,nand_nand,nand_nor,nand_xor,nand_xnor;
  nand_not ng(.a(a),.y(nand_not));
  nand_and ag(.a(a),.b(b),.y(nand_and));
  nand_or og(.a(a),.b(b),.y(nand_or));
  nand_buf bg(.a(a),.y(nand_buf));
  nand_nand ndg(.a(a),.b(b),.y(nand_nand));
  nand_nor nog(.a(a),.b(b),.y(nand_nor));
  nand_xnor xng(.a(a),.b(b),.y(nand_xnor));
  nand_xor xg(.a(a),.b(b),.y(nand_xor));
  initial 
    begin
      $monitor("time=%0t, a=%d ,b=%d | not=%d,and=%d,or=%d,buf=%d,nand=%d,nor=%d,xnor=%d,xor=%d",$time
               ,a,b,nand_not,nand_and,nand_or,nand_buf,nand_nand,nand_nor,nand_xnor,nand_xor);
      a=1'b0; b=1'b0; #10;
      a=1'b0; b=1'b1; #10;
      a=1'b1; b=1'b0; #10;
      a=1'b1; b=1'b1; #10;
      a=1'bx; b=1'bx; #10;
      a=1'bx; b=1'bz; #10;
      a=1'bz; b=1'bx; #10;
      a=1'bz; b=1'bz; #10;
      
      $finish;
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
