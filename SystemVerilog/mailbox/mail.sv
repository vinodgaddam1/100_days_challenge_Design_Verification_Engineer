>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                                       SystemVerilog Mailbox >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1. Definition
A mailbox in SystemVerilog is a communication and synchronization mechanism used to transfer data between concurrent processes.
Typical use:
Producer → Mailbox → Consumer
1.Basing on Size
Two types one is Bounded and Unbounded
Bounded means Size Will be fix, and Unbounded means size not fix.
For Example:
module top;
mailbox mbox1=new();//Bounded 
mailbox mbox2=new(5);//Unbounded
int value;
initial begin
  repeat (10)begin
        value=$urandom_range(10,20);
        mbox1.put(value);
end
        $display("mbox1=%p",mbox1);
        $display("------------------------------------------");
        repeat (10)begin
        value=$urandom_range(10,20);
        mbox2.put(value);
          $display("mbox2=%p",mbox2);//obj here
end
        //$display("mbox2=%p",mbox2);


end
endmodule

2.Basing on type
Two types one is generic and parameterized.
Generic means mailbox allow any type of data(ex:int,string,or user define type also), paramerterized means mailbox will allow particular parameter data/type.
For Example:
module top;
mailbox mbox1=new();//Genaric  
mailbox #(string)mbox2=new(5);//Parameterize and it alclow 5 values
int a;
real b;
string str1;
string str2;
string str3;
string str4;
string str5;
string str6;
initial begin
 a=100;
 b=20.9;
 str1="VINOD KUMAR";
 str2="a";
 str3="b";
 str4="c";
 str5="d";
 str6="e";
 mbox1.put(a);
 mbox1.put(b);
 mbox1.put(str1);
 $display("mbox1=%p",mbox1);
 //mbox2.put(a,b,str);This is not possible here, only mbox2 allow string type
$display("------------------------------------------");
mbox2.put(str1);
 $display("mbox2=%p",mbox2);
mbox2.put(str2);
 $display("mbox2=%p",mbox2);
mbox2.put(str3);
 $display("mbox2=%p",mbox2);
mbox2.put(str4);
 $display("mbox2=%p",mbox2);
mbox2.put(str5);
 $display("mbox2=%p",mbox2);
mbox2.put(str6);//obj this not print
 $display("mbox2=%p",mbox2);
end
endmodule

3.Mailbox Methods (Blocking Nature):
1. put() Purpose: Add an item to the mailbox.
2. get()Purpose: Get and remove the first item.
3. peek()Purpose: Get the first item without removing it.
4.num()Purpose: Returns the number of items currently stored.
5.new() is used to create/construct a mailbox object.
For Example:
mailbox mbox=new();
class sample;
	int value;
	task run();
         $display("---------------Put_Method-----------------");
		repeat(5)begin
         value=$urandom_range(10,20);
         $display("---------------Put_Method-----------------");
        mbox.put(value);//blocking nature
        end
	$display("mbox=%p",mbox);
        $display("---------------num_Method-----------------");
        value=mbox.num();
	$display("value=%p",value);
        $display("---------------peek_Method-----------------");
        mbox.peek(value);
      $display("mbox=%0d",value);
        $display("---------------get_Method-----------------");
	forever begin
	mbox.get(value);//Blocking nature
	$display("mbox=%p",mbox);
        end
        endtask
endclass

module top;
sample s;
initial begin
	s=new();
	s.run();
end
endmodule

4.Mailbox Methods (Non_Blocking Nature):
1. try_put()Purpose: Add an item without waiting.
2. try_get()Purpose: Get and remove an item without waiting.
6. try_peek()Purpose: Read the first item without removing it and without waiting.
For Example:
mailbox mbox=new();
class sample;
	int value;
	task run();
         $display("---------------Put_Method-----------------");
		repeat(5)begin
         value=$urandom_range(10,20);
         $display("---------------Put_Method-----------------");
        mbox.try_put(value);//non_blocking nature
        end
	$display("mbox=%p",mbox);
        $display("---------------num_Method-----------------");
        value=mbox.num();
	$display("value=%p",value);
        $display("---------------peek_Method-----------------");
        mbox.try_peek(value);//non_blocking
      $display("mbox=%0d",value);
        $display("---------------get_Method-----------------");
	forever begin
	mbox.try_get(value);//non_Blocking nature
	$display("mbox=%p",mbox);
        end
        endtask
endclass

module top;
sample s;
initial begin
	s=new();
	s.run();
end
endmodule



