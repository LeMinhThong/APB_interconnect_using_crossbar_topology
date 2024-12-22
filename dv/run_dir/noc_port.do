onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /req_order_test/tb/noc/pclk
add wave -noupdate /req_order_test/tb/noc/preset_n
add wave -noupdate -group rn1 /req_order_test/tb/noc/pclk
add wave -noupdate -group rn1 -radix hexadecimal /req_order_test/tb/noc/reqr1_paddr
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_pprot
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_pnse
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_psel
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_penable
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_pwrite
add wave -noupdate -group rn1 -radix hexadecimal /req_order_test/tb/noc/reqr1_pwdata
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_pstrb
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_pready
add wave -noupdate -group rn1 -radix hexadecimal /req_order_test/tb/noc/reqr1_prdata
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_pslverr
add wave -noupdate -group rn1 /req_order_test/tb/noc/reqr1_pwakeup
add wave -noupdate -group rn2 /req_order_test/tb/noc/pclk
add wave -noupdate -group rn2 -radix hexadecimal /req_order_test/tb/noc/reqr2_paddr
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_pprot
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_pnse
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_psel
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_penable
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_pwrite
add wave -noupdate -group rn2 -radix hexadecimal /req_order_test/tb/noc/reqr2_pwdata
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_pstrb
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_pready
add wave -noupdate -group rn2 -radix hexadecimal /req_order_test/tb/noc/reqr2_prdata
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_pslverr
add wave -noupdate -group rn2 /req_order_test/tb/noc/reqr2_pwakeup
add wave -noupdate -group rn3 /req_order_test/tb/noc/pclk
add wave -noupdate -group rn3 -radix hexadecimal /req_order_test/tb/noc/reqr3_paddr
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_pprot
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_pnse
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_psel
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_penable
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_pwrite
add wave -noupdate -group rn3 -radix hexadecimal /req_order_test/tb/noc/reqr3_pwdata
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_pstrb
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_pready
add wave -noupdate -group rn3 -radix hexadecimal /req_order_test/tb/noc/reqr3_prdata
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_pslverr
add wave -noupdate -group rn3 /req_order_test/tb/noc/reqr3_pwakeup
add wave -noupdate -group cn1 /req_order_test/tb/noc/pclk
add wave -noupdate -group cn1 -radix hexadecimal /req_order_test/tb/noc/comp1_paddr
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_pprot
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_pnse
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_psel
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_penable
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_pwrite
add wave -noupdate -group cn1 -radix hexadecimal /req_order_test/tb/noc/comp1_pwdata
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_pstrb
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_pready
add wave -noupdate -group cn1 -radix hexadecimal /req_order_test/tb/noc/comp1_prdata
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_pslverr
add wave -noupdate -group cn1 /req_order_test/tb/noc/comp1_pwakeup
add wave -noupdate -group cn2 /req_order_test/tb/noc/pclk
add wave -noupdate -group cn2 -radix hexadecimal /req_order_test/tb/noc/comp2_paddr
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_pprot
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_pnse
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_psel
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_penable
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_pwrite
add wave -noupdate -group cn2 -radix hexadecimal /req_order_test/tb/noc/comp2_pwdata
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_pstrb
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_pready
add wave -noupdate -group cn2 -radix hexadecimal /req_order_test/tb/noc/comp2_prdata
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_pslverr
add wave -noupdate -group cn2 /req_order_test/tb/noc/comp2_pwakeup
add wave -noupdate -group cn3 /req_order_test/tb/noc/pclk
add wave -noupdate -group cn3 -radix hexadecimal /req_order_test/tb/noc/comp3_paddr
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_pprot
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_pnse
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_psel
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_penable
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_pwrite
add wave -noupdate -group cn3 -radix hexadecimal /req_order_test/tb/noc/comp3_pwdata
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_pstrb
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_pready
add wave -noupdate -group cn3 -radix hexadecimal /req_order_test/tb/noc/comp3_prdata
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_pslverr
add wave -noupdate -group cn3 /req_order_test/tb/noc/comp3_pwakeup
add wave -noupdate -group cn4 /req_order_test/tb/noc/pclk
add wave -noupdate -group cn4 -radix hexadecimal /req_order_test/tb/noc/comp4_paddr
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_pprot
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_pnse
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_psel
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_penable
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_pwrite
add wave -noupdate -group cn4 -radix hexadecimal /req_order_test/tb/noc/comp4_pwdata
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_pstrb
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_pready
add wave -noupdate -group cn4 -radix hexadecimal /req_order_test/tb/noc/comp4_prdata
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_pslverr
add wave -noupdate -group cn4 /req_order_test/tb/noc/comp4_pwakeup
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2051 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 236
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
WaveRestoreZoom {1529 ps} {3051 ps}
