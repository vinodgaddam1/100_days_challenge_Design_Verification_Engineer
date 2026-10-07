`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2026 12:42:48
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*module tb;
parameter WIDTH=8;
parameter DEPTH=16;
parameter ADDR=$clog2(DEPTH);
reg PCLK;
reg PRESETn;
reg [ADDR-1:0]PADDR;
reg [WIDTH-1:0]PWDATA;
reg PSELx;
reg PWRITE;
reg PENABLE;
wire  [WIDTH-1:0]PRDATA;
wire  PREADY; 
integer i;
 apb dut(PCLK,PRESETn,PADDR,PWDATA,PRDATA,PWRITE,PSELx,PREADY,PENABLE);

//------------------------------------------
//Clock Generation
//------------------------------------------
initial begin
	PCLK=0;
	forever #5 PCLK=~PCLK;
end
//------------------------------------------
//   Reset 
//------------------------------------------
initial begin
PRESETn=0;
PENABLE=0;
PWDATA=0;
PWRITE=0;
PSELx=0;
PADDR=0;
repeat(2)
@(posedge PCLK);
PRESETn=1;
//reset releas
for(i=0;i<DEPTH;i=i+1)begin
write(i,i+10);
end
//read 
for(i=0;i<DEPTH;i=i+1)begin
read(i);
end
#20;
$finish;
end

//--------------------------------------------
//APB write task
//-------------------------------------------

task write(input reg[ADDR-1:0]addr,input reg [WIDTH-1:0]data);
begin
//SETPHASE
@(posedge PCLK);
PSELx=1;
PWRITE=1;
PENABLE=0;
PWDATA=data;
PADDR=addr;


//AccessPhase
@(posedge PCLK);
PENABLE=1;

//wait
 wait (PREADY==1);
#1;

//back to idle state
@(posedge PCLK);
PSELx=0;
PENABLE=0;
PWRITE=0;
PADDR=0;
PWDATA=0;
end
endtask

//read
task read(input reg[ADDR-1:0]addr);
	begin
@(posedge PCLK);
PSELx=1;
PENABLE=0;
PWRITE=0;
PADDR=addr;
PWDATA=0;
@(posedge PCLK);
PENABLE=1;
wait(PREADY==1);
#1;
//back to idle state 
@(posedge PCLK);
PSELx=0;
PWRITE=0;
PADDR=0;
PENABLE=0;
end
endtask
endmodule





//FSM_STYLE APB testbanch


module tb;
parameter WIDTH=32;
parameter DEPTH=32;
parameter ADDR=$clog2(DEPTH);
//----------------------------------------------------------------------
//                          FSM STATE
//----------------------------------------------------------------------
parameter IDLE=2'b00;
parameter SETUP=2'b01;
parameter ACCESS=2'b10;
parameter CHECK=2'b11;
//-----------------------------------------------------------------------
//                         APB signals
//-----------------------------------------------------------------------
reg PCLK;
reg PRESETn;
reg [ADDR-1:0]PADDR;
reg [WIDTH-1:0]PWDATA;
reg PSELx;
reg PWRITE;
reg PENABLE;
wire  [WIDTH-1:0]PRDATA;
wire  PREADY; 

//------------------------------------------------------------------------
//                 State Registers
//------------------------------------------------------------------------
reg [1:0] state,next_state;


//------------------------------------------------------------------------
// Test variables
//------------------------------------------------------------------------
integer i;
reg [WIDTH-1:0]expected_data;
//reg operation;

//-----------------------------------------------------------------------
// DUT(Design under test) connection
//----------------------------------------------------------------------
 apb #(.WIDTH(WIDTH),.DEPTH(DEPTH),.ADDR(ADDR)) dut(PCLK,PRESETn,PADDR,PWDATA,PRDATA,PWRITE,PSELx,PREADY,PENABLE);


 //---------------------------------------------------------------------
 // Clock generation 
 //---------------------------------------------------------------------
initial begin
PCLK=0;
forever #5 PCLK=~PCLK;
end


//----------------------------------------------------------------------
// state Genration
//----------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)begin
	if(!PRESETn)begin
        state<=IDLE;
 	end
	else begin
         state<=next_state;
	end
end

//----------------------------------------------------------------------
// Next State logic
//----------------------------------------------------------------------
always @(*)begin
next_state=state;
case(state)
	IDLE:begin
		next_state=SETUP;
	end
	SETUP:begin
		next_state=ACCESS;
	end
	ACCESS:begin
		if(PREADY)
        next_state=CHECK;
	        else
        next_state=ACCESS;
        end
	CHECK:begin
		next_state=IDLE;
	end
        default: next_state=IDLE; 
endcase
end


//---------------------------------------------------------------------
// Output logic
//---------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)begin
	if(!PRESETn)begin
PADDR<=0;
PWRITE<=0;
PENABLE<=0;
PSELx<=0;
PWDATA<=0;
end
else begin
case(state)
//-------------------------------------------------------------------
//              IDLE 
//------------------------------------------------------------------
IDLE:begin
PSELx<=0;
PENABLE<=0;
PWRITE<=0;
end

//-------------------------------------------------------------------
//             SETUP
//-------------------------------------------------------------------
SETUP:begin
PSELx<=1;
PENABLE<=0;
PWRITE<=1;
PADDR<=i;
PWDATA<=i+10;
expected_data<=i+10;
end

//---------------------------------------------------------------------
//             ACCESS
//---------------------------------------------------------------------
ACCESS:begin
PSELx<=1;
PENABLE<=1;
end
CHECK:begin
PSELx<=0;
PENABLE<=0;
if(PWRITE)begin
end
end
endcase
end
end


//-----------------------------------------------------------------
// Main test
//----------------------------------------------------------------

//reset
initial begin
PRESETn=0;
PENABLE=0;
PSELx=0;
PWDATA=0;
PWRITE=0;
i=0;
repeat(2) @(posedge PCLK);
PRESETn=1;
//------------------------------------------------------------------
//write
//------------------------------------------------------------------
for(i=0;i<DEPTH;i=i+1)begin
	@(posedge PCLK);
	wait(state==CHECK);
	@(posedge PCLK);
	
end
end
//---------------------------------------------------------------
//Read test 
//---------------------------------------------------------------
initial begin
PRESETn=0;
PENABLE=0;
PSELx=0;
PWDATA=0;
PWRITE=0;
repeat(2) @(posedge PCLK);
PRESETn=1;
//------------------------------------------------------------------
//read
//------------------------------------------------------------------
@(posedge PCLK);
PSELx=1;
PENABLE=0;
PWRITE=0;
PADDR=0;
@(posedge PCLK);
PENABLE=1;
@(posedge PCLK);
wait(PREADY==1);
#1;
@(posedge PCLK);
PSELx=0;
PENABLE=0;

#20;
$finish;
end
endmodule

























*/

//==============================================================
//              FSM STYLE APB TESTBENCH
//==============================================================

module tb;

parameter WIDTH = 32;
parameter DEPTH = 32;
parameter ADDR  = $clog2(DEPTH);

//--------------------------------------------------------------
// FSM STATE
//--------------------------------------------------------------
parameter IDLE   = 2'b00;
parameter SETUP  = 2'b01;
parameter ACCESS = 2'b10;
parameter CHECK  = 2'b11;

//--------------------------------------------------------------
// APB SIGNALS
//--------------------------------------------------------------
reg PCLK;
reg PRESETn;

reg [ADDR-1:0]  PADDR;
reg [WIDTH-1:0] PWDATA;

reg PSELx;
reg PWRITE;
reg PENABLE;

wire [WIDTH-1:0] PRDATA;
wire PREADY;

//--------------------------------------------------------------
// STATE REGISTERS
//--------------------------------------------------------------
reg [1:0] state;
reg [1:0] next_state;

//--------------------------------------------------------------
// TEST VARIABLES
//--------------------------------------------------------------
integer i;

reg operation;
// operation = 1 -> WRITE
// operation = 0 -> READ

reg [WIDTH-1:0] expected_data;

//--------------------------------------------------------------
// DUT
//--------------------------------------------------------------
apb #(
    .WIDTH(WIDTH),
    .DEPTH(DEPTH),
    .ADDR(ADDR)
)
dut (
    .PCLK    (PCLK),
    .PRESETn (PRESETn),
    .PADDR   (PADDR),
    .PWDATA  (PWDATA),
    .PRDATA  (PRDATA),
    .PWRITE  (PWRITE),
    .PSELx   (PSELx),
    .PREADY  (PREADY),
    .PENABLE (PENABLE)
);

//--------------------------------------------------------------
// CLOCK GENERATION
//--------------------------------------------------------------
initial begin

    PCLK = 0;

    forever #5 PCLK = ~PCLK;

end

//--------------------------------------------------------------
// STATE REGISTER
//--------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn) begin

    if(!PRESETn)
        state <= IDLE;

    else
        state <= next_state;

end

//--------------------------------------------------------------
// NEXT STATE LOGIC
//--------------------------------------------------------------
always @(*) begin

    next_state = state;

    case(state)

        //------------------------------------------------------
        // IDLE
        //------------------------------------------------------
        IDLE: begin

            next_state = SETUP;

        end

        //------------------------------------------------------
        // SETUP
        //------------------------------------------------------
        SETUP: begin

            next_state = ACCESS;

        end

        //------------------------------------------------------
        // ACCESS
        //------------------------------------------------------
        ACCESS: begin

            if(PREADY)
                next_state = CHECK;

            else
                next_state = ACCESS;

        end

        //------------------------------------------------------
        // CHECK
        //------------------------------------------------------
        CHECK: begin

            next_state = IDLE;

        end

        default: begin

            next_state = IDLE;

        end

    endcase

end

//--------------------------------------------------------------
// OUTPUT / APB CONTROL LOGIC
//--------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn) begin

    if(!PRESETn) begin

        PADDR   <= 0;
        PWDATA  <= 0;
        PWRITE  <= 0;
        PSELx   <= 0;
        PENABLE <= 0;

    end

    else begin

        case(state)

            //--------------------------------------------------
            // IDLE
            //--------------------------------------------------
            IDLE: begin

                PSELx   <= 0;
                PENABLE <= 0;

            end

            //--------------------------------------------------
            // SETUP
            //--------------------------------------------------
            SETUP: begin

                PSELx   <= 1;
                PENABLE <= 0;

                PWRITE <= operation;

                PADDR <= i;

                //------------------------------------------------
                // WRITE
                //------------------------------------------------
                if(operation == 1) begin

                    expected_data <= i + 10;

                    PWDATA <= i + 10;

                    $display(
                        "SETUP WRITE : ADDR=%0d DATA=%0d",
                        i,
                        i + 10
                    );

                end

                //------------------------------------------------
                // READ
                //------------------------------------------------
                else begin

                    PWDATA <= 0;

                    expected_data <= i + 10;

                    $display(
                        "SETUP READ : ADDR=%0d",
                        i
                    );

                end

            end

            //--------------------------------------------------
            // ACCESS
            //--------------------------------------------------
            ACCESS: begin

                PSELx   <= 1;
                PENABLE <= 1;

                $display(
                    "ACCESS : ADDR=%0d PWRITE=%b PREADY=%b",
                    PADDR,
                    PWRITE,
                    PREADY
                );

            end

            //--------------------------------------------------
            // CHECK
            //--------------------------------------------------
            CHECK: begin

                PSELx   <= 0;
                PENABLE <= 0;

                //------------------------------------------------
                // WRITE CHECK
                //------------------------------------------------
                if(operation == 1) begin

                    $display(
                        "WRITE DONE : ADDR=%0d DATA=%0d",
                        PADDR,
                        PWDATA
                    );

                end

                //------------------------------------------------
                // READ CHECK
                //------------------------------------------------
                else begin

                    #1;

                    if(PRDATA == expected_data) begin

                        $display(
                            "READ PASS : ADDR=%0d EXPECTED=%0d ACTUAL=%0d",
                            PADDR,
                            expected_data,
                            PRDATA
                        );

                    end

                    else begin

                        $display(
                            "READ FAIL : ADDR=%0d EXPECTED=%0d ACTUAL=%0d",
                            PADDR,
                            expected_data,
                            PRDATA
                        );

                    end

                end

            end

        endcase

    end

end

//--------------------------------------------------------------
// MAIN TEST
//--------------------------------------------------------------
initial begin

    //----------------------------------------------------------
    // INITIAL VALUES
    //----------------------------------------------------------

    PRESETn = 0;

    PADDR   = 0;
    PWDATA  = 0;
    PWRITE  = 0;
    PSELx   = 0;
    PENABLE = 0;

    i = 0;

    //----------------------------------------------------------
    // RESET
    //----------------------------------------------------------

    repeat(2)
        @(posedge PCLK);

    PRESETn = 1;

    //----------------------------------------------------------
    // WRITE TEST
    //----------------------------------------------------------

    operation = 1;

    $display("");
    $display("======================================");
    $display("          WRITE TEST START");
    $display("======================================");

    for(i = 0; i < DEPTH; i = i + 1) begin

        @(posedge PCLK);

        wait(state == CHECK);

        @(posedge PCLK);

    end

    //----------------------------------------------------------
    // READ TEST
    //----------------------------------------------------------

    operation = 0;

    $display("");
    $display("======================================");
    $display("          READ TEST START");
    $display("======================================");

    for(i = 0; i < DEPTH; i = i + 1) begin

        @(posedge PCLK);

        wait(state == CHECK);

        @(posedge PCLK);

    end

    //----------------------------------------------------------
    // FINISH
    //----------------------------------------------------------

    $display("");
    $display("======================================");
    $display("          TEST COMPLETE");
    $display("======================================");

    #20;

    $finish;

end

endmodule
