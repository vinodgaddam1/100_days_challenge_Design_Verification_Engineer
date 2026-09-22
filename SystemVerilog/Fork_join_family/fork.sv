>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                 SystemVerilog Fork–Join Family
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
1. fork...join or fork join_all 
fork
    process_1;
    process_2;
    process_3;
join
Meaning
All processes execute in parallel, and the parent waits until ALL processes finish.
For Example:
//fork...joi Parent waits for ALL child processes.
module top;
initial begin
  $display("Entry-1",$time); //#0
#2;
  #5 $display("Entry-2",$time); //#7 
  #9 $display("Entry-3",$time); //16 all enter at this seconds
fork //enter at 16ns
  $display("Entry-4",$time); //#16
#2;//16+2 = 18ns
  #5 $display("Entry-5",$time);//16+5=21ns
  #9 $display("Entry-6",$time);//16+9=25ns
  begin //enter at 16ns insude begin end exicute parallel
    #5 $display("Entry-7",$time); // 16+5=21ns
    #9 $display("Entry-8",$time); //16+5+9=30ns
    #9 $display("Entry-9",$time); //16+5+9+9=39ns
    #9 $display("Entry-10",$time);//16+5+9+9+9=48ns
  end
begin //enter at 16ns
  #5 $display("Entry-11",$time);//16+5=21ns
  #9 $display("Entry-12",$time);//16+5+9=30ns
end
begin  //enter at 16 ns
  $display("Entry-13",$time);//16ns
  #9 $display("Entry-14",$time);//16+9=25ns
end
  $display("Entry-15",$time); //enter at 16ns
  
  #4;//16+4=20ns
  #9 $display("Entry-16",$time);  //enter at 16+9=25ns
join
  //Here find the max entrie between fork and  join
  #2;
  $display("Entry-17",$time); //48+2=50ns
  $display("Entry-18",$time); //48+2=50ns
end
endmodule


2. fork...join_any
fork
    process_1;
    process_2;
    process_3;
join_any
Meaning
The parent waits until ANY ONE process finishes.
For example:

//fork...join_any Parent waits for ANY ONE child process.
module top;
initial begin
  $display("Entry-1",$time); //#0
#2;
  #5 $display("Entry-2",$time); //#7 
  #9 $display("Entry-3",$time); //16 all enter at this seconds
fork //enter at 16ns
  $display("Entry-4",$time); //#16
#2;//16+2 = 18ns
  #5 $display("Entry-5",$time);//16+5=21ns
  #9 $display("Entry-6",$time);//16+9=25ns
  begin //enter at 16ns insude begin end exicute parallel
    #5 $display("Entry-7",$time); // 16+5=21ns
    #9 $display("Entry-8",$time); //16+5+9=30ns
    #9 $display("Entry-9",$time); //16+5+9+9=39ns
    #9 $display("Entry-10",$time);//16+5+9+9+9=48ns
  end
begin //enter at 16ns
  #5 $display("Entry-11",$time);//16+5=21ns
  #9 $display("Entry-12",$time);//16+5+9=30ns
end
begin  //enter at 16 ns
  $display("Entry-13",$time);//16ns
  #9 $display("Entry-14",$time);//16+9=25ns
end
  $display("Entry-15",$time); //enter at 16ns
  
  #4;//16+4=20ns
  #9 $display("Entry-16",$time);  //enter at 16+9=25ns
join_any 
  //Here find the first exicuted entrie between fork and  join
  #2;
  $display("Entry-17",$time); //16+2=18ns
  $display("Entry-18",$time); //18ns
end
endmodule

3. fork...join_none
fork
    process_1;
    process_2;
    process_3;
join_none
Meaning
The parent does not wait for the child processes.
For Example:
//fork...join_none  Parent doesn't wait for the children.
module top;
initial begin
  $display("Entry-1",$time); //#0
#2;
  #5 $display("Entry-2",$time); //#7 
  #9 $display("Entry-3",$time); //16 all enter at this seconds
fork //enter at 16ns
  $display("Entry-4",$time); //#16
#2;//16+2 = 18ns
  #5 $display("Entry-5",$time);//16+5=21ns
  #9 $display("Entry-6",$time);//16+9=25ns
  begin //enter at 16ns insude begin end exicute parallel
    #5 $display("Entry-7",$time); // 16+5=21ns
    #9 $display("Entry-8",$time); //16+5+9=30ns
    #9 $display("Entry-9",$time); //16+5+9+9=39ns
    #9 $display("Entry-10",$time);//16+5+9+9+9=48ns
  end
begin //enter at 16ns
  #5 $display("Entry-11",$time);//16+5=21ns
  #9 $display("Entry-12",$time);//16+5+9=30ns
end
begin  //enter at 16 ns
  $display("Entry-13",$time);//16ns
  #9 $display("Entry-14",$time);//16+9=25ns
end
  $display("Entry-15",$time); //enter at 16ns
  
  #4;//16+4=20ns
  #9 $display("Entry-16",$time);  //enter at 16+9=25ns
join_none 
  //neglate the between fork join process and statements
  #2;
  $display("Entry-17",$time); //16+2=18ns
  $display("Entry-18",$time); //18ns
end
endmodule

4. disable fork
This is the important one.
disable fork;
Meaning
It terminates currently active forked child processes in the relevant fork context.
It does not go backward and remove processes that have already completed.
//fork...join_none with disable fork;//obj
module top;
initial begin
  $display("Entry-1",$time); //#0
#2;
  #5 $display("Entry-2",$time); //#7 
  #9 $display("Entry-3",$time); //16 all enter at this seconds
fork //enter at 16ns
  $display("Entry-4",$time); //#16
#2;//16+2 = 18ns
  #5 $display("Entry-5",$time);//16+5=21ns
  #9 $display("Entry-6",$time);//16+9=25ns
  begin //enter at 16ns insude begin end exicute parallel
    #5 $display("Entry-7",$time); // 16+5=21ns
    #9 $display("Entry-8",$time); //16+5+9=30ns
    #9 $display("Entry-9",$time); //16+5+9+9=39ns
    #9 $display("Entry-10",$time);//16+5+9+9+9=48ns
  end
begin //enter at 16ns
  #5 $display("Entry-11",$time);//16+5=21ns
  #9 $display("Entry-12",$time);//16+5+9=30ns
end
begin  //enter at 16 ns
  $display("Entry-13",$time);//16ns
  #9 $display("Entry-14",$time);//16+9=25ns
end
  $display("Entry-15",$time); //enter at 16ns
  
  #4;//16+4=20ns
  #9 $display("Entry-16",$time);  //enter at 16+9=25ns
join_any
  disable fork;
  //Here find the max entrie between fork and  join
  #2;
  $display("Entry-17",$time); //48+2=50ns
  $display("Entry-18",$time); //48+2=50ns
end
endmodule


Anothere one: //obj Here
//fork...join_none with disable fork
module top;
initial begin
  $display("Entry-1",$time); //#0
#2;
  #5 $display("Entry-2",$time); //#7 
  #9 $display("Entry-3",$time); //16 all enter at this seconds
fork //enter at 16ns
  $display("Entry-4",$time); //#16
#2;//16+2 = 18ns
  #5 $display("Entry-5",$time);//16+5=21ns
  #9 $display("Entry-6",$time);//16+9=25ns
  begin //enter at 16ns insude begin end exicute parallel
    #5 $display("Entry-7",$time); // 16+5=21ns
    #9 $display("Entry-8",$time); //16+5+9=30ns
    #9 $display("Entry-9",$time); //16+5+9+9=39ns
    #9 $display("Entry-10",$time);//16+5+9+9+9=48ns
  end
begin //enter at 16ns
  #5 $display("Entry-11",$time);//16+5=21ns
  #9 $display("Entry-12",$time);//16+5+9=30ns
end
begin  //enter at 16 ns
  $display("Entry-13",$time);//16ns
  #9 $display("Entry-14",$time);//16+9=25ns
end
  $display("Entry-15",$time); //enter at 16ns
  
  #4;//16+4=20ns
  #9 $display("Entry-16",$time);  //enter at 16+9=25ns
join_none
  //Here find the max entrie between fork and  join
  #40;
     disable fork;
  $display("Entry-17",$time); //48+2=50ns
  $display("Entry-18",$time); //48+2=50ns
end
endmodule


