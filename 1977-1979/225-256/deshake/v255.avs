import("..\..\common.avs")
import("..\1977-1979.avs")
#v255 = LSMASHVideoSource(dst_dir + "v255m.mp4")
v255 = v255.convertToRGB32(interlaced=false)
return v255

