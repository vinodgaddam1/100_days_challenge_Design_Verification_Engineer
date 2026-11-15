Complete List of systemverilog system Task and Function
                                       Level-1
SystemVerilog Task Perform an operation.
SystemVerilog Function  return a value.

1.Display and Monitoring tasks:
$display()                print information & add new line
$write()                   print information & without new line
$strobe()                  print information value end of current       
                                simulation time step.
$monitor()                print values ,monitored arguments      
                                 changes

above four Verilog and systemverilog same but,some of them add in the systemverilog.

$displayb()                print information & add new line with     
                                  Binary.
$displayo()                print information & add new line with  
                                  Octal.
$displayh()                print information & add new line with 
                                  Hexdecimal.

$writeb()                   print information in binary & without 
                                  new line.
$writeh()                   print information in Hexdecimal &   
                                  without new line
$writeo()                   print information octal & without new     
                                  line
                                     
$strobeb()                  print information in binary value end of      
                                  current  simulation time step.
$strobeh()                  print information in hexdecimal value  
                                  end of current simulation time step.
$strobeo()                  print information in octal value end of  
                                   current simulation time step.


$monitorb()                print values in binary ,monitored 
                                    arguments  changes
$monitorh()                print values in hexdecimal,monitored 
                                    arguments  changes
$monitoro()                print values in octal ,monitored 
                                   arguments changes

NOTE: here  $displayb(“…….”,,,,,,);   “,,”  means space.

------------------------------------------------------------------------------------------------------------------------------------
Simulation control and Reporting task-Level-2

$finish (treiminates Simluation)
$stop (suspends the simulation)
$exit (exits a task and function context according   
          to the systemverilog calling mechanism )
$fatal (Report a fatal error and terminates  
           simulation)
$error ( Report a error message)
$warning (Report a warning message)

Time related:
$time(return the current simulation time integer time values)
$stime(current simulation time 32-bit unsigned integer)
$realtime(current simulation time a real valued numbers)


Conversion:
$itor (convert an integer to a real value)
$rtoi (convert a real to integer by truncating the fractional part)
$realtobits(returns the 64-bits representation of a real value)
$bitstoreal(64-bit vector real)
$shortrealtobits(shortreal 2-bit vector)
$bitstoshortreal(32-bit vector to shortreal)
$signed(treats an expression as signed)
$unsigned (treats an expression as unsigned)



