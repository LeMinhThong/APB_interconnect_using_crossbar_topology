onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /base_test/tb/noc/pclk
add wave -noupdate /base_test/tb/noc/preset_n
add wave -noupdate -expand -group reqr1 -radix hexadecimal /base_test/tb/noc/reqr1_paddr
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_pprot
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_pnse
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_psel
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_penable
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_pwrite
add wave -noupdate -expand -group reqr1 -radix hexadecimal /base_test/tb/noc/reqr1_pwdata
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_pstrb
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_pready
add wave -noupdate -expand -group reqr1 -radix hexadecimal /base_test/tb/noc/reqr1_prdata
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_pslverr
add wave -noupdate -expand -group reqr1 /base_test/tb/noc/reqr1_pwakeup
add wave -noupdate -expand -group reqr1 -group reqr1_bf /base_test/tb/noc/rn1/bf/psel
add wave -noupdate -expand -group reqr1 -group reqr1_bf /base_test/tb/noc/rn1/bf/penable
add wave -noupdate -expand -group reqr1 -group reqr1_bf /base_test/tb/noc/rn1/bf/cn_ready
add wave -noupdate -expand -group reqr1 -group reqr1_bf /base_test/tb/noc/rn1/bf/data_in
add wave -noupdate -expand -group reqr1 -group reqr1_bf /base_test/tb/noc/rn1/bf/data_out
add wave -noupdate -expand -group reqr1 -group reqr1_bf -expand /base_test/tb/noc/rn1/bf/data_out_state
add wave -noupdate -expand -group reqr1 -group reqr1_bf /base_test/tb/noc/rn1/bf/rst_data_out
add wave -noupdate -expand -group reqr1 -expand -group reqr1_rl /base_test/tb/noc/rn1/rl/psel
add wave -noupdate -expand -group reqr1 -expand -group reqr1_rl -radix hexadecimal /base_test/tb/noc/rn1/rl/paddr
add wave -noupdate -expand -group reqr1 -expand -group reqr1_rl /base_test/tb/noc/rn1/rl/cn_ready
add wave -noupdate -expand -group reqr1 -expand -group reqr1_rl /base_test/tb/noc/rn1/rl/rn_valid
add wave -noupdate -expand -group reqr1 -expand -group reqr1_rl /base_test/tb/noc/rn1/rl/crossbar_sel
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross /base_test/tb/noc/rn1/rn_cross/sel
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/bf_out
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/icn_txreq_1
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/icn_txreq_2
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/icn_txreq_3
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/icn_txreq_4
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/icn_rxrsp_1
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/icn_rxrsp_2
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/icn_rxrsp_3
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/icn_rxrsp_4
add wave -noupdate -expand -group reqr1 -expand -group reqr1_cross -radix hexadecimal /base_test/tb/noc/rn1/rn_cross/reqr_rsp
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_paddr
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_pprot
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_pnse
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_psel
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_penable
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_pwrite
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_pwdata
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_pstrb
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_pready
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_prdata
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_pslverr
add wave -noupdate -group reqr2 /base_test/tb/noc/reqr2_pwakeup
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_paddr
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_pprot
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_pnse
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_psel
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_penable
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_pwrite
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_pwdata
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_pstrb
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_pready
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_prdata
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_pslverr
add wave -noupdate -group reqr3 /base_test/tb/noc/reqr3_pwakeup
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_paddr
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_pprot
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_pnse
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_psel
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_penable
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_pwrite
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_pwdata
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_pstrb
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_pready
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_prdata
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_pslverr
add wave -noupdate -group comp1 /base_test/tb/noc/comp1_pwakeup
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_paddr
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_pprot
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_pnse
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_psel
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_penable
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_pwrite
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_pwdata
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_pstrb
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_pready
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_prdata
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_pslverr
add wave -noupdate -group comp2 /base_test/tb/noc/comp2_pwakeup
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_paddr
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_pprot
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_pnse
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_psel
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_penable
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_pwrite
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_pwdata
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_pstrb
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_pready
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_prdata
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_pslverr
add wave -noupdate -group comp3 /base_test/tb/noc/comp3_pwakeup
add wave -noupdate -expand -group comp4 /base_test/tb/noc/pclk
add wave -noupdate -expand -group comp4 /base_test/tb/noc/preset_n
add wave -noupdate -expand -group comp4 -radix hexadecimal /base_test/tb/noc/comp4_paddr
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_pprot
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_pnse
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_psel
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_penable
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_pwrite
add wave -noupdate -expand -group comp4 -radix hexadecimal /base_test/tb/noc/comp4_pwdata
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_pstrb
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_pready
add wave -noupdate -expand -group comp4 -radix hexadecimal /base_test/tb/noc/comp4_prdata
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_pslverr
add wave -noupdate -expand -group comp4 /base_test/tb/noc/comp4_pwakeup
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/clk
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/rst_n
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/crossbar_sel
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/icn_psel
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/rn1_order
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/rn2_order
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/rn3_order
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/rn_valid
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/rn_valid_prev
add wave -noupdate -expand -group comp4 -group comp4_arb -color {Medium Orchid} /base_test/tb/noc/cn4/arb/order_num
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/cur_order
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/cn_ready
add wave -noupdate -expand -group comp4 -group comp4_arb /base_test/tb/noc/cn4/arb/cn_busy
add wave -noupdate -expand -group comp4 -expand -group comp4_cross /base_test/tb/noc/cn4/cn_cross/clk
add wave -noupdate -expand -group comp4 -expand -group comp4_cross /base_test/tb/noc/cn4/cn_cross/rst_n
add wave -noupdate -expand -group comp4 -expand -group comp4_cross /base_test/tb/noc/cn4/cn_cross/sel
add wave -noupdate -expand -group comp4 -expand -group comp4_cross -radix hexadecimal /base_test/tb/noc/cn4/cn_cross/comp_rsp
add wave -noupdate -expand -group comp4 -expand -group comp4_cross -radix hexadecimal /base_test/tb/noc/cn4/cn_cross/icn_txrsp_1
add wave -noupdate -expand -group comp4 -expand -group comp4_cross -radix hexadecimal /base_test/tb/noc/cn4/cn_cross/icn_txrsp_2
add wave -noupdate -expand -group comp4 -expand -group comp4_cross -radix hexadecimal /base_test/tb/noc/cn4/cn_cross/icn_txrsp_3
add wave -noupdate -expand -group comp4 -expand -group comp4_cross -radix hexadecimal /base_test/tb/noc/cn4/cn_cross/icn_rxreq_1
add wave -noupdate -expand -group comp4 -expand -group comp4_cross -radix hexadecimal /base_test/tb/noc/cn4/cn_cross/icn_rxreq_2
add wave -noupdate -expand -group comp4 -expand -group comp4_cross -radix hexadecimal /base_test/tb/noc/cn4/cn_cross/icn_rxreq_3
add wave -noupdate -expand -group comp4 -expand -group comp4_cross -radix hexadecimal /base_test/tb/noc/cn4/cn_cross/comp_req
add wave -noupdate -expand -group comp4 -expand -group comp4_cross /base_test/tb/noc/cn4/cn_cross/rst_loc
add wave -noupdate /base_test/tb/noc/rn1_valid
add wave -noupdate /base_test/tb/noc/rn2_valid
add wave -noupdate /base_test/tb/noc/rn3_valid
add wave -noupdate /base_test/tb/noc/cn1_ready
add wave -noupdate /base_test/tb/noc/cn2_ready
add wave -noupdate /base_test/tb/noc/cn3_ready
add wave -noupdate /base_test/tb/noc/cn4_ready
add wave -noupdate /base_test/tb/noc/cn_ready_rn1
add wave -noupdate /base_test/tb/noc/cn_ready_rn2
add wave -noupdate /base_test/tb/noc/cn_ready_rn3
add wave -noupdate /base_test/tb/noc/icn_txreq_rn_1
add wave -noupdate /base_test/tb/noc/icn_txreq_rn_2
add wave -noupdate /base_test/tb/noc/icn_txreq_rn_3
add wave -noupdate /base_test/tb/noc/icn_txrsp_cn_1
add wave -noupdate /base_test/tb/noc/icn_txrsp_cn_2
add wave -noupdate /base_test/tb/noc/icn_txrsp_cn_3
add wave -noupdate /base_test/tb/noc/icn_txrsp_cn_4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 167
configure wave -valuecolwidth 94
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {37 ps} {260 ps}
