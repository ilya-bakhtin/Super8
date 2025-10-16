import("..\..\common.avs")
import("..\1977-1979.avs")
#v210 = LSMASHVideoSource(dst_dir + "v210m.mp4")
v210 = v210.convertToRGB32(interlaced=false)
return v210

