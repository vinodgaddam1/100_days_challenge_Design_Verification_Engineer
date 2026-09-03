>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Level 4 — Queues  Arrays
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Goal: Master FIFO/LIFO-style data structures.


1.Create queue using int q[$] add elements using "push_back()"

module top;
int q[$];
initial begin
	q.push_back(10);
	$display("queue=%p",q);
end
endmodule 
OUTPUT:
# queue='{10}


2. push_front()

module top;
int q[$];
initial begin
	q.push_back(10);
	$display("queue=%p",q);
	q.push_front(20);
	$display("queue=%p",q);
end
endmodule 
OUTPUT:
# queue='{10}
# queue='{20, 10}



3. pop_back()

module top;
int q[$];
initial begin
	q.push_back(10);
	q.push_back(30);
	q.push_front(20);
	$display("queue=%p",q);


	q.pop_back();
	$display("queue=%p",q);

end
endmodule 
OUTPUT:
# queue='{20, 10, 30}
# queue='{20, 10}



4. pop_front()


module top;
int q[$];
initial begin
	q.push_back(10);
	q.push_back(30);
	q.push_front(20);
	q.push_front(50);
	$display("queue=%p",q);


	q.pop_front();
	$display("queue=%p",q);
end
endmodule
OUTPUT:
# queue='{50, 20, 10, 30}
# queue='{20, 10, 30}


5. insert()

module top;
string q[$];
initial begin
	q.push_back("VINOD ");

	$display("queue=%p",q);


	//q.insert(7," KUMAR");//obj this is illegal
	q.insert(1," KUMAR");
	$display("queue=%p",q);
end
endmodule
# queue='{"VINOD "}
# queue='{"VINOD ", " KUMAR"}


6. delete()

module top;
string q[$];
initial begin
	q.push_back("  HI I'M VINOD ");

	$display("queue=%p",q);


	q.insert(1," KUMAR .");
	q.insert(2,"I Recetly ");
	q.insert(3," Completed My Graduation");
	$display("queue=%p",q);

	q.delete(1);
	$display("queue=%p",q); //obj this one (index)

	q.delete();
	$display("queue=%p",q); //obj this one  
end
endmodule

OUTPUT:
# queue='{"  HI I'M VINOD "}
# queue='{"  HI I'M VINOD ", " KUMAR .", "I Recetly ", " Completed My Graduation"}
# queue='{"  HI I'M VINOD ", "I Recetly ", " Completed My Graduation"}
# queue='{}






7. size()

module top;
string q[$];
initial begin
	q.push_back("VINOD ");
	$display("queue=%p",q);


	q.insert(1," KUMAR");
	$display("queue=%p",q);

	$display("queue=%0d",q.size());

end
endmodule
OUTPUT:
# queue='{"VINOD "}
# queue='{"VINOD ", " KUMAR"}
# queue=2

8. Access queue elements using index

module top;
int q[$];
initial begin
	q={10,20,30,40,50};
	$display("Queue=%p",q);
	foreach(q[i])begin
	$display("q[%0d] = %0d",i,q[i]);
end
end
endmodule
OUTPUT:
# Queue='{10, 20, 30, 40, 50}
# q[0] = 10
# q[1] = 20
# q[2] = 30
# q[3] = 40
# q[4] = 50



9. Implement FIFO
First person enters → First person leaves

module top;
int q[$];
initial begin
	q.push_front(10);
	$display("queue=%p",q);
	q.push_front(20);
	$display("queue=%p",q);
	q.push_front(30);
	$display("queue=%p",q);
	q.push_front(40);
	$display("queue=%p",q);
	q.push_front(50);
	$display("queue=%p",q);

	q.pop_back();
	$display("queue=%p",q);
	q.pop_back();
	$display("queue=%p",q);
	q.pop_back();
	$display("queue=%p",q);
	q.pop_back();
	$display("queue=%p",q);
	q.pop_back();
	$display("queue=%p",q);
end
endmodule
OUTPUT:
# queue='{10}
# queue='{20, 10}
# queue='{30, 20, 10}
# queue='{40, 30, 20, 10}
# queue='{50, 40, 30, 20, 10}
# queue='{50, 40, 30, 20}
# queue='{50, 40, 30}
# queue='{50, 40}
# queue='{50}
# queue='{}



10. Implement LIFO / Stack
enter last -->level frist out

module top;
int q[$];
initial begin
	q.push_back(10);
	$display("queue=%p",q);
	q.push_back(20);
	$display("queue=%p",q);
	q.push_back(30);
	$display("queue=%p",q);
	q.push_back(40);
	$display("queue=%p",q);
	q.push_back(50);
	$display("queue=%p",q);


        q.pop_back();
	$display("queue=%p",q);
        q.pop_back();
	$display("queue=%p",q);
        q.pop_back();
	$display("queue=%p",q);
        q.pop_back();
	$display("queue=%p",q);
        q.pop_back();
	$display("queue=%p",q);
end
endmodule
OUTPUT://who ever enter last they come out frist 
# queue='{10}
# queue='{10, 20}
# queue='{10, 20, 30}
# queue='{10, 20, 30, 40}
# queue='{10, 20, 30, 40, 50}
# queue='{10, 20, 30, 40}
# queue='{10, 20, 30}
# queue='{10, 20}
# queue='{10}
# queue='{}


