onbreak resume
onerror resume
vsim -voptargs=+acc work.Subsystem_tb

add wave sim:/Subsystem_tb/u_Subsystem/i_CLK
add wave sim:/Subsystem_tb/u_Subsystem/i_RST_N
add wave sim:/Subsystem_tb/u_Subsystem/i_CLK_EN
add wave sim:/Subsystem_tb/u_Subsystem/i_W0
add wave sim:/Subsystem_tb/u_Subsystem/i_W1
add wave sim:/Subsystem_tb/u_Subsystem/i_W2
add wave sim:/Subsystem_tb/u_Subsystem/i_W3
add wave sim:/Subsystem_tb/u_Subsystem/i_X0
add wave sim:/Subsystem_tb/u_Subsystem/i_X1
add wave sim:/Subsystem_tb/u_Subsystem/i_X2
add wave sim:/Subsystem_tb/u_Subsystem/i_X3
add wave sim:/Subsystem_tb/u_Subsystem/ce_out
add wave sim:/Subsystem_tb/u_Subsystem/o_y
add wave sim:/Subsystem_tb/o_y_ref
run -all
