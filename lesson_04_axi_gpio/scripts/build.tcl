# Project build: vivado -mode batch -source scripts/build.tcl
# Requires the ZedBoard board files (Vivado Tools > Vivado Store > Boards).
# Outputs (reports, bitstream and XSA) are written to build/.

set root [file normalize [file join [file dirname [info script]] ..]]
set out  [file join $root build]
file mkdir $out
cd $out

create_project -force lesson_04 [file join $out project] -part xc7z020clg484-1
set_property board_part_repo_paths [list [get_property LOCAL_ROOT_DIR [xhub::get_xstores xilinx_board_store]]] [current_project]
set_property board_part avnet.com:zedboard:part0:1.4 [current_project]

source [file join $root scripts system_bd.tcl]
validate_bd_design
save_bd_design

set bd [get_files system.bd]
add_files -norecurse [list [make_wrapper -files $bd -top]]
set_property top system_wrapper [current_fileset]
update_compile_order -fileset sources_1

launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1
if {[get_property PROGRESS [get_runs impl_1]] ne "100%"} {
    error "Implementation failed"
}

open_run impl_1
report_timing_summary -file [file join $out timing_summary.rpt]
report_utilization    -file [file join $out utilization.rpt]
report_power          -file [file join $out power.rpt]
report_drc            -file [file join $out drc.rpt]
report_methodology    -file [file join $out methodology.rpt]

file copy -force [file join [get_property DIRECTORY [get_runs impl_1]] system_wrapper.bit] $out
write_hw_platform -fixed -include_bit -force [file join $out system_wrapper.xsa]
