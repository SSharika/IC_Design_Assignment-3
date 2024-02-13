#creates a new vivado project
#create_project -force [pwd]/Automation/Project_1 -part xc7a200tfbg676-2
#set_property board_part xilinx.com:ac701:part0:1.4 [current_project]

# loop to add all design files
#add_files -norecurse [pwd]/[lindex $argv 0]
#update_compile_order -fileset sources_1
#close_project

# Create Vivado project
create_project -force [pwd]/Automation/Project_2 -part xc7a200tfbg676-2
set_property board_part xilinx.com:ac701:part0:1.4 [current_project]

# Get a list of all Verilog files in the code folder
set verilog_files [glob -nocomplain [pwd]/code/*.v]

# Loop to add all Verilog files to the project
foreach file $verilog_files {
    add_files -norecurse $file
}

# Update compile order
update_compile_order -fileset sources_1

# Close project
close_project
