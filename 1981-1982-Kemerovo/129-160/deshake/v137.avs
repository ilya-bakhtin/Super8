import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v137 = LSMASHVideoSource(dst_dir + "v137m.mp4")
v137 = v137.convertToRGB32(interlaced=false)
return v137

