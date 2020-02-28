read_sdc -scenario "place_and_route" -netlist "optimized" -pin_separator "/" -ignore_errors {C:/GitHub-LSRAM-12.3/Future-Avalanche-Board/Libero_Projects/MiV_AXI_PF_Avalanche_ES/designer/BaseDesign/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {C:\GitHub-LSRAM-12.3\Future-Avalanche-Board\Libero_Projects\MiV_AXI_PF_Avalanche_ES\designer\BaseDesign\BaseDesign_layout_combinational_loops.xml}
report -type slack {C:\GitHub-LSRAM-12.3\Future-Avalanche-Board\Libero_Projects\MiV_AXI_PF_Avalanche_ES\designer\BaseDesign\pinslacks.txt}
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {C:\GitHub-LSRAM-12.3\Future-Avalanche-Board\Libero_Projects\MiV_AXI_PF_Avalanche_ES\designer\BaseDesign\BaseDesign_place_and_route_constraint_coverage.xml}]
set reportfile {C:\GitHub-LSRAM-12.3\Future-Avalanche-Board\Libero_Projects\MiV_AXI_PF_Avalanche_ES\designer\BaseDesign\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp