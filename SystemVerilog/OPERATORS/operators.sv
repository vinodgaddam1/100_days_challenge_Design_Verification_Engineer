***************************************************************************
                   "OPERATORS" SystemVerilog Operators
****************************************************************************
////////////////////////////////////////////////////////////////////////////
                          1.Arithmetic Operator
////////////////////////////////////////////////////////////////////////////

module top;
bit [5:0]a;
bit  [5:0]b;
int c=10;
logic [7:0]x;
logic  signed [7:0]y;
logic [7:0]z;
logic [2:0]result;
logic [5:0]m;
logic [5:0]n;
initial begin

$display("-------------------------------------------------------------------");
$display("-------------------------Arithmetic Operators----------------------");
arithmetic_operator(10,20);
$display("-------------------------------------------------------------------");


$display("-------------------------------------------------------------------");
$display("-------------------------Integer/Integer---------------------------");
arithmetic_operator(10,20);
$display("-------------------------------------------------------------------");

$display("-------------------------------------------------------------------");
$display("-------------------------real/Integer------------------------------");
arithmetic_operator(10.2,20);
$display("-------------------------------------------------------------------");


$display("-------------------------------------------------------------------");
$display("-------------------------Integer/real------------------------------");
arithmetic_operator(10,20.4);
$display("-------------------------------------------------------------------");

$display("-------------------------------------------------------------------");
$display("-------------------------real/real---------------------------------");
arithmetic_operator(10.5,20.4);
$display("-------------------------------------------------------------------");



$display("-------------------------Unary +,-, --------------------------------");
$display("a=%0d",+c);
$display("a=%0d",-c);

x=255;
y=255;
$display("-------------------------------------------------------------------");
$display("-------------------------signed and unsigned-----------------------");

$display("X is a signed = %0d  | Y is a unsigned = %0d ",x,y); //Note undefined varialbea/0 , a%0


$display("-------------------------------------------------------------------");
$display("-------------------------Operator precedence-----------------------");

$display("%0d",10+5*2);//mul first  
$display("%0d",(10+5)*2); // add first

 m=15;
 n=1;
result= m+n;
$display("-------------------------------------------------------------------");
$display("-------------------------Overflow condition------------------------");
$display("a=%b  | b=%b | result=%b",m,n,result);


end
function void arithmetic_operator(logic [5:0]a,logic[5:0]b);
begin
$display("a=%0d  | b=%0d | sum=%0d",a,b,a+b);

$display("a=%0d  | b=%0d | Sub=%0d",a,b,a-b);  //go with binary U will understand
// 2-7 =-5 how to  in 2'complement(111011=59)

$display("a=%0d  | b=%0d | MUL=%0d",a,b,a*b);

$display("a=%0d  | b=%0d | DIV=%0d",a,b,a/b);

$display("a=%0d  | b=%0d | DIV=%0d",a,b,a/b);
$display("a=%0f  | b=%0d | DIV=%0d",a,b,a/b);
$display("a=%0d  | b=%0f | DIV=%0d",a,b,a/b);
$display("a=%0f  | b=%0f | DIV=%0d",a,b,a/b);

$display("a=%0d  | b=%0d | MOD=%0d",a,b,a%b);

end
endfunction
endmodule


////////////////////////////////////////////////////////////////////////////
                          2.Relational Operator's
///////////////////////////////////////////////////////////////////////////

module top;
logic [4:0]x;
logic [4:0]y;
logic signed [4:0]a;
logic [4:0]b;
real m,n;
initial begin
$display("-------------------------------------------------------------------");
$display("-------------------------Relational Operators----------------------");
relational_operator(10,10);
$display("-------------------------------------------------------------------");



$display("-------------------------------------------------------------------");
$display("---------------------------signed vs unsigned----------------------");
sig_unsig(1,2);
$display("-------------------------------------------------------------------");

m=10.5;
n=5.5;
if(m>n)
	$display("m is greater=%f",m);
else 

	$display("n is greater=%f",n);

end
function void relational_operator(logic [4:0]x,logic [4:0]y );
begin
$display("x is greater than y = %0b ",x>y);
$display("x is less than y = %0b ",x<y);
$display("x is greater than or equal y = %0b ",x>=y);
$display("x is greater than or equal y  = %0b ",x<=y);
end
endfunction

function void sig_unsig(logic signed [4:0]a,logic [4:0]b);
begin
$display("x is greater than y = %0b ",x>y);
$display("x is less than y = %0b ",x<y);
$display("x is greater than or equal y = %0b ",x>=y);
$display("x is greater than or equal y  = %0b ",x<=y);
end
endfunction
endmodule
/*
////////////////////////////////////////////////////////////////////////////
                          3.Equality Operator's
///////////////////////////////////////////////////////////////////////////
module top;
logic [4:0]a;
logic [4:0]b;
initial begin
$display("-------------------------------------------------------------------");
$display("-------------------Equality operator's-----------------------------");
equality(10,10);

equality(10,20);

equality(4'b1x11,4'b1x11);


equality(4'b1x110,4'b1x11);//obserive here equal you got 0,1

end
function void equality( logic [4:0]a, logic [4:0]b);
begin
$display("a equal to b =%0d",a==b);

$display("a not  equal to b =%0d",a!=b);

$display("a case equal to b =%0d",a===b);//include X/Z

$display("a not case equal to b =%0d",a!==b); //include X/Z
end
endfunction
endmodule

////////////////////////////////////////////////////////////////////////////
                          4.logical Operator's
///////////////////////////////////////////////////////////////////////////
module top;
logic [4:0]a;
logic [4:0]b;
initial begin
$display("-------------------------------------------------------------------");
$display("-------------------Logical Operator's------------------------------");
logical(4'b1100,4'b0000);//expected output {and=0,or=1,not(a)=0}
logical(4'b0000,4'b0000);//expected output {and=0,or=0,not(a)=1}
logical(4'b1111,4'b1111);//expected output {and=1,or=1,not(a)=0}
logical(4'b1100,4'bxxxx);//expected output {and=x,or=1,not(a)=0}
logical(4'bxxxx,4'b0000);//expected output {and=0,or=x,not(a)=x}
end
function void logical(logic [4:0]a,logic [4:0]b);
begin
$display("a && b=%b",a&&b);
$display("a || b=%b",a||b);
$display("!a=%b",!a);
end
endfunction
endmodule

////////////////////////////////////////////////////////////////////////////
                          5.Bitwise Operator's
///////////////////////////////////////////////////////////////////////////

module top;
initial begin
$display("-------------------------------------------------------------------");
$display("-------------------Bitwise Operator's------------------------------");
bitwise(5'b11001,5'b11000);


bitwise(8'b1010_0001,8'b0000_1000);//set bits

bitwise(8'b1011_0110,8'b0000_1111);//mask bits

end
function void bitwise(logic [7:0]a,logic [7:0]b);begin
$display("AND=%b",a&b);
$display("OR=%b",a|b);
$display("NOT=%b",~a);
$display("NAND=%b",~(a&b));
$display("NOR=%b",~(a|b));
$display("XNOR=%b",~(a^b));
$display("XOR=%b",a^b);
end
endfunction
endmodule

////////////////////////////////////////////////////////////////////////////
                          6.Shift  Operator's
///////////////////////////////////////////////////////////////////////////

module top;
initial begin
$display("-------------------------------------------------------------------");
$display("-------------------Shift Operator's------------------------------");
shift_operators(5'b11001,5'b00001);//check here only normal sfift's
arith_operators(-8,2);//check here only normal sfift's
end
function void shift_operators(logic [4:0]a,logic [4:0]b);begin
$display("Left shift operator=%b",a<<b);
$display("Right shift operator=%b",a>>b);
end
endfunction
function void arith_operators(logic signed [4:0]a,logic signed[4:0]b);begin
$display("Left arithmetic shift operator=%b",a<<<b);
$display("Right arithmetic shift operator=%b",a>>>b);
end
endfunction
endmodule


////////////////////////////////////////////////////////////////////////////
                          7.Assignment Operator's
///////////////////////////////////////////////////////////////////////////

module top;
initial begin
$display("-------------------------------------------------------------------");
$display("-------------------Assignment Operator's------------------------------");

assignment (4,2);
end
function void assignment(logic signed[4:0]a,logic signed[8:0]b);begin
a=b;
$display("assignment %0d",a);
a+=b;
$display("add and assign %0d",a);
a-=b;
$display("sub and assign %0d",a);
a*=b;
$display("mult and assign %0d",a);
a/=b;
$display("div and assign %0d",a);
a%=b;
$display("mod and assign %0d",a);
a|=b;
$display("bitwise or and assign %0d",a);
a&=b;
$display("bitwise and and assign %0d",a);
a<<=b;
$display("left shift and assign %b",a);
a>>=b;
$display("right shift and assign %b",a);
a<<<=b;
$display("left arithmetic shift and assign %b",a);
a>>>=b;
$display("Right arithmetic shift and assign %b",a);
end
endfunction
endmodule

////////////////////////////////////////////////////////////////////////////
                          8.Increment/Decrement Operator's
///////////////////////////////////////////////////////////////////////////
module top;
$display("-------------------------------------------------------------------");
$display("-------------------Incr/decr Operator's------------------------------");
initial begin
	inc_decr(4,5);
end
function void inc_decr(logic signed[4:0]a,logic signed[4:0]b);
a=b;
b=++a;
$display("print pre a=%0d and b=%0d",a,b);
a=b;
b=--a;
$display("print pre a=%0d and b=%0d",a,b);
a=b;
b=a++;
$display("print post a=%0d and b=%0d",a,b);
a=b;
b=a--;
$display("print post a=%0d and b=%0d",a,b);
endfunction
endmodule

////////////////////////////////////////////////////////////////////////////
                          9.Concatination Operator's
///////////////////////////////////////////////////////////////////////////

module top;
initial begin
$display("-------------------------------------------------------------------");
$display("-------------------Concatination Operator's------------------------------");
conc (5'b11001,5'b11001);
end
function void conc(logic signed[4:0]a,logic signed[4:0]b);
$display("Add all elements %0b ",{a,b});
$display("Add all elements %0b ",{a,5'b0000000000,b});
$display("Add all elements %0b ",{a,5'b11xx,b});
$display("Add all elements %0b ",{a,5'bzzzxxx,b});
endfunction
endmodule


////////////////////////////////////////////////////////////////////////////
                          10.conditional Operator's
///////////////////////////////////////////////////////////////////////////
module top;
logic [4:0]result;
initial begin
$display("-------------------------------------------------------------------");
$display("-------------------Conditional Operator's--------------------------");
	cond(4,5,result);
end
function void cond(input logic [4:0]a,input logic [4:0]b,output logic [4:0]result);
result= (a>b)? a :b;
$display("print conditional operator=%0d",result);
endfunction
endmodule

























































