import("..\..\1989-sevas.avs")
import("..\..\..\s8_functions.avs")
#v6969 = v6969.autolevels(output_low = 0, output_high = 255, input_low = 50, input_high = 230, autolevel = false)
v6969 = v6969.hist_levels
v6969 = v6969.convertToRGB32(interlaced=false)
return v6969

