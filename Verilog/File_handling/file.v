/*==========================================================================
                        File Handling System tasks
============================================================================
| System task | Purpose                                          |
| ----------- | ------------------------------------------------ |
|  $fopen     | Open/create a file                               |
|  $fclose    | Close a file                                     |
|  $fdisplay  | Write formatted data + newline                   |
|  $fwrite    | Write formatted data without automatic newline   |
|  $fstrobe   | Write values at the end of the current time step |
|  $fmonitor  | Continuously write signal changes                |
|  $fscanf    | Read formatted data from a file                  |
|  $fgets     | Read one line                                    |
|  $fread     | Read binary data                                 |
|  $feof      | Check end of file                                |
|  $fseek     | Move file position                               |
|  $rewind    | Return to beginning of file                      |

1.$fopen---Open a file ("Write mode")
module tb;
integer fd;
initial begin
	fd=$fopen("output.txt","w");
	$fdisplay(fd,"Hello Verilog");
	$fclose(fd);
end
endmodule

2.$fdisplay---Write data to a file
module tb;
integer fd;
integer i;
initial begin
	fd=$fopen("output.txt","w");
	for(i=0;i<5;i=i+1)begin
		$fdisplay(fd,"HI VINOD");
	end
	$fclose(fd);
end
endmodule

3.$fwrite---write without automatic new line
module tb;
integer fd;
integer i;
initial begin
	fd=$fopen("output.txt","w");
	$fwrite(fd,"Hi Verilog\n");
	$fwrite(fd,"Hi Systemverilog");
	$fclose(fd);
end
endmodule

4.$monitor--- continuously monitor signals
module tb;
reg clk;
reg rst;
integer fd;
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
fd =$fopen ("monitor.txt","w");
$fmonitor(fd,"Time=%0t  clk=%0d rst=%0d",$time,clk,rst);
rst=0;
#10;
rst=1;
$fclose(fd);
$finish;
end
endmodule
6.$fstrobe --- write after current simulation event
module tb;
integer fd;
reg a;
initial begin
	fd=$fopen("data.txt","w");
	a=0;
	#10;
	a=1;
	$fstrobe(fd,"Time=%0t a=%0b",$time ,a);
	#10;
	$fclose(fd);
end
endmodule
7.$fscanf ---read formatted data
module tb;
integer fd;
integer a,b,c,d;
initial begin
	fd =$fopen("input.txt","r");
	$fscanf(fd,"%d %d %d %d",a,b,c,d);
	$display("a=%0d b=%0d c=%0d d=%0d",a,b,c,d);
	$fclose(fd);
end
endmodule

8.$feof---check end of line
module tb;
integer fd;
integer a;
integer states;
initial begin
	fd=$fopen("input.txt","r");
while (!$feof(fd))begin
	states= $fscanf(fd,"%d",a);
	if(states==1)
		$display("Data=%0d",a);
end
$fclose(fd);
end
endmodule

9.$fgets----Read one lines
module tb;

integer fd;
reg [8*100-1:0]line;
initial begin
	fd=$fopen("output.txt","r");
	$fgets (line,fd);
	$display("%0s",line);
	$fclose(fd);

end
endmodule

10.$fread---Read binary data
*/
module tb;
integer fd;
reg [7:0]mem[0:15];
initial begin
	fd = $fopen("binary.bin","rb");
	$fread(mem,fd);
	$display("%p",mem);
	$fclose(fd);
end
endmodule






