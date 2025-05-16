import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v15 = LSMASHVideoSource(dst_dir + "v15m.mp4")
v15 = v15.convertToRGB32(interlaced=false)
return v15

