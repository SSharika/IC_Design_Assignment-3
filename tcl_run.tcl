#Open the project (if not already open)
open_project [pwd]/Automation/Project_2.xpr
set_property source_mgmt_mode None [current_project]
    update_compile_order -fileset sources_1

# Get a list of all Verilog files in the code folder
#set verilog_files [glob -nocomplain [pwd]/code/*.v]
set verilog_files [get_files -of_objects [get_filesets sources_1] -filter {FILE_TYPE == Verilog}]


# Loop over each Verilog file/module
foreach verilog_file $verilog_files {
    # Set the top module
    set_property top [string trimright  [file tail $verilog_file] ".v"] [current_fileset]
    
    # Update compile order

    
    # Reset and launch synthesis
    reset_run synth_1
    launch_runs synth_1 -jobs 12
    wait_on_run synth_1
    
    # Reset and launch implementation
    reset_run impl_1
    launch_runs impl_1 -jobs 12
    wait_on_run impl_1
    
    # Create a folder for the module
    set module_name [file rootname $verilog_file]
    file mkdir $module_name
    
    # Save reports in the module folder
    open_run impl_1
    report_power > $module_name/power.txt
    report_timing > $module_name/timing.txt
    report_utilization > $module_name/utilization.txt
}

# Close the project
close_project
