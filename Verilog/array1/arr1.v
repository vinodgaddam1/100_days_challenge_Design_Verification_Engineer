/*array declearation
module tb;
integer arr[0:4];
integer i;
initial begin
	arr[0]=10;
	arr[1]=10;
	arr[2]=10;
	arr[3]=10;
	arr[4]=10;

	for(i=0;i<5;i=i+1) begin
	$display("arr[%0d]=%0d",i,arr[i]);
	
	end
end
endmodule
//consider an integer array of size 10 and assign all the locations should be in the range of 10 to 50
module tb;
integer arr[9:0];
parameter UPPER=50;
parameter LOWER=10;
integer i;
initial begin
	for(i=0;i<10;i=i+1)begin
arr[i]=((LOWER+UPPER)/2 + $random % (UPPER-LOWER)/2);y
$display("arr[%0D]=%0D",i,arr[i]);
	end

end
endmodule


//consider an integer array of size 10 and assign all the even locations should be in the range of 10 to 50 and odd location should be 0's
module tb;
integer arr[20:0];
parameter UPPER=50;
parameter LOWER=10;
integer i;
initial begin
	for(i=0;i<20;i=i+1)begin
		if(i%2==0) 
                arr[i]=((LOWER+UPPER)/2 + $random % (UPPER-LOWER)/2);
                else 
               	arr[i]=0;
                $display("arr[%0D]=%0D",i,arr[i]);
	end

end
endmodule*/

module tb;
integer arr[20:0];
parameter UPPER1=50;
parameter LOWER1=10;
parameter UPPER2=100;
parameter LOWER2=50;
integer i ;
integer j;
integer value1;
integer value2;
reg duplicate;
integer temp;
initial begin
	for(i=0;i<20;)begin
		duplicate=0;
		value1=((LOWER1+UPPER1)/2 +( $random % ((UPPER1-LOWER1)/2)));

		value2=((LOWER2+UPPER2)/2 + ($random % ((UPPER2-LOWER2)/2)));
		if(i%2==0 && value1%2!=0)begin
			arr[i]=value1;
   
	$display("arr[%0d]=%0d",i,arr[i]);
			i=i+1;
		end	
                 
		else if(i%2!=0 && value2%2==0)begin
               	arr[i]=value2;

	$display("arr[%0d]=%0d",i,arr[i]);
                i=i+1;
	        end
	end

end
endmodule









