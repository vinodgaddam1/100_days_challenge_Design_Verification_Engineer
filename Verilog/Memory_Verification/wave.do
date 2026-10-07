onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {clock signals} /tb/clk
add wave -noupdate -group {reset signals} /tb/rst
add wave -noupdate -group {Control signals} /tb/w_r
add wave -noupdate -group {Control signals} /tb/ready
add wave -noupdate -group {Control signals} /tb/valid
add wave -noupdate -group {Addr signals} -radix decimal /tb/addr
add wave -noupdate -group {write signals} /tb/wdata_in
add wave -noupdate -group {read signals} -radix decimal /tb/rdata_out
add wave -noupdate -group {Unknow signals} /tb/testname
add wave -noupdate -group {Unknow signals} /tb/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {450 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2746 ps}
