import("..\..\common.avs")
import("..\1977-1979.avs")
#v360 = LSMASHVideoSource(dst_dir + "v360m.mp4")
v360 = v360.convertToRGB32(interlaced=false)
return v360

