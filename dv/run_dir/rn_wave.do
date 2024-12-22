onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /base_test/tb/noc/rn1/pclk
add wave -noupdate /base_test/tb/noc/rn1/preset_n
add wave -noupdate /base_test/tb/noc/rn1/paddr
add wave -noupdate /base_test/tb/noc/rn1/pprot
add wave -noupdate /base_test/tb/noc/rn1/pnse
add wave -noupdate /base_test/tb/noc/rn1/psel
add wave -noupdate /base_test/tb/noc/rn1/penable
add wave -noupdate /base_test/tb/noc/rn1/pwrite
add wave -noupdate /base_test/tb/noc/rn1/pwdata
add wave -noupdate /base_test/tb/noc/rn1/pstrb
add wave -noupdate /base_test/tb/noc/rn1/pready
add wave -noupdate /base_test/tb/noc/rn1/prdata
add wave -noupdate /base_test/tb/noc/rn1/pslverr
add wave -noupdate /base_test/tb/noc/rn1/pwakeup
add wave -noupdate /base_test/tb/noc/rn1/rn_valid
add wave -noupdate /base_test/tb/noc/rn1/cn_ready
add wave -noupdate /base_test/tb/noc/rn1/crossbar_sel
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/bf_out
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/icn_txreq_1
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/icn_txreq_2
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/icn_txreq_3
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/icn_txreq_4
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/icn_rxrsp_1
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/icn_rxrsp_2
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/icn_rxrsp_3
add wave -noupdate -radix hexadecimal /base_test/tb/noc/rn1/icn_rxrsp_4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {195 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 241
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
WaveRestoreZoom {93 ps} {202 ps}
