


module top;
semaphore sem=new(1);
//semaphore sem=new(2);
//semaphore sem=new(3);
initial begin
	sem.get();
	$display("%0t: get the resoure-1",$time);
	$display("%0t: put the resoure-1",$time);
	sem.put();
end
initial begin
	sem.get();
	#10;
	$display("%0t: get the resoure-2",$time);

	$display("%0t: put the resoure-2",$time);
	sem.put();

end
initial begin
	sem.get();
	#20;
	$display("%0t: get the resoure-3",$time);

	$display("%0t: put the resoure-3",$time);
	sem.put();
end
endmodule































