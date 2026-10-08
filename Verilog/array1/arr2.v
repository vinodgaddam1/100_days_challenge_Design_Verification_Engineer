
//normal integer operation
/*module tb;
integer arr[4:0];
integer i;

initial begin

for(i=0;i<5;i=i+1)
begin
	arr[i]= i+10;
end
for(i=0;i<5;i=i+1)
begin
	$display ("arr[%0D]=%0D",i,arr[i]);
 
end
end
endmodule

OUTPUT:
# arr[0]=10
# arr[1]=11
# arr[2]=12
# arr[3]=13
# arr[4]=14

//normal reg operation
module tb;
reg [7:0]mem[7:0];
integer i;

initial begin

for(i=0;i<8;i=i+1)
begin
	mem[i]= i+10;
end
for(i=0;i<8;i=i+1)
begin
	$display ("mem[%0D]=%0B",i,mem[i]);
 
end
end
endmodule

OUTPUT:
# mem[0]=1010
# mem[1]=1011
# mem[2]=1100
# mem[3]=1101
# mem[4]=1110
# mem[5]=1111
# mem[6]=10000
# mem[7]=10001

//normal time delay in array operation
module tb;
time delay [3:0];
integer i;

initial begin

for(i=0;i<4;i=i+1)
begin
	delay[i]= i;
end
for(i=0;i<4;i=i+1)
begin
	$display ("delay[%0D]=%0t",i,delay[i]);
 
end
end
endmodule

OUTPUT:
# delay[0]=0
# delay[1]=1
# delay[2]=2
# delay[3]=3

//normal real operation
module tb;
real voltage[7:0];
integer i;

initial begin
voltage[0]=3.1;
voltage[1]=3.4;
voltage[2]=3.5555555;
voltage[3]=3.609;
voltage[4]=3.7;
voltage[5]=3.2345;
for(i=0;i<8;i=i+1)begin
	$display ("voltage[%0D]=%0F",i,voltage[i]);
 
end
end
endmodule
OUTPUT:

# voltage[0]=11
# voltage[1]=11
# voltage[2]=100
# voltage[3]=100
# voltage[4]=100
# voltage[5]=11
# voltage[6]=0
# voltage[7]=0


// filling arrays Using Loops
module tb;
integer arr[0:9];
integer i;

initial begin
	for(i=0;i<10;i=i+1)begin
		arr[i]=i;
	end
for(i=0;i<10;i=i+1)begin
	$display ("arr[%0D]=%0D",i,arr[i]);
 
end
end
endmodule
OUTPUT:
# arr[0]=0
# arr[1]=1
# arr[2]=2
# arr[3]=3
# arr[4]=4
# arr[5]=5
# arr[6]=6
# arr[7]=7
# arr[8]=8
# arr[9]=9

//Fill the squares
module tb;
integer arr[0:9];
integer i;

initial begin
	for(i=0;i<10;i=i+1)begin
		arr[i]=i*i;
	end
for(i=0;i<10;i=i+1)begin
	$display ("arr[%0D]=%0D",i,arr[i]);
 
end
end
endmodule
OUTPUT:
# arr[0]=0
# arr[1]=1
# arr[2]=4
# arr[3]=9
# arr[4]=16
# arr[5]=25
# arr[6]=36
# arr[7]=49
# arr[8]=64
# arr[9]=81

//fill only even Numbers
module tb;
integer arr[0:9];
integer i;

initial begin
	for(i=0;i<10;i=i+1)begin
		arr[i]=i*2;
	end
for(i=0;i<10;i=i+1)begin
	$display ("arr[%0D]=%0D",i,arr[i]);
 
end
end
endmodule
OUTPUT:
# arr[0]=0
# arr[1]=2
# arr[2]=4
# arr[3]=6
# arr[4]=8
# arr[5]=10
# arr[6]=12
# arr[7]=14
# arr[8]=16
# arr[9]=18

//Using Conditional statment
module tb;
integer arr[0:9];
integer i;

initial begin
	for(i=0;i<10;i=i+1)begin
		if(i%2==0)
		arr[i]=100;
		else
			arr[i]=0;
	end
for(i=0;i<10;i=i+1)begin
	$display ("arr[%0D]=%0D",i,arr[i]);
 
end
end
endmodule
OUTPUT: THIS IS EVEN CONDITIOAN EVEN NUMBERS =100 --> ODD NUMBERS=0
 arr[0]=100
# arr[1]=0
# arr[2]=100
# arr[3]=0
# arr[4]=100
# arr[5]=0
# arr[6]=100
# arr[7]=0
# arr[8]=100
# arr[9]=0

//Nested if 
module tb;
integer arr[0:9];
integer i;

initial begin
	for(i=0;i<10;i=i+1)begin
		arr[i]=i*10;
		if (arr[i]>50)
	$display ("arr[%0D]=%0D",i,arr[i]);
		end
		for(i=0;i<10;i=i+1)begin
		if (arr[i]<80)
	$display ("arr[%0D]=%0D",i,arr[i]);
		end

end
endmodule
OUTPUT:
# arr[6]=60
# arr[7]=70
# arr[8]=80
# arr[9]=90
# arr[0]=0
# arr[1]=10
# arr[2]=20
# arr[3]=30
# arr[4]=40
# arr[5]=50
# arr[6]=60
# arr[7]=70

// if-else-if
module tb;
integer arr[0:9];
integer i;

initial begin
	for(i=0;i<10;i=i+1)begin
		arr[i]=i*10;
		if (arr[i]<50)
	$display ("LESS THAN 50 arr[%0D]=%0D",i,arr[i]);
		
	        else if (arr[i]<70)
	$display ("50 TO 69 arr[%0D]=%0D",i,arr[i]);
       else
	$display (" MORE THAN 70 arr[%0D]=%0D",i,arr[i]);
end
end
endmodule
OUTPUT:
# LESS THAN 50 arr[1]=10
# LESS THAN 50 arr[2]=20
# LESS THAN 50 arr[3]=30
# LESS THAN 50 arr[4]=40
# 50 TO 69 arr[5]=50
# 50 TO 69 arr[6]=60
#  MORE THAN 70 arr[7]=70
#  MORE THAN 70 arr[8]=80
#  MORE THAN 70 arr[9]=90

//while loop
module tb;
integer arr[0:9];
integer i;
initial begin
	i=0;
while(i<10) begin
	arr[i]=i;
	$display (" arr[%0D]=%0D",i,arr[i]);
	i=i+1;

end
end
endmodule
OUTPUT:
#  arr[0]=0
#  arr[1]=1
#  arr[2]=2
#  arr[3]=3
#  arr[4]=4
#  arr[5]=5
#  arr[6]=6
#  arr[7]=7
#  arr[8]=8
#  arr[9]=9

//repeated loop

module tb;
initial begin
	repeat (10) begin
	$display ("Hello World");
	end
end
endmodule
OUTPUT:
# Hello World
# Hello World
# Hello World
# Hello World
# Hello World
# Hello World
# Hello World
# Hello World
# Hello World
# Hello World
  

//for loop
//
module tb;
integer arr[4:0];
integer i;

initial begin

for(i=0;i<5;i=i+1)
begin
	arr[i]= i+10;
end
for(i=0;i<5;i=i+1)
begin
	$display ("arr[%0D]=%0D",i,arr[i]);
 
end
end
endmodule*/

//forever loop
module tb;
integer clk[9:0];
integer i;
initial begin
	for (i=0;i<10;i=i+1) begin
		clk[i]=0;
	forever begin
		#10;
		for(i=0;i<10;i=i+1)       
		clk[i]=~clk[i];
		for(i=0;i<10;i=i+1)       
	$display ("Time=%0t ,clk=%0d",$time,clk[i]);
	end
end
end
initial 
	$finish;
endmodule






