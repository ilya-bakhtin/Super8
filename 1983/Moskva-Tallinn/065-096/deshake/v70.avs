import("..\..\common.avs")
import("..\1983-Moskva-Tallinn.avs")
v70 = LSMASHVideoSource(dst_dir + "v70m.mp4")
v70 = v70.convertToRGB32(interlaced=false)
return v70

