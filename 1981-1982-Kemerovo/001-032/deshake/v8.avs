import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v8 = LSMASHVideoSource(dst_dir + "v8m.mp4")
v8 = v8.convertToRGB32(interlaced=false)
return v8

