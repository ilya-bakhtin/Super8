import("..\..\common.avs")
import("..\1977-1979.avs")
#v256 = LSMASHVideoSource(dst_dir + "v256m.mp4")
v256 = v256.convertToRGB32(interlaced=false)
return v256

