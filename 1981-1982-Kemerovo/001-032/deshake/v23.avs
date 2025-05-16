import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v23 = LSMASHVideoSource(dst_dir + "v23m.mp4")
v23 = v23.convertToRGB32(interlaced=false)
return v23

