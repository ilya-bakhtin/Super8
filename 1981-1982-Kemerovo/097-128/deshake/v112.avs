import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v112 = LSMASHVideoSource(dst_dir + "v112m.mp4")
v112 = v112.convertToRGB32(interlaced=false)
return v112

