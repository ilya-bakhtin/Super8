import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v125 = LSMASHVideoSource(dst_dir + "v125m.mp4")
v125 = v125.convertToRGB32(interlaced=false)
return v125

