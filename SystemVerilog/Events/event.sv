/*========================================================================
*                         Events In SystemVerilog
* ========================================================================
*/

module top;
int a;
int b;
event e1,e2;
initial begin
	@(e1);
	$display("%0t:Entery-1",$time);
end
initial begin
	@(e2);
	$display("%0t:Entery-2",$time);
	->e1;
end
initial begin
	$display("%0t:Entery-3",$time);
end
endmodule







































