import("..\..\common.avs")
import("..\1977-1979.avs")
#v300 = LSMASHVideoSource(dst_dir + "v300m.mp4")
v300 = v300.convertToRGB32(interlaced=false)
return v300

