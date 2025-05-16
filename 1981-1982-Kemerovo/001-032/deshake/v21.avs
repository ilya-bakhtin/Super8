import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v21 = LSMASHVideoSource(dst_dir + "v21m.mp4")
v21 = v21.convertToRGB32(interlaced=false)
return v21

