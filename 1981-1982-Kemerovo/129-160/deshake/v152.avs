import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v152 = LSMASHVideoSource(dst_dir + "v152m.mp4")
v152 = v152.convertToRGB32(interlaced=false)
return v152

