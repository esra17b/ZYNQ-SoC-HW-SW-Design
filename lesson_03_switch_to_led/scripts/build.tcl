# Non-project build: vivado -mode batch -source scripts/build.tcl
# Outputs (reports and bitstream) are written to build/.

set root [file normalize [file join [file dirname [info script]] ..]]
set out  [file join $root build]
file mkdir $out

read_vhdl [list [file join $root src switch_to_led.vhd]]
read_xdc  [list [file join $root constraints zedboard.xdc]]

synth_design -top switch_to_led -part xc7z020clg484-1
opt_design
place_design
route_design

report_timing_summary -file [file join $out timing_summary.rpt]
report_utilization    -file [file join $out utilization.rpt]
report_power          -file [file join $out power.rpt]
report_drc            -file [file join $out drc.rpt]
report_methodology    -file [file join $out methodology.rpt]

write_bitstream -force [file join $out switch_to_led.bit]
