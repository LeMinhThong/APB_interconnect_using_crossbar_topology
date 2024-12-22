onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /base_test/tb/noc/cn3/pclk
add wave -noupdate /base_test/tb/noc/cn3/preset_n
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/paddr
add wave -noupdate /base_test/tb/noc/cn3/pprot
add wave -noupdate /base_test/tb/noc/cn3/pnse
add wave -noupdate /base_test/tb/noc/cn3/psel
add wave -noupdate /base_test/tb/noc/cn3/penable
add wave -noupdate /base_test/tb/noc/cn3/pwrite
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/pwdata
add wave -noupdate /base_test/tb/noc/cn3/pstrb
add wave -noupdate /base_test/tb/noc/cn3/pready
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/prdata
add wave -noupdate /base_test/tb/noc/cn3/pslverr
add wave -noupdate /base_test/tb/noc/cn3/pwakeup
add wave -noupdate /base_test/tb/noc/cn3/rn_valid
add wave -noupdate /base_test/tb/noc/cn3/cn_ready
add wave -noupdate /base_test/tb/noc/cn3/crossbar_sel
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/icn_rxreq_1
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/icn_rxreq_2
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/icn_rxreq_3
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/icn_txrsp_1
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/icn_txrsp_2
add wave -noupdate -radix hexadecimal /base_test/tb/noc/cn3/icn_txrsp_3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {130 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 224
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
configure wave -timelineunits ps
update
WaveRestoreZoom {98 ps} {180 ps}
