>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Good, Bad, Illegal, and Random Packet
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


Question Type	Purpose	Example
Good Packet	Valid packet that should be accepted	Valid address, length, checksum
Bad Packet	Packet with an error/corruption	Wrong checksum, corrupted data
Illegal Packet	Packet violating protocol rules	Reserved address, invalid command
Random Packet	Randomized packet to explore many combinations	Random address/data/length



Packet:
class eth_pkt;
static	int count;
rand bit [9:0]len;
rand byte payload [$];

function new();
	count++;
endfunction

virtual	function void print(string name="eth_pkt");
		$display("------------%s--------------------",name);
		$display("count=%0d",count);
		$display("len=%0d",len);
		$display("payload=%p",payload);
	endfunction
constraint a_c{
	len inside {[15:25]};
	payload.size()==len;
}
endclass

Good Packet:
class eth_good_pkt extends eth_pkt;
static int count_good;

function new();
	count_good++;
endfunction
function void print(string name="good_pkt");
	super.print(name);
	$display("count_good=%0d",count_good);
endfunction
endclass

Bad Packet:
class eth_bad_pkt extends eth_pkt;
static int count_bad;

function new();
	count_bad++;
endfunction
function void print(string name="bad_pkt");
	super.print(name);
	$display("count_bad=%0d",count_bad);
endfunction
endclass

Illegal Packet:
class eth_ill_pkt extends eth_pkt;
static int count_ill;

function new();
	count_ill++;
endfunction
function void print(string name="ill_pkt");
	super.print(name);
	$display("count_ill=%0d",count_ill);
endfunction
endclass


Genreater:

class eth_gen;

    eth_pkt       pkt;
    eth_good_pkt  gpkt;
    eth_bad_pkt   bpkt;
    eth_ill_pkt   ipkt;

    string test_name;
    bit [1:0] s;

    task run();

        repeat(10) begin

            $value$plusargs("test_name=%s", test_name);

            case(test_name)

                "GOOD_PKT": begin
                    gpkt = new();
                    gpkt.randomize();
                    gpkt.print();
                end

                "BAD_PKT": begin
                    bpkt = new();
                    bpkt.randomize();
                    bpkt.print();
                end

                "ILL_PKT": begin
                    ipkt = new();
                    ipkt.randomize();
                    ipkt.print();
                end

                "RANDOM_PKT": begin

                    s = $urandom_range(0,2);

                    case(s)

                        0: begin
                            gpkt = new();
                            gpkt.randomize();
                            gpkt.print();
                        end

                        1: begin
                            bpkt = new();
                            bpkt.randomize();
                            bpkt.print();
                        end

                        2: begin
                            ipkt = new();
                            ipkt.randomize();
                            ipkt.print();
                        end

                    endcase

                end

                default: begin
                    $display("ERROR: Unknown test_name = %s", test_name);
                end

            endcase

        end

    endtask

endclass


BFM:
class eth_bfm;
eth_pkt pkt;
task run();
	repeat(10)begin
mbox.get(pkt);//some problem come it will be good/bad/ill
pkt.print();
	end

endtask
endclass

Environment:
class eth_env;
	eth_bfm bfm=new();
	eth_gen gen=new();

	task run();
		fork
			bfm.run();
			gen.run();

		join
	endtask
endclass

TOP:
mailbox mbox=new();
`include "eth_pkt.sv"
`include "eth_good_pkt.sv"
`include "eth_bad_pkt.sv"
`include "eth_ill_pkt.sv"
`include "eth_gen.sv"
`include "eth_bfm.sv"
`include "eth_env.sv"
module tb;
eth_env env=new();
initial begin
	env.run();
end
endmodule


