//=========================================================================
//                            UART TESTBENCH
//=========================================================================

module uart_tb;

    logic       clk;
    logic       rst;

    logic       wr_enb;
    logic       rdy_clr;

    logic [7:0] data_in;

    logic       tx;
    logic       busy;

    logic [7:0] data_out;
    logic       ready;


    //-------------------------------------------------------------------------
    // 50 MHz clock
    //-------------------------------------------------------------------------
    initial begin
        clk = 1'b0;

        forever #10 clk = ~clk;

    end


    //-------------------------------------------------------------------------
    // DUT
    //-------------------------------------------------------------------------
    uart_top dut (
        .clk     (clk),
        .rst     (rst),

        .wr_enb  (wr_enb),
        .rdy_clr (rdy_clr),

        .data_in (data_in),

        .tx      (tx),
        .busy    (busy),

        .data_out(data_out),
        .ready   (ready)
    );


    //-------------------------------------------------------------------------
    // Task: Send one byte
    //-------------------------------------------------------------------------
    task send_data(input logic [7:0] data);

        begin

            // Wait until transmitter is free
            wait (busy == 1'b0);

            @(posedge clk);

            data_in <= data;
            wr_enb  <= 1'b1;

            @(posedge clk);

            wr_enb  <= 1'b0;

            $display(
                "[%0t] TX DATA = %02h",
                $time,
                data
            );

        end

    endtask


    //-------------------------------------------------------------------------
    // Main test
    //-------------------------------------------------------------------------
    initial begin

        // Initialize
        rst     = 1'b1;
        wr_enb  = 1'b0;
        rdy_clr = 1'b0;
        data_in = 8'h00;


        // Reset
        repeat (5)
            @(posedge clk);

        rst = 1'b0;

        $display("-----------------------------------------");
        $display("       UART TEST STARTED");
        $display("-----------------------------------------");


        //=============================================================
        // TEST 1
        //=============================================================
        send_data(8'hA5);

        wait (ready == 1'b1);

        #1;

        if (data_out == 8'hA5)
            $display(
                "[%0t] TEST 1 PASS : RX DATA = %02h",
                $time,
                data_out
            );
        else
            $display(
                "[%0t] TEST 1 FAIL : Expected = A5, Got = %02h",
                $time,
                data_out
            );


        // Clear ready
        @(posedge clk);
        rdy_clr <= 1'b1;

        @(posedge clk);
        rdy_clr <= 1'b0;


        //=============================================================
        // TEST 2
        //=============================================================
        send_data(8'h3C);

        wait (ready == 1'b1);

        #1;

        if (data_out == 8'h3C)
            $display(
                "[%0t] TEST 2 PASS : RX DATA = %02h",
                $time,
                data_out
            );
        else
            $display(
                "[%0t] TEST 2 FAIL : Expected = 3C, Got = %02h",
                $time,
                data_out
            );


        // Clear ready
        @(posedge clk);
        rdy_clr <= 1'b1;

        @(posedge clk);
        rdy_clr <= 1'b0;


        //=============================================================
        // TEST 3
        //=============================================================
        send_data(8'h55);

        wait (ready == 1'b1);

        #1;

        if (data_out == 8'h55)
            $display(
                "[%0t] TEST 3 PASS : RX DATA = %02h",
                $time,
                data_out
            );
        else
            $display(
                "[%0t] TEST 3 FAIL : Expected = 55, Got = %02h",
                $time,
                data_out
            );


        // Clear ready
        @(posedge clk);
        rdy_clr <= 1'b1;

        @(posedge clk);
        rdy_clr <= 1'b0;


        //=============================================================
        // TEST 4
        //=============================================================
        send_data(8'hF0);

        wait (ready == 1'b1);

        #1;

        if (data_out == 8'hF0)
            $display(
                "[%0t] TEST 4 PASS : RX DATA = %02h",
                $time,
                data_out
            );
        else
            $display(
                "[%0t] TEST 4 FAIL : Expected = F0, Got = %02h",
                $time,
                data_out
            );


        $display("-----------------------------------------");
        $display("       UART TEST COMPLETED");
        $display("-----------------------------------------");


        #100;

        $finish;

    end


    //-------------------------------------------------------------------------
    // Monitor
    //-------------------------------------------------------------------------
    initial begin

        $monitor(
            "[%0t] rst=%b wr=%b busy=%b tx=%b ready=%b data_out=%02h",
            $time,
            rst,
            wr_enb,
            busy,
            tx,
            ready,
            data_out
        );

    end

endmodule
