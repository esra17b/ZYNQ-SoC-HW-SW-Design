# ZedBoard constraints for switch_to_led

# 100 MHz on-board clock (GCLK)
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk [get_ports clk]

# User DIP switches
# Banks 34/35 are powered by VADJ: set jumper JP18 to 2.5V to match LVCMOS25.
set_property PACKAGE_PIN F22 [get_ports {sw_i[0]}]
set_property PACKAGE_PIN G22 [get_ports {sw_i[1]}]
set_property PACKAGE_PIN H22 [get_ports {sw_i[2]}]
set_property PACKAGE_PIN F21 [get_ports {sw_i[3]}]
set_property PACKAGE_PIN H19 [get_ports {sw_i[4]}]
set_property PACKAGE_PIN H18 [get_ports {sw_i[5]}]
set_property PACKAGE_PIN H17 [get_ports {sw_i[6]}]
set_property PACKAGE_PIN M15 [get_ports {sw_i[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sw_i[*]}]

# User LEDs
set_property PACKAGE_PIN T22 [get_ports {led_o[0]}]
set_property PACKAGE_PIN T21 [get_ports {led_o[1]}]
set_property PACKAGE_PIN U22 [get_ports {led_o[2]}]
set_property PACKAGE_PIN U21 [get_ports {led_o[3]}]
set_property PACKAGE_PIN V22 [get_ports {led_o[4]}]
set_property PACKAGE_PIN W22 [get_ports {led_o[5]}]
set_property PACKAGE_PIN U19 [get_ports {led_o[6]}]
set_property PACKAGE_PIN U14 [get_ports {led_o[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_o[*]}]

# Switches and LEDs are human-speed, asynchronous to clk
set_false_path -from [get_ports {sw_i[*]}]
set_false_path -to [get_ports {led_o[*]}]
