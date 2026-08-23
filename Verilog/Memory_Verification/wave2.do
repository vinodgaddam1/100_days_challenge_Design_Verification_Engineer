onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {clock signals} /tb/clk
add wave -noupdate -expand -group {reset signals} /tb/rst
add wave -noupdate -expand -group {controal signals} /tb/w_r
add wave -noupdate -expand -group {controal signals} /tb/ready
add wave -noupdate -expand -group {controal signals} /tb/valid
add wave -noupdate -expand -group {Addr signals} -radix decimal /tb/addr
add wave -noupdate -expand -group {write signals} -radix decimal /tb/wdata_in
add wave -noupdate -expand -group {read signals} -radix decimal /tb/rdata_out
add wave -noupdate -group {unknow signals} /tb/testname
add wave -noupdate -group {unknow signals} /tb/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {136 ps} 0}
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
WaveRestoreZoom {0 ps} {918 ps}
