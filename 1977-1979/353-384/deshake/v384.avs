import("..\..\common.avs")
import("..\1977-1979.avs")
#v384 = LSMASHVideoSource(dst_dir + "v384m.mp4")
v384 = v384.convertToRGB32(interlaced=false)
return v384

