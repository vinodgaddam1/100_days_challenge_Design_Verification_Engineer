==========================================================================	    SystemVerilog Constraints problems Level-6
==========================================================================


//71:If mode == 0, generate data between 1 and 10; otherwise, between 50 and 100.
class sample;
rand int a;
rand bit mode;
function void print();
	$display(" mode=%0d ",mode);	
	$display(" a=%0d ",a);	
endfunction

constraint a_c{
if(mode==0)
	a inside {[1:10]};
else
	a inside {[50:100]};
}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

//72:If write == 1, the address must be divisible by 4 using Implication.
class sample;
rand int a;
rand bit write;
function void print();
	$display(" write=%0d ",write);	
	$display(" a=%0d ",a);	
endfunction

constraint a_c{
a inside {[1:50]};
(write==1) -> (a % 4 ==0);
}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

//73:If enable == 0, the output must be zero.
class sample;
rand int out;
rand bit enable;
function void print();
	$display(" enable=%0d ",enable);	
	$display(" out=%0d ",out);	
endfunction

constraint a_c{
if(enable==0)
	out==0;
else
	out inside {[1:20]};
}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//74:If opcode == 1, data must be between 10 and 20.
class sample;
rand int data;
rand bit opcode;
function void print();
	$display(" opcode=%0d ",opcode);	
	$display(" data=%0d ",data);	
endfunction

constraint a_c{
if(opcode==1)
	data inside {[10:20]};
else
	data==0;
}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//75:If opcode == 2, data must be between 50 and 100.
class sample;
rand int data;
rand bit [1:0] opcode;
function void print();
	$display(" opcode=%0d ",opcode);	
	$display(" data=%0d ",data);	
endfunction

constraint a_c{
if(opcode==2)
	data inside {[50:100]};
else
	data==0;
}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//76:If mode == 0, a < b; otherwise, a > b.
class sample;
rand int a,b;
rand bit mode;
function void print();
	$display(" mode=%0d ",mode);	
	$display(" a=%0d ",a);	
	$display(" b=%0d ",b);	
endfunction

constraint a_c{
	a inside {[1:50]};
	b inside {[1:50]};
if(mode==0)
	a<b;
else
	a>b;
}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//77:If valid == 1, ready must also be 1.
class sample;
rand bit valid;
rand bit ready;
function void print();
	$display(" valid=%0d ",valid);	
	$display(" ready=%0d ",ready);	
endfunction

constraint a_c{
(valid==1) -> (ready==1);
}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule



//78:If the transaction is a write, the burst length must be between 1 and 4.
class sample;
rand bit write;
rand int burst_len;
function void print();
	$display(" write=%0d ",write);	
	$display(" burst_length=%0d ",burst_len);	
endfunction

constraint a_c{
if(write)
	burst_len inside {[1:4]};
}
endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule


//79:If sel == 0, address must be in 0–31; if sel == 1, address must be in 32–63.
class sample;
rand bit sel;
rand int address;
function void print();
	$display(" sel=%0d ",sel);	
	$display(" address=%0d ",address);	
endfunction

constraint a_c{
if(sel==0)
	address inside {[0:31]};
else
	address inside {[32:63]};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule
*/
//80:If reset == 1, output must be 0; otherwise, output must be between 1 and 100.
class sample;
rand bit reset;
rand int out;
function void print();
	$display(" reset=%0d ",reset);	
	$display(" out=%0d ",out);	
endfunction

constraint a_c{
if(reset==1)
	out==0;
else
	out inside {[1:10]};
}

endclass

module top;
sample s;
initial begin
	repeat (10)begin
	s=new();
        // Best Practice: Always check if randomization is successful
	if (s.randomize())begin
	s.print;
        end
	else begin 
	$error("Randomization failed!");
end
end
end
endmodule

