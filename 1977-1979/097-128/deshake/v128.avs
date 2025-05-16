import("..\..\common.avs")
import("..\1977-1979.avs")
#v128 = LSMASHVideoSource(dst_dir + "v128m.mp4")
v128 = v128.convertToRGB32(interlaced=false)
return v128

