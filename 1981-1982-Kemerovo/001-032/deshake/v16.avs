import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v16 = LSMASHVideoSource(dst_dir + "v16m.mp4")
v16 = v16.convertToRGB32(interlaced=false)
return v16

