import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v12 = LSMASHVideoSource(dst_dir + "v12m.mp4")
v12 = v12.convertToRGB32(interlaced=false)
return v12

