/***************************************************************************
                        For loop based-problems 
***************************************************************************
             j = COLUMN
          1   2   3   4   5
        +---+---+---+---+---+
i = 1   | * | * | * | * | * |
        +---+---+---+---+---+
i = 2   | * | * | * | * | * |
        +---+---+---+---+---+
i = 3   | * | * | * | * | * |
        +---+---+---+---+---+
i = 4   | * | * | * | * | * |
        +---+---+---+---+---+
i = 5   | * | * | * | * | * |
        +---+---+---+---+---+


| Pattern              | Rows     | Inner-loop control              | What to print |
| -------------------- | -------- | ------------------------------- | ------------- |
| Solid box            | `i=1..N` | `j=1..N`                        | `*`           |
| Increasing triangle  | `i=1..N` | `j<=i`                          | `*`           |
| Decreasing triangle  | `i=1..N` | `j<=N-i+1`                      | `*`           |
| Number triangle      | `i=1..N` | `j<=i`                          | `j`           |
| Same-number triangle | `i=1..N` | `j<=i`                          | `i`           |
| Number box           | `i=1..N` | `j=1..N`                        | `j`           |
| Same-number box      | `i=1..N` | `j=1..N`                        | `i`           |
| Right triangle       | `i=1..N` | spaces=`N-i`, stars=`i`         | `*`           |
| Pyramid              | `i=1..N` | spaces=`N-i`, stars=`2*i-1`     | `*`           |
| Inverted pyramid     | `i=1..N` | spaces=`i-1`, stars=`2*N-2*i+1` | `*`           |
| Even triangle        | `i=1..N` | `j<=i`                          | `2*j`         |
| Odd triangle         | `i=1..N` | `j<=i`                          | `2*j-1`       |
| Floyd triangle       | `i=1..N` | `j<=i`                          | `num`         |



//Print 1 to 5
module tb;
integer i;
initial begin
for (i=0;i<=5;i=i+1)begin
	$display("%0d",i);
end
end
endmodule
OUTPUT:
# 0
# 1
# 2
# 3
# 4
# 5

//Print 5 to 1
module tb;
integer i;
initial begin
for (i=5;i>=1;i=i-1)begin
	$display("%0d",i);
end
end
endmodule
OUTPUT:
# 5
# 4
# 3
# 2
# 1

//print Square pattern
module tb;
integer i;
integer j;
initial begin
	for(i=0;i<=5;i=i+1)begin
		for(j=1;j<=5;j=j+1)
			$write("*");
		
                	$display("");	
end
end
endmodule
OUTPUT:
# *****
# *****
# *****
# *****
# *****
# *****
//print rectangle pattern
module tb;
integer i;
integer j;
initial begin
	for(i=0;i<=3;i=i+1)begin //---->perform rows
		for(j=1;j<=20;j=j+1) //----->perfom columns
			$write("*");
		
                	$display("");	
end
end
endmodule
OUTPUT:
# ********************
# ********************
# ********************
# ********************
module tb;
integer i;
integer j;
initial begin
	for(i=0;i<=5;i=i+1)begin //---->perform rows
		for(j=0;j<=i;j=j+1) //----->perfom columns
			$write("*");
		
                	$display("");	
end
end
endmodule
OUTPUT:
# *
# **
# ***
# ****
# *****
# ******

module tb;
integer i;
integer j;
initial begin
	for(i=5;i>=1;i=i-1)begin //---->perform rows
		for(j=1;j<=i;j=j+1) //----->perfom columns
			$write("*");
		
                	$display("");	
end
end
endmodule
OUTPUT:
# *****
# ****
# ***
# **
# *

module tb;
integer i;
integer j;
initial begin
	for(i=5;i>=1;i=i-1)begin //---->perform rows
		for(j=1;j<=i;j=j+1) //----->perfom columns
			$write("%0d",j);
		
                	$display("");	
end
end
endmodule
OUTPUT:
# 12345
# 1234
# 123
# 12
# 1

module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin //---->perform rows
		for(j=1;j<=i;j=j+1) //----->perfom columns
			$write("%0d",j);
		
                $display("");	
end
end
endmodule
OUTPUT:
# 1
# 12
# 123
# 1234
# 12345


module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin //---->perform rows
		for(j=1;j<=i;j=j+1) //----->perfom columns
                     $write("%0d",i);
                $display("");	
end
end
endmodule
OUTPUT:
# 1
# 22
# 333
# 4444
# 55555


module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin //---->perform rows
		for(j=1;j<=5;j=j+1) //----->perfom columns
                    $write("%0d",j);		 
               	$display("");	
end
end
endmodule
OUTPUT:
# 12345
# 12345
# 12345
# 12345
# 12345



module tb;
integer i;
integer j;
integer num;
initial begin
	num=1;
	for(i=1;i<=5;i=i+1)begin //---->perform rows
		for(j=1;j<=i;j=j+1) begin //----->perfom columns
                   $write("%0d",num);
		    num=num+1;
	         end
                $display("");	
end
end
endmodule
OUTPUT:
# 1
# 23
# 456
# 78910
# 1112131415


module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin //---->perform rows
		for(j=1;j<=i;j=j+1) //----->perfom columns
                   $write("%0d",j*2);

		
               	$display("");	
end
end
endmodule
OUTPUT:
# 2
# 24
# 246
# 2468
# 246810

module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin //---->perform rows
		for(j=1;j<=5;j=j+1)begin
                if(i==1 || i==5 || j==1 ||j==5)
                   $write("*");
		else 
                   $write(" ");

                end
		
               	$display("");	
end
end
endmodule
OUTPUT:
# *****
# *   *
# *   *
# *   *
# *****

module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin //---->perform rows
		for(j=1;j<=5-i;j=j+1)
                   $write(" ");
		   for(j=1;j<=i;j=j+1)
                     $write("*");
		 $display("");

               
	end
end
endmodule
OUTPUT:
#     *
#    **
#   ***
#  ****
# *****

module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin
	       //space
		for(j=1;j<=i-1;j=j+1)
                   $write(" ");
		   //stars
		   for(j=1;j<=5-i+1;j=j+1)
                     $write("*");
		     $display("");

               
	end
end
endmodule
OUTPUT:
# *****
#  ****
#   ***
#    **
#     *

module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin
	       //space
		for(j=1;j<=5-i;j=j+1)
                   $write(" ");
		   //stars
		   for(j=1;j<=2*i-1;j=j+1)
                     $write("*");
		     $display("");

               
	end
end
endmodule
OUTPUT:
#     *
#    ***
#   *****
#  *******
# *********

module tb;
integer i;
integer j;
initial begin
	for(i=1;i<=5;i=i+1)begin
	       //space
		for(j=1;j<=i-1;j=j+1)
                   $write(" ");
		   //stars
		   for(j=1;j<=11-2*i;j=j+1)
                     $write("*");
		     $display("");

               
	end
end
endmodule
OUTPUT:
# *********
#  *******
#   *****
#    ***
#     *
*/
module tb;
integer i;
integer j;
initial begin
	//upper half
	for(i=1;i<=5;i=i+1)begin
	       //space
		for(j=1;j<=5-i;j=j+1)
                   $write(" ");
		   //stars
		   for(j=1;j<=2*i-1;j=j+1)
                     $write("*");
		     $display("");
        
	     end
	     //lower half
	for(i=1;i<=4;i=i+1)begin
	       //space
		for(j=1;j<=i;j=j+1)
                   $write(" ");
		   //stars
		   for(j=1;j<=9-2*i;j=j+1)
                     $write("*");
		     $display("");
          
	end
end
endmodule
OUTPUT:
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
















