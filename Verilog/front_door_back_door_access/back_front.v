/***************************************************************************
*                   BACK_DOOR & FRONT_DOOR ACCESS
****************************************************************************

//$readmemh--Hexadecimal file-Memory 
module tb;
reg [7:0]mem[0:3];
integer i;
initial begin
	$readmemh("data.hex",mem);
	#1;
	for(i=0;i<4;i=i+1)begin
      $display("mem[%0d]=%h",i,mem[i]);
   end
   $finish;
   end
endmodule

//$readmemb--binary file-Memory 
module tb;
reg [7:0]mem[0:3];
integer i;
initial begin
	$readmemb("binary.bin",mem);
	#1;
	for(i=0;i<4;i=i+1)begin
      $display("mem[%0d]=%b",i,mem[i]);
   end
   $finish;
   end
endmodule



//$writememb--binary file-Memory 
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	for(i=0;i<6;i=i+1)begin
		mem[i]=$urandom_range(10,20);
	end
	$writememb("out.bin",mem);
end
endmodule

//$writememh--Hexdecimal file-Memory 
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	for(i=0;i<6;i=i+1)begin
		mem[i]=$urandom_range(10,20);
	end
	$writememh("out.hex",mem);
end
endmodule


//read(HEX)---write(BIN)
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	$readmemh("data.hex",mem);

         for(i=0;i<6;i=i+1)begin
         $display("mem[%0d]=%h",i,mem[i]);
         end

	$writememb("dataout.bin",mem);
        $finish;

end
endmodule

//write(HEX)---read(BIN)
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	for(i=0;i<6;i=i+1)begin
		mem[i]=$urandom_range(10,20);
	end
	$writememh("dataout1.hex",mem);
	$readmemb("dataout1.bin",mem);
	#1;
         for(i=0;i<6;i=i+1)begin
         $display("mem[%0d]=%b",i,mem[i]);
         end
$finish;
end
endmodule


//read(HEX)---write(HEX)
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	$readmemh("data.hex",mem);

         for(i=0;i<6;i=i+1)begin
         $display("mem[%0d]=%h",i,mem[i]);
         end

	$writememh("dataout.hex",mem);
        $finish;

end
endmodule

//read(bin)---write(bin)
module tb;
reg[7:0]mem[0:5];
integer i;
initial begin
	$readmemb("dataout.bin",mem);

         for(i=0;i<6;i=i+1)begin
         $display("mem[%0d]=%b",i,mem[i]);
         end

	$writememb("data1.bin",mem);
        $finish;

end
endmodule



