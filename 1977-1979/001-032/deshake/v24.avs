import("..\..\common.avs")
import("..\1977-1979.avs")
#v24 = LSMASHVideoSource(dst_dir + "v24m.mp4")
v24 = v24.convertToRGB32(interlaced=false)
return v24

