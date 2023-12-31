# Pin assignments for Project 2

# clock assignment to chip clock
set_location_assignment PIN_P11 -to clock
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clock

# reset assignment to push button
set_location_assignment PIN_B8 -to reset
set_instance_assignment -name IO_STANDARD "3.3 V Schmitt Trigger" -to reset

# reset LED assignment to LEDR0
set_location_assignment PIN_A8 -to reset_led
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to reset_led

# locked LED assignment to LEDR1
set_location_assignment PIN_A9 -to locked_led
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to locked_led

# VGA horizontal sync assignment
set_location_assignment PIN_N3 -to horz_sync
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to horz_sync

# VGA vertical sync assignment
set_location_assignment PIN_N1 -to vert_sync
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to vert_sync

# VGA red assignment
# VGA red pins on board:
set red_pins {AA1 V1 Y2 Y1}	
for { set i 0 } { ${i} < 4 } { incr i } {
	# Assign red_pins[i] --> pin
	set pin [ lindex ${red_pins} ${i} ]
	# Assign r_out[i] --> red_pins[i]
	set_location_assignment PIN_${pin} -to r_out\[${i}\]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to r_out\[${i}\]
}

# VGA green assignment
# VGA green pins on board:
set green_pins {W1 T2 R2 R1}
for { set i 0 } { ${i} < 4 } { incr i } {
	# Assign green_pins[i] --> pin
	set pin [ lindex ${green_pins} ${i} ]
	# Assign g_out[i] --> green_pins[i]
	set_location_assignment PIN_${pin} -to g_out\[${i}\]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to g_out\[${i}\]
}

# VGA blue assignment
# VGA blue pins on board:
set blue_pins {P1 T1 P4 N2}
for { set i 0 } { ${i} < 4 } { incr i } {
	# Assign blue_pins[i] --> pin
	set pin [ lindex ${blue_pins} ${i} ]
	# Assign b_out[i] --> blue_pins[i]
	set_location_assignment PIN_${pin} -to b_out\[${i}\]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to b_out\[${i}\]
}