import("..\..\common.avs")
import("..\1977-1979.avs")
#v264 = LSMASHVideoSource(dst_dir + "v264m.mp4")
v264 = v264.convertToRGB32(interlaced=false)
return v264

