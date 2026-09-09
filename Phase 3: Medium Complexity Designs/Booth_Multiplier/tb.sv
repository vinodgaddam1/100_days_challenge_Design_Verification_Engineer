module top;

parameter N = 4;

logic clk;
logic rst;
logic start;

logic signed [N-1:0] multiplicand;
logic signed [N-1:0] multiplier;

logic signed [2*N-1:0] product;
logic busy;
logic done;


boot_multiplier dut(
    .clk          (clk),
    .rst          (rst),
    .start        (start),
    .multiplicand (multiplicand),
    .multiplier   (multiplier),
    .product      (product),
    .done         (done),
    .busy         (busy)
);


//====================================================
// Clock Generation
//====================================================

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


//====================================================
// Monitor
//====================================================

initial begin
    $monitor("Time=%0t rst=%0b start=%0b busy=%0b done=%0b M=%0d Q=%0d Product=%0d",
             $time, rst, start, busy, done,
             multiplicand, multiplier, product);
end


//====================================================
// Test
//====================================================

initial begin

    // Initial values
    rst          = 1;
    start        = 0;
    multiplicand = 0;
    multiplier   = 0;

    // Reset
    repeat(2)
        @(posedge clk);

    rst = 0;


    //================================================
    // TEST 1 : 3 x 2
    //================================================

    @(posedge clk);

    multiplicand = 4'sd3;
    multiplier   = 4'sd2;

    start = 1;

    @(posedge clk);

    start = 0;

    wait(done);

    #1;

    $display("================================");
    $display("TEST 1 : 3 x 2");
    $display("Expected = 6");
    $display("Actual   = %d", product);
    $display("================================");


    //================================================
    // TEST 2 : -3 x 2
    //================================================

    @(posedge clk);

    multiplicand = -4'sd3;
    multiplier   = 4'sd2;

    start = 1;

    @(posedge clk);

    start = 0;

    wait(done);

    #1;

    $display("================================");
    $display("TEST 2 : -3 x 2");
    $display("Expected = -6");
    $display("Actual   = %d", product);
    $display("================================");


    //================================================
    // TEST 3 : 3 x -2
    //================================================

    @(posedge clk);

    multiplicand = 4'sd3;
    multiplier   = -4'sd2;

    start = 1;

    @(posedge clk);

    start = 0;

    wait(done);

    #1;

    $display("================================");
    $display("TEST 3 : 3 x -2");
    $display("Expected = -6");
    $display("Actual   = %d", product);
    $display("================================");


    //================================================
    // TEST 4 : -3 x -2
    //================================================

    @(posedge clk);

    multiplicand = -4'sd3;
    multiplier   = -4'sd2;

    start = 1;

    @(posedge clk);

    start = 0;

    wait(done);

    #1;

    $display("================================");
    $display("TEST 4 : -3 x -2");
    $display("Expected = 6");
    $display("Actual   = %d", product);
    $display("================================");


    #20;

    $finish;

end

endmodule
