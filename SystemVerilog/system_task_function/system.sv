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

Bit and with Function

$bits (return number of bits in a data type) 
$clog2 (return the celling of log base 2 of a value)
$countbits(count bits matching one or more specified values)
$countones (count bits value is “1”)
$isunknown (return true if any bit x or z)
$onehot (exactly one bit is “1” and all other bits 0)
$onehot0 (return true if zero or one bit is “1” ,without X or Z bits )

Mathematical functions

$In ($in(x) natural log of x)
$log10 ($log10(x) base-10 log of(x))
$exp ($exp(x) calculate e^x)
$sqrt (squre root of x)
$pow ($pow(x,y) calculate x^y)
$floor (rounds down to the Grether integer =x)
$ceil (rounds up to the smallest integer =x)
$sin (sine of x)
$cos(cosine of x)
$tan(tangent of x)
$asin(invers sine)
$acos(invers cosine)
$atan(invers tan)

Randomization

$random (generate a signed 32-bit integer)
$urandom(generate a unsigned 32-bit integer )
$urandom_range (start,end) (generated a unsigned 32-bit integer)
Randomize() (randomize class properties)
Std:randomize() (randomize specified variables /optionally with inline constraints)

File handling task and function
$fopen (open file reading or writing mode)
$fclose (close the file after done writing/reading)
$fdisplay(write formatted o/p  to a file  and appends a newline)
$fwrite (without newline)
$strobe (simiar to $strobe ,but sends formatted o/p to a file)
$fgetc (reads on char from a file and return its value as an integer)
$fscanf (read formatted data from a file)
$read (read binary data)
$feof (check end of the file)
$sformat (fromate a string into a variable)
$sformatf (return a formatted string)
 
Memory initialization /back door access
$readmemh (load memory values from a hex file)
$readmemb (load memory values from binary file)
$writememh (dump memory contents into a hex file)
$writememb (dump memory contents into binary file)


Command Line Argument function
1.$value$plusargs (Used to retrieve a value passed through the simulator command line and store it in a SystemVerilog variable.)
Syntax:
$value$plusargs("format_string", variable);

2.$test$plusargs (Checks whether a particular plusarg is passed from the simulator command line.)
Syntax:
$test$plusargs("argument_name");

SystemVerilog Format Specifiers:
Format Specifier	Meaning	Example
%d	Decimal	100
%h/%x	Hexadecimal	64
%b	Binary	1100100
%o	Octal	144
%s	String	"HELLO"
%c	Character	'A'
%0d	Decimal without leading zeros	100
%0h/%0x	Hexadecimal without leading zeros	64
%0b	Binary without leading zeros	1100100
%0o	Octal without leading zeros	144
%e	Scientific notation	1.25e+02
%f	Floating-point decimal	125.000000
%g	Automatic %e or %f selection	125
%t	Simulation time	100 ns

SystemVerilog Format Specifiers:
Format	Input	Output	Explanation
%s	"HELLO"	HELLO	Displays complete string
%3s	"A"	A	Minimum width 3, right-aligned
%03d	5	005	Minimum width 3, zero-padded
%03h	10	00a	Minimum width 3, zero-padded hexadecimal
%-3s	"A"	A 	Minimum width 3, left-aligned
%.3s	"HELLO"	HEL	Displays maximum 3 characters




