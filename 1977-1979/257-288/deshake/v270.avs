import("..\..\common.avs")
import("..\1977-1979.avs")
#v270 = LSMASHVideoSource(dst_dir + "v270m.mp4")
v270 = v270.convertToRGB32(interlaced=false)
return v270

