*************************************
     Call Back Methods in SystemVerilog
*************************************

The callback are used to alert the behavior of the component without modify its code.
allows plug-and-play mechanism to establish a reusable verification environment.
based on the hook method call the user-define code is executed instead of  the empty callback method.

For Example:
//We will understand callbacks using three classes
//1. transaction – Generates transaction data.
//2. callback – Defines callback methods.
//3. driver – Executes the callback methods.

//callback class
class trans;

    rand int addr;
    rand int data;


constraint cg{
addr inside {[10:20]};
data inside {[10:20]};
}
endclass


// Callback class

class callback;

    virtual function void pre_drive(trans tx);
       // tx.data=1;
        $display("Before Driving");
        $display("ADDR = %0D | DATA = %0D",tx.addr,tx.data);

    endfunction


    virtual function void post_drive(trans tx);
           //tx.data=40;
        $display("After Driving");
        $display("ADDR = %0D | DATA = %0D",tx.addr,tx.data);

    endfunction

endclass


// Driver class

class driver;

    callback cb;

    function new(callback cb);
        this.cb = cb;
    endfunction

    task driver(trans tx);

        cb.pre_drive(tx);
	//Before i drive this trasaction, callback object,execute your
	//pre_drive() method.

        $display("Driving Transaction");
        $display("ADDR = %0D | DATA = %0D",tx.addr,tx.data);

        cb.post_drive(tx);
	//I have completed driving .now execute your post_driver method.

    endtask

endclass


// Top module

module top;

    trans tx;
    callback cb;
    driver drv;

    initial begin

        tx = new();
        cb = new();

        // Pass callback object to driver constructor
        drv = new(cb);

        assert(tx.randomize());

        drv.driver(tx);

    end

endmodule 
