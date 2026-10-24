==========================================================================
        SystemVerilog Constraints problems Level-9
==========================================================================

//91:Generate a 32-bit address aligned to a 4-byte boundary. (Memory interface)
//It will look like this 0,4,8,c....(Hex) Binary last 2-bits will be 00 lets
//check (00_00)-0001-0010-0011-(01_00)-0101-0110-0111-(10_00) obj here last
//4-byte align means last two digitis will be "00"
class sample;
rand  bit [31:0]addr;
function void print();
	$display("Address=%0h",addr);	
endfunction

constraint aligend{
	  //addr % 4 ==0;
	  addr [1:0]==2'b00;
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
OUTPUT: See here 
# Address=5ff9fee8  ---(last two bit zero/ it will divisable by 4 Ex: 8%4==0,10_00 in binary last 2-digit are 00,check remaing things)
# Address=ae6b44a0
# Address=38e29a1c
# Address=9825f184
# Address=dcbceb80

//92:Generate a 32-bit address aligned to a 16-byte boundary.(Burst access)
class sample;
rand  bit [31:0]addr;
function void print();
	$display("Address=%0h",addr);	
endfunction

constraint aligend{
	  addr % 16 ==0;
	  //addr [3:0]==4'b0000;
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
OUTPUT:
# Address=323f1140
# Address=65090ab0
# Address=da35a80
# Address=40b9b4a0
# Address=eb3d0c80


//93:Generate a burst length between 1 and 16. (Burst transaction)
class sample;
rand  int burst_len;
function void print();
	$display("Burst_length=%0d",burst_len);	
endfunction

constraint burst_length{
	 burst_len inside {[1:16]};
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

OUTPUT:
 Burst_length=11
# Burst_length=8
# Burst_length=4
# Burst_length=2
# Burst_length=3
# Burst_length=3
# Burst_length=1

//94:Generate a 4-bit opcode from a permitted set of operation codes.
class sample;
rand  bit [3:0]opcode;
function void print();
	$display("opcode=%b",opcode);	
endfunction

constraint burst_length{
	 opcode inside {4'd0,4'd4,4'd6,4'ha};
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

OUTPUT:
# opcode=0110
# opcode=0100
# opcode=0000
# opcode=1010
# opcode=0100
# opcode=0000
# opcode=0100
# opcode=0000



//95:Generate a 32-bit data value with its least significant bit equal to 0.
class sample;
rand  bit [31:0]data;
function void print();
	$display("data=%0d",data);	
endfunction

constraint a_c{
	 data % 2 ==0;
	 //data[0]==1'b0;
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

OUTPUT:
# data=1633840868
# data=199355940
# data=570046206
# data=348639076
# data=489657496
# data=3169149390
# data=332876920
# data=3978472000
# data=2831183654


//96:Generate an 8-bit value with exactly four bits set to 1.
class sample;
rand  bit [7:0]data;
function void print();
	$display("data=%b",data);	
endfunction

constraint a_c{
	 $countones(data)==4;  //Here $countones is count the number of ones in the give data 
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


OUTPUT:
# data=01100101
# data=01010011
# data=10101001
# data=11101000
# data=11010001
# data=10000111
# data=11000101
# data=00110110


//97:Generate a 16-bit value with an even number of set bits.
class sample;
rand  bit [15:0]data;
function void print();
	$display("data=%0d set_bit=%0d",data,$countones(data));	
endfunction

constraint a_c{
	$countones(data) % 2 ==0;
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
OUTPUT:
# data=50319 set_bit=8
# data=24013 set_bit=10
# data=24975 set_bit=8
# data=62694 set_bit=10
# data=17026 set_bit=4
# data=30315 set_bit=10
# data=61675 set_bit=10
# data=60543 set_bit=12


//98:Generate a memory transaction with aligned address, legal burst length, and legal operation type combined transaction.

typedef enum bit [1:0] {WRITE,READ}oper;
class sample;
rand  bit [31:0]addr;
rand  bit [15:0]burst_len;
rand   oper operation;


function void print();
	$display("Address = 0x%0h | Burst_Length = %0d | Operation = %0s",addr,burst_len,operation.name());	
endfunction

constraint a_c{
	addr % 4==0;
	burst_len inside {[1:16]};
	operation inside {WRITE,READ};
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

OUTPUT:
# Address = 0x323f1144 | Burst_Length = 11 | Operation = WRITE
# Address = 0x65090ab0 | Burst_Length = 7 | Operation = WRITE
# Address = 0xda35a88 | Burst_Length = 1 | Operation = READ
# Address = 0x40b9b4ac | Burst_Length = 9 | Operation = READ
# Address = 0xeb3d0c84 | Burst_Length = 16 | Operation = READ


//99:Generate a packet with a length between 64 and 1500 bytes and a legal packet type (packet Verification).

typedef enum bit[1:0] {EHTERNET,IPV4,IPV6,ARP}packet_type_t;
class sample;
rand packet_type_t pkt;	
rand  bit[15:0] pkt_len;

function void print();
	$display("PACKET_TYPE=%0s | PACKET_LENGTH=%0d",pkt.name(),pkt_len);	
endfunction

constraint packet_c{
	pkt_len inside {[64:1500]};
	pkt inside {EHTERNET,IPV4,IPV6,ARP};
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

OUTPUT:
# PACKET_TYPE=EHTERNET | PACKET_LENGTH=667
# PACKET_TYPE=ARP | PACKET_LENGTH=99
# PACKET_TYPE=IPV6 | PACKET_LENGTH=189
# PACKET_TYPE=EHTERNET | PACKET_LENGTH=776
# PACKET_TYPE=ARP | PACKET_LENGTH=1066
# PACKET_TYPE=ARP | PACKET_LENGTH=1453
*/

//100:Generate a transaction array with unique IDs, legal addresses, and ascending timestamps.(END-TO-END Verification).

class sample;

rand int id[5];
rand int addr[5];
rand int unsigned timestep[5];


function void print();
$display("ID'S = %p | ADDRESS = %p | TIMESTEP = %p",id,addr,timestep);
endfunction

constraint trans1 {
foreach (id[i]){
id[i] inside {[1:50]};
unique{id};
     }
}

constraint trans2 {
foreach (addr[i]){
addr[i] inside {[1:16]};
}
}


constraint trans3 {
foreach(timestep[i]){
timestep[i] inside {[10:100]};
if(i>0)
	timestep[i]>timestep[i-1];
}
     }
endclass

module top;
sample s;
initial begin
	repeat (5)begin
s=new();
assert (s.randomize());
s.print();
end
end
endmodule

OUTPUT:
# ID'S = '{8, 31, 25, 14, 46} | ADDRESS = '{8, 6, 5, 6, 11} | TIMESTEP = '{13, 18, 63, 78, 85}
# ID'S = '{10, 22, 19, 42, 46} | ADDRESS = '{8, 6, 2, 9, 3} | TIMESTEP = '{23, 30, 35, 36, 71}
# ID'S = '{17, 12, 26, 20, 33} | ADDRESS = '{9, 16, 7, 14, 16} | TIMESTEP = '{26, 29, 65, 93, 95}
# ID'S = '{14, 27, 23, 43, 38} | ADDRESS = '{3, 4, 10, 13, 10} | TIMESTEP = '{70, 71, 72, 74, 79}
# ID'S = '{23, 7, 33, 44, 45} | ADDRESS = '{6, 9, 4, 2, 12} | TIMESTEP = '{26, 29, 30, 31, 70}
