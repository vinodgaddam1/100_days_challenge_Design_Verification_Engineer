/*/basic typedef 
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

*/

//enum FSM 
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

module top;
typedef logic [7:0]memory_t[0:15];
memory_t mem;
initial begin 
	mem[0]=8'hAA;
	mem[1]=8'h55;
	$display("mem[0]=%h",mem[0]);
	$display("mem[1]=%h",mem[1]);

end
endmodule


















