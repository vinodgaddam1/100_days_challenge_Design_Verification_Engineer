// SystemVerilog Error Handling and Simulation Control
// This file demonstrates error handling mechanisms in SystemVerilog

module error_handler (
    input  logic       clk,
    input  logic       reset,
    input  logic [7:0] error_code,
    output logic       error_detected,
    output logic [7:0] error_status
);

    // Error detection logic
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            error_detected <= 1'b0;
            error_status   <= 8'b0;
        end else begin
            if (error_code != 8'b0) begin
                error_detected <= 1'b1;
                error_status   <= error_code;
            end else begin
                error_detected <= 1'b0;
                error_status   <= 8'b0;
            end
        end
    end

endmodule : error_handler

// Testbench with error handling
module error_handler_tb;

    logic       clk;
    logic       reset;
    logic [7:0] error_code;
    logic       error_detected;
    logic [7:0] error_status;

    // Instantiate the error handler module
    error_handler eh (
        .clk            (clk),
        .reset          (reset),
        .error_code     (error_code),
        .error_detected (error_detected),
        .error_status   (error_status)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize
        reset     = 0;
        error_code = 8'b0;
        
        // Reset release
        #10 reset = 1;
        
        // Test case 1: No error
        #20 error_code = 8'b0;
        $display("Test 1 - No Error: error_detected = %b, error_status = %h", error_detected, error_status);
        
        // Test case 2: Error detected
        #20 error_code = 8'h05;
        $display("Test 2 - Error Detected: error_detected = %b, error_status = %h", error_detected, error_status);
        
        // Test case 3: Different error code
        #20 error_code = 8'hFF;
        $display("Test 3 - Fatal Error: error_detected = %b, error_status = %h", error_detected, error_status);
        
        // Test case 4: Clear error
        #20 error_code = 8'b0;
        $display("Test 4 - Error Cleared: error_detected = %b, error_status = %h", error_detected, error_status);
        
        // End simulation
        #20 $finish;
    end

endmodule : error_handler_tb
