=====================================================================================================================
      Code & Functional  Coverage Commands in QuestaSim
=====================================================================================================================
1.Code coverage:
In QuestaSim, code coverage measures which parts of your RTL code have been exercised during simulation.
The main code coverage types are:
Coverage type	Command option	What it measures
Statement coverage	+cover=s	Executed statements
Branch coverage	+cover=b	Decision branches, such as if/else
Condition coverage	+cover=c	Boolean conditions
Expression coverage	+cover=e	Expression evaluation coverage
Toggle coverage	+cover=t	Signal transitions, such as 0 → 1 and 1 → 0
FSM coverage	+cover=f	Finite-state machine states and transitions
These are commonly used QuestaSim coverage options; exact support and reporting details depend on your QuestaSim edition and version.


1. Complete run.do file
For your QuestaSim 10.7c setup, use these commands to enable code coverage, run the simulation, and save the results. 
 
Microchip
vlib work
vlog -sv +cover=bcesft trans.sv
vsim -coverage work.top
run -all
coverage report -details -code bcesft
coverage save coverage.ucdb
coverage report -file coverage_report.txt -details -code bcesft




2. Meaning of the commands
Command	Purpose
+cover=bcesft	Enables branch, condition, expression, statement, FSM and toggle coverage collection
vsim -coverage	Enables coverage collection during simulation
run -all	Runs the simulation
coverage report	Displays coverage statistics
coverage save coverage.ucdb	Saves coverage data to a UCDB database
coverage report -file ...	Saves a text report
The coverage instrumentation is enabled during compilation; the simulation option activates collection. 
 
Microchip
3. Coverage abbreviations
•	b — Branch
•	c — Condition
•	e — Expression
•	s — Statement
•	f — FSM (finite-state machine)
•	t — Toggle
For example, if you want only statement and branch coverage, compile with:
vlog -sv +cover=sb trans.sv

Important: Code coverage and SystemVerilog functional coverage are different. Your covergroup, coverpoint, and bins measure functional coverage; +cover=bcesft enables RTL code coverage.

Complete: “run.do”  file it will do starting to ending
 Like give the complete coverage report -details (e.g: Code/Functional reports and it will give how much % you get)
2.it generate the all .ucdb files based on your testcases and also it will also merge and save it one fine file final.ucdb

#=======================================
# COMPILE
#=======================================
vlib work
vlog -sv top.sv

# ======================================
# OPTIMIZE WITH COVERAGE
#=======================================

vopt top +cover=fcbest -o top_optimized

#=======================================
# TEST 1: 1W
#=======================================

vsim -coverage top_optimized +test_name=1W +N=32
add wave -r sim:/top/pif/*
run -all
do vinod.do
coverage save 1W.ucdb
quit -sim

# ======================================
# TEST 2: 5W
#=======================================

vsim -coverage top_optimized +test_name=5W +N=32
run -all
coverage save 5W.ucdb
quit -sim

#=======================================
# TEST 3: 1W_1R
#=======================================

vsim -coverage top_optimized +test_name=1W_1R +N=32
run -all
coverage save 1W_1R.ucdb
quit -sim

#=======================================
# TEST 4: 5W_5R
#=======================================

vsim -coverage top_optimized +test_name=5W_5R +N=32
run -all
coverage save 5W_5R.ucdb
quit -sim

#=======================================
# TEST 5: NW_NR
#=======================================

vsim -coverage top_optimized +test_name=NW_NR +N=200
run -all
coverage save NW_NR.ucdb
quit -sim
#=======================================
# TEST 6: MISMATCHING
#=======================================

#vsim -coverage top_optimized +test_name=MIS +N=200
#run -all
#coverage save MIS.ucdb
#quit -sim

#=======================================
# TEST 7 : Unknown
#=======================================

vsim -coverage top_optimized +test_name=Unknown 
run -all
coverage save Unknown.ucdb
quit -sim


#=======================================
# MERGE ALL COVERAGE DATABASES
#=======================================

vcover merge -out final.ucdb \
    1W.ucdb \
    5W.ucdb \
    1W_1R.ucdb \
    5W_5R.ucdb \
    NW_NR.ucdb \
   #MIS.ucdb \
    Unknown.ucdb



#=======================================
# GENERATE FINAL COVERAGE REPORT
#=======================================

vcover report -details -all final.ucdb

# ======================================
# COMPLETION MESSAGE
#=======================================

puts "============================================"
puts "ALL FIVE TESTS COMPLETED"
puts "FINAL MERGED COVERAGE: final.ucdb"
puts "============================================"
