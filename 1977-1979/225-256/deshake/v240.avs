import("..\..\common.avs")
import("..\1977-1979.avs")
#v240 = LSMASHVideoSource(dst_dir + "v240m.mp4")
v240 = v240.convertToRGB32(interlaced=false)
return v240

