>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    Events In SystemVerilog
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
In SystemVerilog, an event is a synchronization mechanism used to allow one process to notify another process that something has happened. These three are commonly grouped under inter-process communication and synchronization.

 One process rings the bell → -> event_name 
 Another process waits for the bell → @event_name 
 Both processes can continue independently until synchronization is needed.

1. Event declaration
event e1;
Syntax:
event event_name;

2. Triggering an event
For Example:

module tb;

  event e1;

  initial begin
    #10;
    $display("Triggering event");
    -> e1;
  end

endmodule

3. Waiting for an event

For Example:
module tb;

  event e1;

  initial begin
    $display("Waiting for event...");
    @e1;
    $display("Event received");
  end

  initial begin
    #10;
    $display("Event triggered");
    -> e1;
  end

endmodule

4. event.triggered
It tells you whether the event has been triggered in the current simulation time slot.
event e1;

initial begin
   #10;
   -> e1;
end

initial begin
   wait(e1.triggered);
   $display("Event occurred");
End
5. Difference between @event and wait(event.triggered)
@e1;
Waits for a future event trigger.
wait(e1.triggered);
Checks the event's triggered state and can avoid certain race conditions when the event has already been triggered in the same simulation time slot.

For Example: commonly used between parallel processes.
module tb;

  event data_ready;

  initial begin
    fork

      begin
        #10;
        $display("Producer: Data ready");
        -> data_ready;
      end

      begin
        $display("Consumer: Waiting");
        @data_ready;
        $display("Consumer: Processing data");
      end

    join
  end

endmodule

