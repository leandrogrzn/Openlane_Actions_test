set ::env(DESIGN_NAME) src

set ::env(VERILOG_FILES) "\
	$::env(DESIGN_DIR)/src.v
 	$::env(DESIGN_DIR)/mux_4a1.v
  	$::env(DESIGN_DIR)/divisor_fr.v
   	$::env(DESIGN_DIR)/deco_siete.v
    	$::env(DESIGN_DIR)/caja_anodos.v"
 
set ::env(DESIGN_IS_CORE) 0

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "clk"
set ::env(CLOCK_PERIOD) "20.0"

set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 200 200" 

set ::env(PL_TARGET_DENSITY) 0.75
set ::env(FP_CORE_UTIL) 85
