1. Basic typedef in SystemVerilog:
Definition
typedef is used to create a new name (alias) for an existing data type.
Syntax:
typedef existing_type new_type;

Example:
module top;
typedef int data_t;
data_t a;
data_t b;
data_t c;
initial begin
	a=10;
	b=20;
	$display("a=%0d | b=%0d",a,b);
end
endmodule


module top;
typedef logic [7:0]data_t;
data_t a;
data_t b;
initial begin
	$display("a=%0d | b=%0d",a,b);
end
endmodule

2.typedef struct

Definition
typedef struct is used to create a reusable user-defined structure containing multiple related data members.

Syntax:
typedef struct {
    data_type member1;
    data_type member2;
    data_type member3;
} struct_name;

Example:
module top;
typedef struct  {
	logic [7:0]a;
	logic [10:0]b;
	string c;
} data_t;

data_t data;
initial begin
	data.a=10;
	data.b=40;
	data.c="Vinod";
	$display("%0d",data.a);
	$display("%0d",data.b);
	$display("%s",data.c);
	
end
endmodule

3.typedef enum
Definition
typedef enum is used to create a user-defined type containing a set of named constant values. It is commonly used to represent FSM states.

Syntax
typedef enum logic [1:0] {
    IDLE,
    READ,
    WRITE,
    DONE
} state_t;

Example:
module top;
typedef enum  logic [1:0] { 
IDLE,
READ,
WRITE,
DONE
}state_t;

state_t st;
initial begin
	st=READ;
	$display("state=%s",st.name());
	st=WRITE;
	$display("state=%s",st.name());
	st=DONE;
	$display("state=%s",st.name());
	st=IDLE;
	$display("state=%s",st.name());
end
endmodule

4.typedef union:
Definition
typedef union is used to create a user-defined union type in which all members share the same memory storage.
Syntax
typedef union {
    data_type member1;
    data_type member2;
} union_name;

Example:
typedef union {bit[31:0]b;int i;} num_u;
module top;
num_u un;
initial begin
    un.b=32'ha435;
	un.i=23;
  $display("un = %x %x",un.b,un.i);
	
end
endmodule


typedef union {
    bit [7:0] b;
  bit [10:0] x;
} num_u;

module top;
    num_u un;

    initial begin
        un.b = 8'hAA;
        $display("b = %h, x = %h", un.b, un.x);

        un.x = 8'h55;
        $display("b = %h, x = %h", un.b, un.x);
    end
endmodule
*/



typedef union {
       // 21 bits
    int        i; 
  bit [20:0] b;// 32 bits
} num_u;

module top;
    num_u un;

    initial begin
        un.i = 5;
        $display("b = %b", un.b);
        $display("i = %b", un.i);

        un.i = 10;
        $display("b = %b", un.b);
        $display("i = %b", un.i);
    end
endmodule


